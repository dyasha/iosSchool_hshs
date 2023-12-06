//
//  ImageService.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 30.11.2023.
//

import UIKit

protocol ImageService {
    func getImage(url: String, completion: @escaping (UIImage?) -> Void)
}

class ImageServiceImp: ImageService {
    private var imageDict: [String: UIImage] = [:]
    private let apiClient: ApiClient
    private let updateQueue = DispatchQueue(label: "ImageServiceQueue")

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
        apiClient.requestImageData(url: url) { [weak self] imageData in
            if let imageData {
                self?.updateQueue.async {
                    let image = UIImage(data: imageData)
                    self?.imageDict[url] = image
                    if (self?.imageDict.count ?? 0) > 50 {
                        self?.imageDict.removeAll()
                    }
                    completion(image)
                }
            }
        }
    }
}

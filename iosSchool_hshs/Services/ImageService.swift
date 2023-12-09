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
        if self.imageDict.count > 50 {
            self.imageDict.removeAll()
        }
        if let image = imageDict[url] {
            completion(image)
            return
        }
        DispatchQueue.global().async {
            self.apiClient.requestImageData(url: url) { [weak self] imageData in
                guard let imageData else {
                    completion(nil)
                    return
                }
                self?.updateQueue.async {
                    let image = UIImage(data: imageData)
                    self?.imageDict[url] = image
                    completion(image)
                }
            }
        }
    }
}

//
//  PodService.swift
//  FiveSixTwoUIKit
//
//  Created by Raghav Mangrola on 3/2/21.
//

import Foundation
import UIKit



protocol PodServiceInterface {
    func getImage(for whale: WhaleProtocol, _ completionHandler: @escaping (_ whale: WhaleProtocol, _ image: UIImage?) -> Void)
}

// Beacause a group of whales are called a pod
class PodService: PodServiceInterface {

    let restClient: RestClientProtocol

    init() {
        self.restClient = RestClient()
    }

    func getImage(for whale: WhaleProtocol,  _ completionHandler: @escaping (WhaleProtocol, UIImage?) -> Void) {
        restClient.get(whale.imageURL, nil, nil) { (data, error) in
            if let error = error {
                // handle error
                return
            }

            if let data = data,
               let image = UIImage(data: data) {
                completionHandler(whale, image)
                return
            }
        }
    }
}

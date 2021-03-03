//
//  RestClient.swift
//  FiveSixTwoUIKit
//
//  Created by Raghav Mangrola on 3/2/21.
//

import Foundation

protocol RestClientProtocol {
    func get(_ path: String, _ parameters: [String: Any]?, _ headers: [String: String]?, _ completionHandler: @escaping (_ data: Data?, _ error: Error?) -> Void)
}

class RestClient: RestClientProtocol {

    // can remove paramaters, headers
    func get(_ path: String, _ parameters: [String : Any]?, _ headers: [String : String]?, _ completionHandler: @escaping (Data?, Error?) -> Void) {

        let url = URL(string: path)

        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
                return
            }

            if let data = data {
                completionHandler(data, nil)
                return
            }
        }

        task.resume()
    }
}

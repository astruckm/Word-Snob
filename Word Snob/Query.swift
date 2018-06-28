//
//  QuerySession.swift
//  Word Snob
//
//  Created by ASM on 6/27/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import Foundation

struct QuerySession {
    func query(at url: URL, withWord word: String, completion: @escaping (Lemma) -> ()) {
        
        let requestValues = [
            "application/json": "Accept",
            appId: "app_id",
            appKey: "app_key"
        ]
        let request = URLRequest(url: url).add(values: requestValues)
        
        let session = URLSession.shared
        _ = session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response,
                let data = data,
                let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                print(response)
                print(jsonData)
            } else {
                print(error)
                print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue))
                print("FAILED")
            }
        }).resume()

        
    }
}



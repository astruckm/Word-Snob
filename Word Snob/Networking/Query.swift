//
//  QuerySession.swift
//  Word Snob
//
//  Created by ASM on 6/27/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import Foundation

struct QuerySession {
    let baseURLString = "https://od-api.oxforddictionaries.com:443/api/v1/entries/"
    
    let requestValues = [
        "application/json": "Accept",
        appId: "app_id",
        appKey: "app_key"
    ]

    func query(inLanguage language: String, withWord word: String, completion: @escaping (RetrieveEntry) -> ()) {
        
        guard let url = URL(string: "\(baseURLString)\(language)/\(word)") else {
            print("Couldn't load url")
            return
        }

        let request = URLRequest(url: url).add(values: requestValues)
        
        let session = URLSession.shared
        _ = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else { return print("Session error: ", error!.localizedDescription) }
            guard response != nil else { return print("No response") }
            
            let decoder = JSONDecoder()
            if let data = data, let jsonData = try? decoder.decode(RetrieveEntry.self, from: data) {
                completion(jsonData)
            } else {
                print("Unable to get JSON from data")
            }
        }).resume()

        
    }
}



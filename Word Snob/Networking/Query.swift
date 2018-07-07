//
//  QuerySession.swift
//  Word Snob
//
//  Created by ASM on 6/27/18.
//  Copyright © 2018 ASM. All rights reserved.
//

//https://od-api.oxforddictionaries.com:443/api/v1/entries/en/ace
//https://od-api.oxforddictionaries.com:443/api/v1/stats/frequency/word/en/?corpus=nmc&trueCase=ace

import Foundation

struct QuerySession {
    let baseURLString = "https://od-api.oxforddictionaries.com:443/api/v1/"
    let language = "en"
    
    let requestValues = [
        "application/json": "Accept",
        appId: "app_id",
        appKey: "app_key"
    ]

    func queryEntry(withWord word: String, completion: @escaping (RetrievedEntry) -> ()) {
        
        let entryEndpointString = "entries/"
        guard let request = createRequest(withWord: word, forEndpoint: entryEndpointString) else { return }
        
        let session = URLSession.shared
        _ = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else { return print("Session error: ", error!.localizedDescription) }
            guard response != nil else { return print("No response") }
            
            let decoder = JSONDecoder()
            if let data = data, let jsonData = try? decoder.decode(RetrievedEntry.self, from: data) {
                completion(jsonData)
            } else {
                print("Unable to get JSON from entry request data")
            }
        }).resume()
    }
    
    func queryFrequency(withWord word: String, completion: @escaping (RetrievedFrequency) -> ()) {
        
//        let frequencyEndpointString = "stats/frequency/"
        guard let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/stats/frequency/word/en/?corpus=nmc&trueCase=\(word)") else {
            print("Couldn't load url")
            return
        }
        let request = URLRequest(url: url).add(values: requestValues)

        
        let session = URLSession.shared
        _ = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard error == nil else { return print("Session error: ", error!.localizedDescription) }
            guard response != nil else { return print("No response") }
            
            let decoder = JSONDecoder()
            if let data = data, let jsonData = try? decoder.decode(RetrievedFrequency.self, from: data) {
                completion(jsonData)
            } else {
                print("Unable to get JSON from frequency request data")
            }
        }).resume()
        
    }
    
    private func createRequest(withWord word: String, forEndpoint endpoint: String) -> URLRequest? {
        guard let url = URL(string: "\(baseURLString)\(endpoint)\(language)/\(word)") else {
            print("Couldn't load url")
            return nil
        }
        let request = URLRequest(url: url).add(values: requestValues)
        return request
    }
}



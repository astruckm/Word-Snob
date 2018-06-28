//
//  ViewController.swift
//  Word Snob
//
//  Created by ASM on 6/26/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let querySession = QuerySession()
    let language = "en"
    let word = "Prognosticate"
    //word id is case sensitive and lowercase is required
    var wordID: String {
        return word.lowercased()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/entries/")!
        guard let url = URL(string: "\(baseURL)\(language)/\(wordID)") else {
            print("Couldn't load url")
            return
        }
        querySession.query(at: url, withWord: wordID) { (lemma) in
            return
        }
        
    }


}






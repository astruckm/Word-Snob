//
//  ViewController.swift
//  Word Snob
//
//  Created by ASM on 6/26/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {
    
    let querySession = QuerySession()
    let language = "en"
    let word = "antediluvian"
    let storedWords = [RetrieveEntry]()
    
    //word id is case sensitive and lowercase is required
    var wordID: String {
        return word.lowercased()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        querySession.query(inLanguage: language, withWord: wordID) { (retrieveEntry) in
            print(retrieveEntry)
            return
        }
        
    }
}

extension WordsTableViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        return cell
    }
}






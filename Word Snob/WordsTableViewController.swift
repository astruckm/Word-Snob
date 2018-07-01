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
    let word = "calumny"
    let storedWords = [RetrieveEntry]()
    
    //word id is case sensitive and lowercase is required
    var wordID: String {
        //TODO: account for things like spaces before and after word, accent marks?, etc.
        return word.lowercased()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar = UISearchBar()
        navigationController?.navigationBar.addSubview(searchBar)
        
        tableView.register(WordCell.self, forCellReuseIdentifier: "wordCellID")
        
        
        querySession.query(inLanguage: language, withWord: wordID) { (retrieveEntry) in
            print(retrieveEntry)
            return
        }
        
    }
}

extension WordsTableViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        super.tableView(tableView, titleForHeaderInSection: section)
        return "Your Words"
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9        //storedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCellID", for: indexPath)
        
        return cell
    }
}






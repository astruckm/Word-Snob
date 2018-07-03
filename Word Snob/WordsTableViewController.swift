//
//  ViewController.swift
//  Word Snob
//
//  Created by ASM on 6/26/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {
    
    let language = "en"
    let word = "calumny"
    
    let querySession = QuerySession()
    var storedWords = [RetrieveEntry]()
    
    //word id is case sensitive and lowercase is required
    var wordID: String {
        //TODO: account for things like spaces before and after word, accent marks?, etc.
        return word.lowercased()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar = UISearchBar(frame: CGRect(x: tableView.bounds.midX-100, y: 5, width: 200, height: 20))
        navigationController?.navigationBar.addSubview(searchBar)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(WordCell.self, forCellReuseIdentifier: "wordCellID")
        tableView.register(WordsHeader.self, forHeaderFooterViewReuseIdentifier: "wordHeaderID")
        tableView.sectionHeaderHeight = 50
        
        querySession.query(inLanguage: language, withWord: wordID) { (retrieveEntry) in
            self.storedWords.append(retrieveEntry)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            return
        }
    }
}

extension WordsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storedWords.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCellID", for: indexPath) as! WordCell
        let index = indexPath.row
        let retrievedEntry = storedWords[index]
        let results = retrievedEntry.results[index]
        
        let headWord = results.word
        cell.headWord.text = headWord
        
        let shortDefinitions = results.lexicalEntries[indexPath.row].entries[indexPath.row].senses[indexPath.row].short_definitions[indexPath.row]
        cell.definition.text = shortDefinitions
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "wordHeaderID")

        return header
    }
}






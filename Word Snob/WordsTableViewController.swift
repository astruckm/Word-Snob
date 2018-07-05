//
//  ViewController.swift
//  Word Snob
//
//  Created by ASM on 6/26/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {
    var newWordBar: UISearchBar?
    
    let language = "en"
    var word = ""
    
    let querySession = QuerySession()
    var storedWords = [RetrieveEntry]()
    
    //word id is case sensitive and lowercase is required
    var wordID: String {
        //TODO: account for things like spaces before and after word, accent marks?, etc.
        return word.lowercased()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newWordBar = UISearchBar(frame: CGRect(x: tableView.bounds.midX-100, y: 5, width: 200, height: 20))
        newWordBar?.setImage(nil, for: .search, state: .normal)
        
        let searchButton = UIButton(frame: CGRect(x: tableView.bounds.midX+110, y: 5, width: 50, height: 20))
        searchButton.layer.cornerRadius = 5
        searchButton.setTitle("Add", for: .normal)
        searchButton.setTitleColor(.blue, for: .normal)
        searchButton.addTarget(self, action: #selector(addWord), for: .touchUpInside)

        navigationController?.navigationBar.addSubview(newWordBar!)
        navigationController?.navigationBar.addSubview(searchButton)
        
        tableView.register(WordCell.self, forCellReuseIdentifier: "wordCellID")
        tableView.register(WordsHeader.self, forHeaderFooterViewReuseIdentifier: "wordHeaderID")
        tableView.sectionHeaderHeight = 50
        
    }
    
    @objc func addWord() {
        word = newWordBar?.text ?? ""
        newWordBar?.text = ""
        querySession.query(inLanguage: language, withWord: wordID) { [unowned self] (retrievedEntry) in
            self.storedWords.append(retrievedEntry)
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
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCellID", for: indexPath) as! WordCell
        let retrievedEntry = storedWords[indexPath.row]
        let results = retrievedEntry.results.first
        
        let headWord = results?.word
        cell.headWord.text = headWord
        
        let shortDefinitions = results?.lexicalEntries[0].entries[0].senses[0].short_definitions[0]
        cell.definition.text = shortDefinitions
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "wordHeaderID")

        return header
    }
}






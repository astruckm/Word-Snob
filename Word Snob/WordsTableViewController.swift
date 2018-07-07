//
//  ViewController.swift
//  Word Snob
//
//  Created by ASM on 6/26/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import UIKit
import CoreData

class WordsTableViewController: UITableViewController {
    var newWordBar: UISearchBar?
    var word = ""
    //word id is case sensitive and lowercase is required
    var wordID: String {
        //TODO: account for things like spaces before and after word, accent marks?, etc.
        return word.lowercased()
    }
    
    let querySession = QuerySession()
    var storedWords = [RetrievedEntry]()
    var storedFrequencies = [RetrievedFrequency]() //Need to combine this w/ storedWords
    var totalScore: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        newWordBar = UISearchBar(frame: CGRect(x: tableView.bounds.midX-100, y: 5, width: 200, height: 20))
        newWordBar?.setImage(nil, for: .search, state: .normal)
        
        let searchButton = UIButton(frame: CGRect(x: tableView.bounds.midX+110, y: 5, width: 50, height: 20))
        searchButton.layer.cornerRadius = 5
        searchButton.setTitle("Add", for: .normal)
        searchButton.setTitleColor(.blue, for: .normal)
        searchButton.addTarget(self, action: #selector(addWord), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(addInFrequencyToWord), for: .touchUpInside)

        navigationController?.navigationBar.addSubview(newWordBar!)
        navigationController?.navigationBar.addSubview(searchButton)
        
        tableView.register(WordCell.self, forCellReuseIdentifier: "wordCellID")
        tableView.register(WordsHeader.self, forHeaderFooterViewReuseIdentifier: "wordHeaderID")
        tableView.sectionHeaderHeight = 50
        
    }
    
    @objc func addWord() {
        word = newWordBar?.text ?? ""
        newWordBar?.text = ""
        querySession.queryEntry(withWord: wordID) { [weak self] (retrievedEntry) in
            self?.storedWords.append(retrievedEntry)
//            DispatchQueue.main.async {
//                self?.tableView.reloadData()
//            }
            return
        }
    }
    
    @objc func addInFrequencyToWord() {
        querySession.queryFrequency(withWord: wordID) { [weak self] (retrievedFrequency) in
            self?.storedFrequencies.append(retrievedFrequency)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
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
        cell.headWord.text = headwordFromRetrievedEntry(retrievedEntry)
        
        let shortDefinitions = definitionFromRetrievedEntry(retrievedEntry)
        cell.definition.text = shortDefinitions
        
        if !storedFrequencies.isEmpty {
            let retrievedFrequency = storedFrequencies[indexPath.row]
            let infrequency = inFrequencyFromRetrievedFrequency(retrievedFrequency)
            totalScore += infrequency
            cell.infrequency.text = String(infrequency)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "wordHeaderID") as! WordsHeader
        header.totalScoreLabel.text = "Total Score: " + String(totalScore)
        return header
    }
}






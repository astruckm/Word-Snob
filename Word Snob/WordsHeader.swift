//
//  WordsHeader.swift
//  Word Snob
//
//  Created by ASM on 6/30/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import UIKit

class WordsHeader: UITableViewHeaderFooterView {
    let headWord: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        addSubview(headWord)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headWord]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headWord]))
    }

    
    
    
}

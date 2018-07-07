//
//  WordsHeader.swift
//  Word Snob
//
//  Created by ASM on 6/30/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import UIKit

class WordsHeader: UITableViewHeaderFooterView {
    let title: UILabel = {
        let label = UILabel()
        label.text = "Words"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let totalScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Score: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16.0)
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
        addSubview(title)
        addSubview(totalScoreLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-[v1(==128)]-32-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": title, "v1": totalScoreLabel]))
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        totalScoreLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }

    
    
    
}

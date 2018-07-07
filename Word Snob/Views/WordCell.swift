//
//  WordTableViewCell.swift
//  Word Snob
//
//  Created by ASM on 6/30/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import UIKit

class WordCell: UITableViewCell {
    
    let word = "instantiate word here"
    
    let headWord: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let definition: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = label.font.withSize(12)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let infrequency: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        addSubview(headWord)
        addSubview(definition)
        addSubview(infrequency)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0(==80)]-8-[v1(==150)]-16-[v2]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headWord, "v1": definition, "v2": infrequency]))
        headWord.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        definition.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        infrequency.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}

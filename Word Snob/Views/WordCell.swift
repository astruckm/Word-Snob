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
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0(>=80)]-8-[v1(>=150)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headWord, "v1": definition]))
        headWord.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        definition.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

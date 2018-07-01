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
        label.text = "test"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        
    }
    
    private func setUpViews() {
        addSubview(headWord)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headWord]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headWord]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

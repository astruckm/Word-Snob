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
        return label
    }()
    
    let moreInfo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("More Info", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(moreInfo)
        addSubview(definition)
        
        moreInfo.addTarget(self, action: #selector(getMoreInfo), for: .touchUpInside)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0(>=80)]-8-[v1(>=150)]-20-[v2(80)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headWord, "v1": definition, "v2": moreInfo]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headWord]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": moreInfo]))
    }
    
    @objc private func getMoreInfo() {
        print("moreInfo tapped")
    }
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

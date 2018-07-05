//
//  JSONResponse.swift
//  Word Snob
//
//  Created by ASM on 6/27/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import Foundation

//*******************************
//MARK: Word definition endpoint
//*******************************

//Top level
struct RetrieveEntry: Decodable {
    let results: [HeadwordEntry]
}

//2nd level
struct HeadwordEntry: Decodable {
    let lexicalEntries: [LexicalEntry]
    let word: String
}

//3rd level
struct LexicalEntry: Decodable {
    let entries: [Entry]
}

//4th level
struct Entry: Decodable {
    let senses: [Sense]
}

//5th level
struct Sense: Decodable {
    let short_definitions: [String]
}

struct Pronunciation: Decodable {
    //Inline Model 1
}


//*******************************
//MARK: Frequency endpoint
//*******************************





//TODO:    let frequency: Double






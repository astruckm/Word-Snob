//
//  JSONResponse.swift
//  Word Snob
//
//  Created by ASM on 6/27/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import Foundation

//Top level
struct RetrieveEntry: Decodable {
//    let metadata: [String: String]
    let results: [HeadwordEntry]
    
    //2nd level
    struct HeadwordEntry: Decodable {
//        let id: String
//        let language: String
        let lexicalEntries: [LexicalEntry]
//        let pronunciations: [Pronunciation]
//        let type: String?
        let word: String
        
        //3rd level
        struct LexicalEntry: Decodable {
//            let derivativeOf: [RelatedEntry]
//            let derivatives: [RelatedEntry]
            let entries: [Entry]
//            let grammaticalFeatures: [GrammaticalFeatures]
//            let language: String
//            let lexicalCategory: String
//            let notes: [CategorizedText]
//            let pronunciations: [Pronunciation]
//            let text: String
//            let variantForms: [VariantForm]
            
            struct RelatedEntry: Decodable {
            }
            
            //4th level
            struct Entry: Decodable {
//                let etymologies: [String]
//                let grammaticalFeatures: [GrammaticalFeatures]
//                let homographNumber: String?
//                let notes: [CategorizedText]
//                let pronunciations: [Pronunciation]
                let senses: [Sense]
//                let variantForms: [VariantForm]
                
                //5th level
                struct Sense: Decodable {
                    let short_definitions: [String]
                }
                
            }
            
            struct GrammaticalFeatures: Decodable {
            }
            
            struct CategorizedText: Decodable {
            }
            
            struct VariantForm: Decodable {
            }
        }
        
        struct Pronunciation: Decodable {
            //Inline Model 1
        }
    }

}


//TODO:    let frequency: Double
    

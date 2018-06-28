//
//  Lemma.swift
//  Word Snob
//
//  Created by ASM on 6/27/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import Foundation

struct Lemma: Codable {
    let headWord: String
    let definitions: String
//    let frequency: Double
    
    enum CodingKeys: String, CodingKey {
        case headWord = "id"
        case definitions
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        headWord = try valueContainer.decode(String.self, forKey: CodingKeys.headWord)
        definitions = try valueContainer.decode(String.self, forKey: CodingKeys.definitions)
    }
    
}


/*
 <NSHTTPURLResponse: 0x60400002cba0> { URL: https://od-api.oxforddictionaries.com:443/api/v1/entries/en/prognosticate } { Status Code: 200, Headers {
 <NSHTTPURLResponse: 0x60400002cba0> { URL: https://od-api.oxforddictionaries.com:443/api/v1/entries/en/prognosticate } { Status Code: 200, Headers {
 Connection =     (
 "keep-alive"
 );
 "Content-Length" =     (
 3471
 );
 "Content-Type" =     (
 "application/json;charset=utf-8"
 );
 Date =     (
 "Wed, 27 Jun 2018 03:02:18 GMT"
 );
 Server =     (
 "openresty/1.9.7.4"
 );
 version =     (
 "v1.10.0-19-g9c8abf9"
 );
 } }
 {
 metadata =     {
 provider = "Oxford University Press";
 };
 results =     (
 {
 id = prognosticate;
 language = en;
 lexicalEntries =             (
 {
 derivatives =                     (
 {
 id = prognosticative;
 text = prognosticative;
 },
 {
 id = prognosticatory;
 text = prognosticatory;
 },
 {
 id = prognosticable;
 text = prognosticable;
 }
 );
 entries =                     (
 {
 etymologies =                             (
 "late Middle English: from medieval Latin prognosticat-, from the verb prognosticare \U2018make a prediction\U2019 (see prognostic)"
 );
 grammaticalFeatures =                             (
 {
 text = Transitive;
 type = Subcategorization;
 },
 {
 text = Present;
 type = Tense;
 }
 );
 homographNumber = 000;
 senses =                             (
 {
 definitions =                                     (
 "foretell or prophesy (a future event)"
 );
 examples =                                     (
 {
 text = "the economists were prognosticating financial Armageddon";
 }
 );
 id = "m_en_gbus0819470.005";
 "short_definitions" =                                     (
 "foretell or prophesy"
 );
 thesaurusLinks =                                     (
 {
 "entry_id" = prognosticate;
 "sense_id" = "t_en_gb0011668.001";
 }
 );
 }
 );
 }
 );
 language = en;
 lexicalCategory = Verb;
 pronunciations =                     (
 {
 audioFile = "http://audio.oxforddictionaries.com/en/mp3/prognosticate_gb_1_8.mp3";
 dialects =                             (
 "British English"
 );
 phoneticNotation = IPA;
 phoneticSpelling = "pr\U0252\U0261\U02c8n\U0252st\U026ake\U026at";
 }
 );
 text = prognosticate;
 }
 );
 type = headword;
 word = prognosticate;
 }
 );
 }
 */

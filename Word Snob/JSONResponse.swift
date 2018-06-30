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
    let metadata: [String: String]
    let results: [HeadwordEntry]
}

//2nd level
struct HeadwordEntry: Decodable {
//    let id: String
//    let language: String
//    let lexicalEntries: [LexicalEntries]
//    let pronunciations: [Pronunciations]
//    let type: String?
//    let word: String
}

//3rd level
struct LexicalEntries: Decodable {
//    let entries: [Entries]
//    let language: String
//    let lexicalCategory: String
//    let text: String
}

struct Pronunciations: Decodable {
    //Inline Model 1
}

//4th level
struct Entries: Decodable {
//    let etymologies: [String]
//    let grammaticalFeatures: [GrammaticalFeatures]
//    let homographNumber: String
//    let senses: [Senses]
}

//5th level
struct Senses: Decodable {
    
}

struct GrammaticalFeatures: Decodable {
    
}

/*
 RetrieveEntry {
 metadata (object, optional):
 
 Additional Information provided by OUP ,
 results (Array[HeadwordEntry], optional):
 
 A list of entries and all the data related to them
 }
 HeadwordEntry {
 id (string):
 
 The identifier of a word ,
 language (string):
 
 IANA language code ,
 lexicalEntries (Array[lexicalEntry]):
 
 A grouping of various senses in a specific language, and a lexical category that relates to a word ,
 pronunciations (PronunciationsList, optional),
 type (string, optional):
 
 The json object type. Could be 'headword', 'inflection' or 'phrase' ,
 word (string):
 
 A given written or spoken realisation of a an entry, lowercased.
 }
 lexicalEntry {
 derivativeOf (ArrayOfRelatedEntries, optional):
 
 Other words from which this one derives ,
 derivatives (ArrayOfRelatedEntries, optional):
 
 Other words from which their Sense derives ,
 entries (Array[Entry], optional),
 grammaticalFeatures (GrammaticalFeaturesList, optional),
 language (string):
 
 IANA language code ,
 lexicalCategory (string):
 
 A linguistic category of words (or more precisely lexical items), generally defined by the syntactic or morphological behaviour of the lexical item in question, such as noun or verb ,
 notes (CategorizedTextList, optional),
 pronunciations (PronunciationsList, optional),
 text (string):
 
 A given written or spoken realisation of a an entry. ,
 variantForms (VariantFormsList, optional):
 
 Various words that are used interchangeably depending on the context, e.g 'a' and 'an'
 }
 PronunciationsList [
 Inline Model 1
 ]
 ArrayOfRelatedEntries [
 Inline Model 2
 ]
 Entry {
 etymologies (arrayofstrings, optional):
 
 The origin of the word and the way in which its meaning has changed throughout history ,
 grammaticalFeatures (GrammaticalFeaturesList, optional),
 homographNumber (string, optional):
 
 Identifies the homograph grouping. The last two digits identify different entries of the same homograph. The first one/two digits identify the homograph number. ,
 notes (CategorizedTextList, optional),
 pronunciations (PronunciationsList, optional),
 senses (Array[Sense], optional):
 
 Complete list of senses ,
 variantForms (VariantFormsList, optional):
 
 Various words that are used interchangeably depending on the context, e.g 'a' and 'an'
 }
 GrammaticalFeaturesList [
 Inline Model 3
 ]
 CategorizedTextList [
 Inline Model 4
 ]
 VariantFormsList [
 Inline Model 5
 ]
 Inline Model 1 {
 audioFile (string, optional):
 
 The URL of the sound file ,
 dialects (arrayofstrings, optional):
 
 A local or regional variation where the pronunciation occurs, e.g. 'British English' ,
 phoneticNotation (string, optional):
 
 The alphabetic system used to display the phonetic spelling ,
 phoneticSpelling (string, optional):
 
 Phonetic spelling is the representation of vocal sounds which express pronunciations of words. It is a system of spelling in which each letter represents invariably the same spoken sound ,
 regions (arrayofstrings, optional):
 
 A particular area in which the pronunciation occurs, e.g. 'Great Britain'
 }
 Inline Model 2 {
 domains (arrayofstrings, optional):
 
 A subject, discipline, or branch of knowledge particular to the Sense ,
 id (string):
 
 The identifier of the word ,
 language (string, optional):
 
 IANA language code specifying the language of the word ,
 regions (arrayofstrings, optional):
 
 A particular area in which the pronunciation occurs, e.g. 'Great Britain' ,
 registers (arrayofstrings, optional):
 
 A level of language usage, typically with respect to formality. e.g. 'offensive', 'informal' ,
 text (string)
 }
 arrayofstrings [
 string
 ]
 Sense {
 crossReferenceMarkers (arrayofstrings, optional):
 
 A grouping of crossreference notes. ,
 crossReferences (CrossReferencesList, optional),
 definitions (arrayofstrings, optional):
 
 A list of statements of the exact meaning of a word ,
 domains (arrayofstrings, optional):
 
 A subject, discipline, or branch of knowledge particular to the Sense ,
 examples (ExamplesList, optional),
 id (string, optional):
 
 The id of the sense that is required for the delete procedure ,
 notes (CategorizedTextList, optional),
 pronunciations (PronunciationsList, optional),
 regions (arrayofstrings, optional):
 
 A particular area in which the Sense occurs, e.g. 'Great Britain' ,
 registers (arrayofstrings, optional):
 
 A level of language usage, typically with respect to formality. e.g. 'offensive', 'informal' ,
 short_definitions (arrayofstrings, optional):
 
 A list of short statements of the exact meaning of a word ,
 subsenses (Array[Sense], optional):
 
 Ordered list of subsenses of a sense ,
 thesaurusLinks (Array[thesaurusLink], optional):
 
 Ordered list of links to the Thesaurus Dictionary ,
 translations (TranslationsList, optional),
 variantForms (VariantFormsList, optional):
 
 Various words that are used interchangeably depending on the context, e.g 'duck' and 'duck boat'
 }
 Inline Model 3 {
 text (string),
 type (string)
 }
 Inline Model 4 {
 id (string, optional):
 
 The identifier of the word ,
 text (string):
 
 A note text ,
 type (string):
 
 The descriptive category of the text
 }
 Inline Model 5 {
 regions (arrayofstrings, optional):
 
 A particular area in which the variant form occurs, e.g. 'Great Britain' ,
 text (string)
 }
 CrossReferencesList [
 Inline Model 6
 ]
 ExamplesList [
 Inline Model 7
 ]
 thesaurusLink {
 entry_id (string):
 
 identifier of a word ,
 sense_id (string):
 
 identifier of a sense
 }
 TranslationsList [
 Inline Model 8
 ]
 Inline Model 6 {
 id (string):
 
 The word id of cooccurrence ,
 text (string):
 
 The word of cooccurrence ,
 type (string):
 
 The type of relation between the two words. Possible values are 'close match', 'related', 'see also', 'variant spelling', and 'abbreviation' in case of crossreferences, or 'pre', 'post' in case of collocates.
 }
 Inline Model 7 {
 definitions (arrayofstrings, optional):
 
 A list of statements of the exact meaning of a word ,
 domains (arrayofstrings, optional):
 
 A subject, discipline, or branch of knowledge particular to the Sense ,
 notes (CategorizedTextList, optional),
 regions (arrayofstrings, optional):
 
 A particular area in which the pronunciation occurs, e.g. 'Great Britain' ,
 registers (arrayofstrings, optional):
 
 A level of language usage, typically with respect to formality. e.g. 'offensive', 'informal' ,
 senseIds (arrayofstrings, optional):
 
 The list of sense identifiers related to the example. Provided in the sentences endpoint only. ,
 text (string),
 translations (TranslationsList, optional)
 }
 Inline Model 8 {
 domains (arrayofstrings, optional):
 
 A subject, discipline, or branch of knowledge particular to the translation ,
 grammaticalFeatures (GrammaticalFeaturesList, optional),
 language (string):
 
 IANA language code specifying the language of the translation ,
 notes (CategorizedTextList, optional),
 regions (arrayofstrings, optional):
 
 A particular area in which the translation occurs, e.g. 'Great Britain' ,
 registers (arrayofstrings, optional):
 
 A level of language usage, typically with respect to formality. e.g. 'offensive', 'informal' ,
 text (string)
 }
*/

//TODO:    let frequency: Double
    

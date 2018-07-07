//
//  Word.swift
//  Word Snob
//
//  Created by ASM on 7/3/18.
//  Copyright © 2018 ASM. All rights reserved.
//

import Foundation

//some struct or class for a Word
struct Word: Codable {
    let word: String
    let definition: String
    let infrequency: Double
}

func headwordFromRetrievedEntry(_ retrievedEntry: RetrievedEntry) -> String {
    if let result = retrievedEntry.results.first {
        let headword = result.word
        return headword
    }
    print("Could not unwrap a headword")
    return ""
}

func definitionFromRetrievedEntry(_ retrievedEntry: RetrievedEntry) -> String {
    if let result = retrievedEntry.results.first, let lexicalEntry = result.lexicalEntries.first, let entry = lexicalEntry.entries.first, let sense = entry.senses.first, let definition = sense.short_definitions.first {
        return definition
    }
    print("Could not unwrap a definition")
    return ""
}

func inFrequencyFromRetrievedFrequency(_ retrievedFrequency: RetrievedFrequency) -> Double {
    let frequency = retrievedFrequency.result.normalizedFrequency
    let rawInfrequency = sqrt(1/Double(frequency))
    let infrequency = rawInfrequency.rounded()
    return infrequency
}







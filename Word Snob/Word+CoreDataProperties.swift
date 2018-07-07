//
//  Word+CoreDataProperties.swift
//  Word Snob
//
//  Created by ASM on 7/6/18.
//  Copyright © 2018 ASM. All rights reserved.
//
//

import Foundation
import CoreData


extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word")
    }

    @NSManaged public var definition: String?
    @NSManaged public var headword: String?
    @NSManaged public var infrequencyScore: Double

}

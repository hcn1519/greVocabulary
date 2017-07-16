//
//  Word+CoreDataProperties.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//
//

import Foundation
import CoreData


extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word")
    }

    @NSManaged public var title: String?
    @NSManaged public var meaning: String?
    @NSManaged public var wordId: Int16
    @NSManaged public var alreadyKnow: Bool
    @NSManaged public var toDay: Day?
    @NSManaged public var toWordScore: WordScore?
    @NSManaged public var toTest: Test?

}

//
//  WordScore+CoreDataProperties.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 29..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import Foundation
import CoreData


extension WordScore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WordScore> {
        return NSFetchRequest<WordScore>(entityName: "WordScore")
    }

    @NSManaged public var correctCount: Int16
    @NSManaged public var wordScoreId: Int16
    @NSManaged public var wrongCount: Int16
    @NSManaged public var toWord: Word?

}

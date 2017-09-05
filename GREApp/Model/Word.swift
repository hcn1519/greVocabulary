//
//  Word.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 9. 2..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import Foundation
import RealmSwift

class Word: Object {
    dynamic var wordId = 0
    dynamic var dayId = 0
    dynamic var title = ""
    dynamic var meaning = ""
    dynamic var alreadyKnow = false

    dynamic var correctCount = 0
    dynamic var wrongCount = 0

    override class func primaryKey() -> String? {
        return "wordId"
    }
}

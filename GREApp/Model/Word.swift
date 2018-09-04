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
    @objc dynamic var wordId = 0
    @objc dynamic var dayId = 0
    @objc dynamic var title = ""
    @objc dynamic var meaning = ""
    @objc dynamic var alreadyKnow = false

    @objc dynamic var correctCount = 0
    @objc dynamic var wrongCount = 0

    override class func primaryKey() -> String? {
        return "wordId"
    }
}

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
    dynamic var dayId = 0
    dynamic var title = ""
    dynamic var meaning = ""
    dynamic var wordId = 0
    dynamic var correctCount = 0
    dynamic var wrongCount = 0

//    init(dayId: Int, title: String, meaning: String, wordId: Int, correctCount: Int, wrongCount: Int) {
//        self.dayId = dayId
//        self.title = title
//        self.meaning = meaning
//        self.wordId = wordId
//        self.correctCount = correctCount
//        self.wrongCount = wrongCount
//    }

}

//
//  PageDataSource.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 9. 5..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import Foundation
import RealmSwift

class PageDataSource {
    private let realm = try! Realm()
    private var words: Results<Word>!
    private var date: Int?
    private var today: Day?

    init() {}

    var getWords: Results<Word>? {
        return self.words
    }
    var getToday: Day? {
        return self.today
    }

    func setWords(date: Int?, isOnlyWrongWords: Bool?) {
        if let date = date {
            // 배우는용
            words = realm.objects(Word.self).filter("dayId == %d", date)
        } else {
            // 테스트용
            guard let wrongWords = isOnlyWrongWords else { return }

            if wrongWords {
                // 모르는 단어만

            } else {
                // 모든 단어 랜덤

            }
        }
    }

    func setToday(date: Int?) {
        if let date = date {
            today = realm.object(ofType: Day.self, forPrimaryKey: date)
        }
    }
}

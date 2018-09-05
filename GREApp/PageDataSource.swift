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
    private var today: Day?

    private(set) var testWords: [Word] = []

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
            words = realm.objects(Word.self).filter("dayId == \(date)")

        } else {
            // 단어 테스트용
            guard let wrongWords = isOnlyWrongWords else { return }

            if wrongWords {
                // 모르는 단어만
                if let notKnowWords = getLimitedWords(limit: 30) {
                    testWords = notKnowWords
                    print(testWords)
                }
            }
        }
    }

    func setToday(date: Int?) {
        if let date = date {
            today = realm.object(ofType: Day.self, forPrimaryKey: date)
        }
    }

    func getLimitedWords(limit: Int) -> [Word]? {
        let rawWords = realm.objects(Word.self).filter("alreadyKnow == %@", false)

        if rawWords.count == 0 {
            return nil
        }

        let testCount = rawWords.count > 30 ? 30 : rawWords.count

        let indexSet = randomIndex(totalCount: rawWords.count, resultCount: testCount)

        return indexSet.compactMap { index in
            return rawWords[index]
        }
    }

    func randomIndex(totalCount: Int, resultCount: Int) -> [Int] {
        var set = Set<Int>()

        while set.count != resultCount {
            let index = Int(arc4random_uniform(UInt32(totalCount)))
            set.insert(index)
        }
        return Array(set)
    }
}

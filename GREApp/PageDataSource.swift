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
    private(set) var words: Results<Word>!
    private var today: Day?

    private(set) var testWords: [Word] = []

    init() {}

    var getWords: Results<Word>? {
        return self.words
    }
    var getToday: Day? {
        return self.today
    }

    func setWords(date: Int?, isOnlyWrongWords: Bool?, isListing: Bool? = nil) {
        if let _ = isListing {
            words = realm.objects(Word.self).filter("alreadyKnow == %@", false)
            return
        }

        if let date = date {
            // 배우는용
            words = realm.objects(Word.self).filter("dayId == \(date)")

        } else {
            // 단어 테스트용
            guard let wrongWords = isOnlyWrongWords else { return }

            let rawWords = wrongWords ? realm.objects(Word.self).filter("alreadyKnow == %@", false) :
                realm.objects(Word.self).filter("correctCount != 0 OR wrongCount != 0")

            if let notKnowWords = getLimitedWords(words: rawWords, limit: 30) {
                testWords = notKnowWords
            }
        }
    }

    func setToday(date: Int?) {
        if let date = date {
            today = realm.object(ofType: Day.self, forPrimaryKey: date)
        }
    }

    func getLimitedWords(words rawWords: Results<Word>, limit: Int) -> [Word]? {

        if rawWords.count == 0 {
            return nil
        }

        let testCount = rawWords.count > 30 ? 30 : rawWords.count

        let indexSet = randomIndex(totalCount: rawWords.count, resultCount: testCount)

        return indexSet.compactMap { index in
            return rawWords[index]
        }
    }

    func updateWords(completion: @escaping () -> Void) {
        guard UserDefaults.standard.object(forKey: "isTestDataUpdated") != nil else {
            completion()
            return
        }

        let finishedDay = realm.objects(Day.self).filter("isFinished == %@", true)

        var totalCount = 0
        finishedDay.forEach { day in
            let objectList = realm.objects(Word.self).filter("dayId == %@", day.dayId)
            totalCount += objectList.count
        }

        var finishCount = 0
        finishedDay.forEach { day in

            let objectList = realm.objects(Word.self).filter("dayId == %@", day.dayId)

            try! realm.write {
                objectList.forEach {
                    $0.correctCount += 1
                    finishCount += 1
                    if finishCount == totalCount {
                        UserDefaults.standard.set(true, forKey: "isTestDataUpdated")
                        completion()
                    }
                }
            }
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

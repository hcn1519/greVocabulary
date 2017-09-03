//
//  DailyViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit
import RealmSwift

class DailyViewController: UIViewController {
    let dailyCellId = "dailyCellId"

    var days: [Day] = []
    var wordList: [Word] = []

    let realm = try! Realm()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        try! realm.write {
            realm.deleteAll()
        }

        generateTestData()

        parseWordCSV()

//        let result = realm.objects(Word.self)

    }

    func parseWordCSV(){

        // csv파일 경로 설정
        let path = Bundle.main.path(forResource: "testVocas", ofType: "csv")!

        do {
            // csv 파일 읽기
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows

            // 각 row 별로 데이터를 위에 만들어 놓은 array에 append
            for row in rows {
                guard let dayId = Int(row["dayId"]!) else { return }
                guard let wordId = Int(row["wordId"]!) else { return }
                guard let title = row["title"] else { return }
                guard let meaning = row["meaning"] else { return }

                guard let correct = Int(row["correctCount"]!) else { return }
                guard let wrong = Int(row["wrongCount"]!) else { return }

                let word = Word()

                word.dayId = dayId
                word.wordId = wordId
                word.title = title
                word.meaning = meaning

                word.correctCount = correct
                word.wrongCount = wrong

                wordList.append(word)

                try! realm.write {
                    realm.add(word)
                }
            }

        } catch let err as NSError {
            print(err.debugDescription)
        }

    }
}

// MARK: DataSource
extension DailyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dailyCellId, for: indexPath) as! DailyTestCell

        let item = days[indexPath.row]
        cell.configureCell(day: item)
        
        return cell
    }
    
    
}

// MARK: segue 데이터 전송
extension DailyViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "dailyToCover", sender: indexPath.row + 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dailyToCover" {
            if let destination = segue.destination as? DailyCoverViewController {
                
                destination.date = sender as? Int
            }
        }
    }
}

// MARK: test 데이터 생성
extension DailyViewController {
    
    func generateTestData() {
        
        let day1 = Day()

        day1.dayId = 1
        day1.isFinished = false
        day1.finishedDate = Date()

        let day2 = Day()
        
        day2.dayId = 2
        day2.isFinished = false
        day2.finishedDate = Date()
        
        let day3 = Day()
        
        day3.dayId = 3
        day3.isFinished = false
        day3.finishedDate = Date()

        days.append(day1)
        days.append(day2)
        days.append(day3)

        try! realm.write {
            realm.add(day1)
            realm.add(day2)
            realm.add(day3)
        }
    }
}

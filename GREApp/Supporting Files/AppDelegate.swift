//
//  AppDelegate.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let realm = try! Realm()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // 첫 실행시에만 데이터 생성
        if !UserDefaults.standard.bool(forKey: "hasLaunchedOnce") {
            UserDefaults.standard.set(true, forKey: "hasLaunchedOnce")
            generateDay()
            parseWordCSV()
        }

        return true
    }
    func generateDay() {

        for i in 1...50 {
            let day = Day()
            day.dayId = i
            day.isFinished = false
            day.finishedDate = nil

            try! realm.write {
                realm.add(day)
            }
        }
    }

    func parseWordCSV(){

        // csv파일 경로 설정
        let path = Bundle.main.path(forResource: "grevocas_ver1", ofType: "csv")!

        do {
            // csv 파일 읽기
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows

            // 각 row 별로 데이터를 위에 만들어 놓은 array에 append
            for row in rows {

                let idOfDay = row["dayId"]?.replacingOccurrences(of: " ", with: "")

                guard let dayId = Int(idOfDay!) else { return }
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

                try! realm.write {
                    realm.add(word)
                }
            }
        
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
}



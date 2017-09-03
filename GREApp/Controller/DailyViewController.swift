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

    var days: Results<Day>!

    let realm = try! Realm()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        days = realm.objects(Day.self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.collectionView.reloadData()
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
    
    
}

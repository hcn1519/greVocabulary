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
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        days = realm.objects(Day.self)

        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3058823529, green: 0.7294117647, blue: 0.2901960784, alpha: 1)

        if #available(iOS 11, *) {

        } else {
            topConstraint.constant = -60
        }
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dailyCellId, for: indexPath) as! DailyLearnCell

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


// MARK: FlowLayout
extension DailyViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = (self.view.bounds.size.width - 30 - 30) / 3
        return CGSize(width: length, height: length)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}

//
//  DailyLearnCell.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 9. 4..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class DailyLearnCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    required init?(coder aDecoder:NSCoder){
        super.init(coder: aDecoder)

        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.clear.cgColor
    }

    func configureCell(day: Day) {
        self.titleLabel.text = "Day \(day.dayId)"

        if day.isFinished {
            layer.backgroundColor = UIColor(red: 237/255, green: 143/255, blue: 84/255, alpha: 1.0).cgColor
        } else {
            layer.backgroundColor = UIColor(red: 248/255, green: 204/255, blue: 180/255, alpha: 1.0).cgColor
        }
    }

}

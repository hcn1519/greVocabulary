//
//  DailyTestCell.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class DailyTestCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    required init?(coder aDecoder:NSCoder){
        super.init(coder: aDecoder)
        
        layer.backgroundColor = UIColor(red: 41/255, green: 98/255, blue: 255/255, alpha: 1.0).cgColor
        layer.cornerRadius = 5.0
        
    }
    
    func configureCell(day: Day) {
        self.titleLabel.text = "Day \(day.dayId)"
        
        if day.isFinished {
            layer.backgroundColor = UIColor(red: 41/255, green: 98/255, blue: 255/255, alpha: 1.0).cgColor
        } else {
            layer.backgroundColor = UIColor(red: 158/255, green: 158/255, blue: 158/255, alpha: 1.0).cgColor
        }
    }
    
}

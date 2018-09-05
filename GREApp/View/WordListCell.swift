//
//  WordListCell.swift
//  GREApp
//
//  Created by 홍창남 on 2018. 9. 5..
//  Copyright © 2018년 홍창남. All rights reserved.
//

import UIKit

class WordListCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!

    func configureCell(word: Word) {
        dayLabel.text = "\(word.dayId)"
        wordLabel.text = word.title
        meaningLabel.text = word.meaning
    }
}

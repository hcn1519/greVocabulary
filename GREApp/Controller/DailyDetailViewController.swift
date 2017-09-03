//
//  DailyDetailViewController
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit
import RealmSwift

class DailyDetailViewController: UIViewController {
    
    var parentController: DailyPageViewController?
    var pageIndex: Int = 0
    var word: Word?
    var backgroundShouldChange = true
    
    let realm = try! Realm()
    var currentWord: Word?

    let color30 = UIColor(red: 144/255, green: 202/255, blue: 249/255, alpha: 1.0)
    let color60 = UIColor(red: 66/255, green: 165/255, blue: 245/255, alpha: 1.0)
    let color90 = UIColor(red: 30/255, green: 136/255, blue: 229/255, alpha: 1.0)

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var alreadyKnowButton: UIButton!
    @IBOutlet weak var notAlreadyKnowButton: UIButton!
    @IBOutlet weak var progressBar: UIView!

    @IBOutlet weak var btnBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressBarWidthConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let word = word {
            titleLabel.text = "\(word.title)"
        }

        currentWord = realm.object(ofType: Word.self, forPrimaryKey: pageIndex)


        progressBar.layer.cornerRadius = 3.0

        if pageIndex + 1 < 10 {
            progressBar.backgroundColor = color30
        } else if pageIndex + 1 >= 10 && pageIndex + 1 < 20 {
            progressBar.backgroundColor = color60
        } else {
            progressBar.backgroundColor = color90
        }
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        btnBottomConstraint.constant = self.view.bounds.height / 5

        progressBarWidthConstraint.constant = (self.view.bounds.width / 30) * CGFloat(pageIndex + 1)
    }

    // 배우기를 취소하고 돌아가기
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        
        let alert: UIAlertController = UIAlertController(title: "메인 화면으로", message: "여기서 끝낼 경우 오늘의 단어가 완료되지 않습니다.", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "끝내기", style: .destructive, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        })
        
        let cancel = UIAlertAction(title: "돌아가기", style: .default, handler: {_ in
            alert.dismiss(animated: true, completion: nil)
        })
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // 뜻 보여주기
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        
        if backgroundShouldChange {
            
            meaningLabel.text = word?.meaning
            meaningLabel.font = UIFont(name: "Helvetica Neue", size: 17)
            meaningLabel.textColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
            
            alreadyKnowButton.isHidden = false
            notAlreadyKnowButton.isHidden = false
            
            UIView.transition(with: self.view, duration: 0.25, options: .transitionCrossDissolve, animations: {
                [weak self] in
                self?.view.layoutIfNeeded()
            }, completion: nil)
            
            backgroundShouldChange = false
        }
    }

    @IBAction func alreadyKnowBtnTapped(_ sender: UIButton) {
        saveScore(isKnow: true)
        parentController?.goToNextPage()
    }

    @IBAction func notAlreadyKnowBtnTapped(_ sender: UIButton) {
        saveScore(isKnow: false)
        parentController?.goToNextPage()
    }

    func saveScore(isKnow: Bool) {
        if isKnow {
            try! realm.write {
                currentWord?.correctCount += 1
            }
        } else {
            try! realm.write {
                currentWord?.wrongCount += 1
            }
        }
    }

}

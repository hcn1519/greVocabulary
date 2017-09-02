//
//  DailyDetailViewController
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class DailyDetailViewController: UIViewController {
    
    var parentController: DailyPageViewController?
    var pageIndex: Int = 0
    var word: Word?
    var backgroundShouldChange = true
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var alreadyKnowButton: UIButton!
    @IBOutlet weak var notAlreadyKnowButton: UIButton!
    
    @IBOutlet weak var btnBottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = word?.title
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        btnBottomConstraint.constant = self.view.bounds.height / 5
    }

    // 배우기를 취소하고 돌아가기
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        
        let alert: UIAlertController = UIAlertController(title: "돌아가기", message: "여기서 끝낼 경우 오늘의 단어가 완료되지 않습니다.", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .destructive, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: {_ in
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
        parentController?.goToNextPage()
    }
    @IBAction func notAlreadyKnowBtnTapped(_ sender: UIButton) {
        parentController?.goToNextPage()
    }

}

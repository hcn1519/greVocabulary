//
//  DailyPageViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit
import RealmSwift

class DailyPageViewController: UIPageViewController {

    let realm = try! Realm()
    var date: Int?

    let pageDataSource = PageDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        pageDataSource.setWords(date: date!, isOnlyWrongWords: nil)
        pageDataSource.setToday(date: date!)

        self.dataSource = self
        self.setViewControllers([getViewControllerAtIndex(index: date!)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
        removeSwipeGesture()
    }

}

extension DailyPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let pageContent: DailyDetailViewController = viewController as! DailyDetailViewController
        var index = pageContent.pageIndex
        if ((index == 0) || (index == NSNotFound)) {
            return nil
        }
        index -= 1
        return getViewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let pageContent: DailyDetailViewController = viewController as! DailyDetailViewController
        var index = pageContent.pageIndex
        if (index == NSNotFound) {
            return nil
        }
        index += 1
        if (index == pageDataSource.getWords?.count) {

            if let today = pageDataSource.getToday {

                try! self.realm.write {
                    today.finishedDate = Date()
                    today.isFinished = true
                }

                let alert: UIAlertController = UIAlertController(title: "메인 화면으로", message: "오늘의 단어를 완료하였습니다.", preferredStyle: .alert)

                let ok = UIAlertAction(title: "OK", style: .default, handler: {_ in

                    self.dismiss(animated: true) {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                })

                alert.addAction(ok)

                self.present(alert, animated: true, completion: nil)

                return nil
            }
        }
        
        return getViewControllerAtIndex(index: index)
    }
    
    // cellForRow와 같은 데이터 다루기
    func getViewControllerAtIndex(index: NSInteger) -> DailyDetailViewController {
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "DailyDetailViewController") as! DailyDetailViewController

        let indexPath = IndexPath(item: index, section: 0)

        pageContentViewController.pageIndex = index
        pageContentViewController.controllerType = ControllerType.dailyPage

        if let words = pageDataSource.getWords {
            pageContentViewController.currentWord = words[indexPath.row]
        }
        
        pageContentViewController.parentController = self
        
        return pageContentViewController
    }
}

extension DailyPageViewController {
    func goToNextPage(){
        
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController( self, viewControllerAfter: currentViewController ) else { return }
        
        setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
    }
    
    func removeSwipeGesture(){
        for view in self.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
}


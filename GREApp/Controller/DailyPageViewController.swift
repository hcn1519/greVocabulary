//
//  DailyPageViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class DailyPageViewController: UIPageViewController {
    
    var words: [Word] = []
    var wordScores: [WordScore] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTestWords()
        
        
        self.dataSource = self
        
        self.setViewControllers([getViewControllerAtIndex(index: 0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
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
        index -= 1;
        return getViewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let pageContent: DailyDetailViewController = viewController as! DailyDetailViewController
        var index = pageContent.pageIndex
        if (index == NSNotFound) {
            return nil;
        }
        index += 1;
        if (index == words.count) {
            return nil;
        }
        
        return getViewControllerAtIndex(index: index)
    }
    
    // cellForRow와 같은 데이터 다루기
    func getViewControllerAtIndex(index: NSInteger) -> DailyDetailViewController {
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "DailyDetailViewController") as! DailyDetailViewController
        
        pageContentViewController.pageIndex = index
        pageContentViewController.word = words[index]
        pageContentViewController.wordScore = wordScores[index]
        
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
    
    
    func goToPreviousPage(){
        
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let previousViewController = dataSource?.pageViewController( self, viewControllerBefore: currentViewController ) else { return }
        
        setViewControllers([previousViewController], direction: .reverse, animated: true, completion: nil)
    }
    
    func removeSwipeGesture(){
        for view in self.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
}
extension DailyPageViewController {
    func generateTestWords() {
        
        let titles = ["abalone", "hello", "world"]
        let meanings = ["전복", "안녕하세요", "세계"]
        
        for i in 0..<3 {
            let word = Word(context: context)
            word.wordId = Int16(i)
            word.title = titles[i]
            word.meaning = meanings[i]
            
            words.append(word)
            
            let wordScore = WordScore(context: context)
            
            wordScore.correctCount = 0
            wordScore.wrongCount = 0
            wordScore.wordScoreId = Int16(i)
            
            wordScores.append(wordScore)
        }
        
    }

}

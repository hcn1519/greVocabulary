//
//  DailyViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit
import CoreData

class DailyViewController: UIViewController {
    let dailyCellId = "dailyCellId"
    
    var controller: NSFetchedResultsController<Day>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetAllRecords(in: "Day")
//        generateTestData()
        attempFetch()
    }
    
    func generateTestData() {
        
        let day1 = Day(context: context)
        
        day1.dayId = 1
        day1.dateNumber = 1
        day1.isFinished = false
        
        let day2 = Day(context: context)
        
        day2.dayId = 2
        day2.dateNumber = 2
        day2.isFinished = false
        
        let day3 = Day(context: context)
        
        day3.dayId = 3
        day3.dateNumber = 3
        day3.isFinished = false
        
        ad.saveContext()
    }
    
    func resetAllRecords(in entity : String) // entity = Your_Entity_Name
    {
        
        let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try context.execute(deleteRequest)
            try context.save()
        }
        catch {
            print ("There was an error")
        }
    }
    
    // data를 fetching하는 작업
    func attempFetch() {
        // 어떤 종류의 데이터를 fetching할 것인지 선언
        let fetchRequest: NSFetchRequest<Day> = Day.fetchRequest()
        
        //데이터를 어떻게 정렬할 것인지 알려줌
        let keySort = NSSortDescriptor(key: "dayId", ascending: true)
        fetchRequest.sortDescriptors = [keySort]
        
        // NSmanagementContext를 생성(일종의 scratchpad, 데이터 작업을 할 수 있도록 해주는 메모리)
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = controller
        
        // 실제 fetch 작업 수행
        do {
            try controller.performFetch()
        } catch let err as NSError {
            print("Day Data Fetching error : \(err)")
        }
    }
}

extension DailyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dailyCellId, for: indexPath) as! DailyTestCell
        
        let item = controller.object(at: indexPath)
        cell.configureCell(day: item)
        
        return cell
    }
}

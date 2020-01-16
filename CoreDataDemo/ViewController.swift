//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Ramanpreet Singh on 2020-01-16.
//  Copyright © 2020 Ramanpreet Singh. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    private func initViews() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext {
           // saveData(context)
            fetchData(context)
        }
    }
    
    private func saveData(_ context: NSManagedObjectContext) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        user.setValue("Ramanpreet", forKey: "name")
        user.setValue("ramanpreet230@gmail.com", forKey: "email")
        user.setValue(23, forKey: "age")
        do {
            try context.save()
            print(user)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func fetchData(_ context: NSManagedObjectContext) {
        // fetching
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let name = result.value(forKey: "name") {
                        print(name)
                    }
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}


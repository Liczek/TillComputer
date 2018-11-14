//
//  CoreDataManager.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 14/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit
import CoreData

struct CoreDataManager {
	
	static let shared = CoreDataManager()
	
	let persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "TillComputerModel")
		container.loadPersistentStores(completionHandler: { (storeDescriptor, err) in
			if let err = err {
				fatalError("Loading core data store failed: \(err)")
			}
		})
		return container
	}()
	
	func fetchSalaries() -> [Salary] {
		let context = persistentContainer.viewContext
		
		let fetchRequest = NSFetchRequest<Salary>(entityName: "Salary")
		
		do {
			let salaries = try context.fetch(fetchRequest)
			return salaries
		} catch let fetchErr {
			print("Failed to fetch Salaries", fetchErr)
			return []
		}
	}
	
	func createSalary(date: Date) -> (Salary?, Error?) {
		let context = persistentContainer.viewContext
		let salary = NSEntityDescription.insertNewObject(forEntityName: "Salary", into: context) as! Salary
		
		salary.date = date
		salary.value = Float(ValueToAdd)
		
		do {
			try context.save()
			return (salary, nil)
		} catch let err {
			print("Failed to save new salary", err)
			return (nil, err)
		}
	}
	
	
}


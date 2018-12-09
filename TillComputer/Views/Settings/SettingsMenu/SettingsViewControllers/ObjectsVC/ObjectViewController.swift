//
//  ObjectViewController.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 04/12/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

struct Object {
	let value: CGFloat
	let image: UIImage
}

class ObjectViewController: SettingItemsVC, UITableViewDelegate, UITableViewDataSource, NewObjectCreationViewDelegate {
	
	
	var objects = [Object]()
	
	let objectCellID = "objectCellID"
	
	let tableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		return tableView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.separatorStyle = .none
		
		view.backgroundColor = .yellow
		
		view.addSubview(tableView)
		
		
		NSLayoutConstraint.activate([
			
			tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
			
			])
		
		tableView.register(ObjectCell.self, forCellReuseIdentifier: objectCellID)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return objects.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell =  tableView.dequeueReusableCell(withIdentifier: objectCellID, for: indexPath) as! ObjectCell
		let object = objects[indexPath.row]
		cell.objectImage.image = object.image
		cell.valueLabel.text = String("\(object.value)")
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 250
	}
	
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let addObjectView = AddObjectView()
		addObjectView.plusIconButton.addTarget(self, action: #selector(addNewObject), for: .touchUpInside)
		return addObjectView
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 100
	}
	
	@objc func addNewObject() {
		let newObjectCreatorVC = NewObjectCreationView()
		let navController = UINavigationController(rootViewController: newObjectCreatorVC)
		newObjectCreatorVC.delegate = self
		present(navController, animated: true, completion: nil)
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = tableView.cellForRow(at: indexPath) as! ObjectCell
		cell.isSelected = false
	}
	
	func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
			print("delete")
		}
		deleteAction.backgroundColor = .veryDarkRed
		
		let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
			print("edit")
		}
		editAction.backgroundColor = UIColor.lightGold
		return [editAction, deleteAction]
	}

//	func didAddNewObject() {
//		let row = objects.count
//		objects.append("obj\(objects.count + 1)")
//		let index = IndexPath(row: row, section: 0)
//		tableView.insertRows(at: [index], with: UITableView.RowAnimation.middle)
//	}
	
	func didCreateNewObject(value: CGFloat, image: UIImage) {
		let newObject = Object(value: value, image: image)
		objects.append(newObject)
		tableView.reloadData()
	}
	
}

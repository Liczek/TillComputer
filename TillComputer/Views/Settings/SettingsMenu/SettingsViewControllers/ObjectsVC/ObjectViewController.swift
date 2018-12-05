//
//  ObjectViewController.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 04/12/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class ObjectViewController: SettingItemsVC, UITableViewDelegate, UITableViewDataSource {
	
	
	var objects = [String]()
	
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
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 250
	}
	
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let addObjectView = AddObjectView()
		addObjectView.plusIconButton.addTarget(self, action: #selector(AddNewObject), for: .touchUpInside)
		return addObjectView
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 100
	}
	
	@objc func AddNewObject() {
		let row = objects.count
		objects.append("obj\(objects.count + 1)")
		let index = IndexPath(row: row, section: 0)
		tableView.insertRows(at: [index], with: UITableView.RowAnimation.middle)
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = tableView.cellForRow(at: indexPath) as! ObjectCell
		cell.isSelected = false
	}
	

}

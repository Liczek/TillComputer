//
//  ListViewController.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 09/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

protocol LiveViewControllerDelegate {
	func didRemoveSalaries(numberOfRemovedSalaries: Int)
}

class ListViewController: UITableViewController {
	
	var salaries = [Salary]()
	
	let cellID = "cellID"
	
	var numberOfDeletedRows = 0
	
	let bgImageView: UIImageView = {
		let view = UIImageView()
		view.image = UIImage(named: "shadowImage")
		view.contentMode = .scaleToFill
		view.clipsToBounds = true
		return view
	}()
	
	let button: UIButton = {
		let btn = UIButton(type: UIButton.ButtonType.system)
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setImage(UIImage(named: "arrow back")?.withRenderingMode(.alwaysTemplate), for: .normal)
		return btn
	}()
	
	var delegate: LiveViewControllerDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .clear
		configureNavigationController()
		configureTableView()
		loadSalariesData()
	}
	
	fileprivate func configureNavigationController() {
		navigationItem.title = "Donations"
		navigationController?.navigationBar.barTintColor = .veryDarkRed
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.tintColor = .black
				
		navigationController?.navigationBar.addSubview(button)
		button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
		NSLayoutConstraint.activate([
			
			button.leadingAnchor.constraint(equalTo: (navigationController?.navigationBar.leadingAnchor)!, constant: 8),
			button.heightAnchor.constraint(equalToConstant: 40),
			button.widthAnchor.constraint(equalToConstant: 40),
			button.topAnchor.constraint(equalTo: (navigationController?.navigationBar.topAnchor)!, constant: 8)
			
			])
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.trash, target: self, action: #selector(presentResetSalariesAlertController))
	}
	
	fileprivate func configureTableView() {
		tableView.register(DonationCell.self, forCellReuseIdentifier: cellID)
		tableView.separatorStyle = .none
		tableView.tableFooterView = UIView()
		tableView.backgroundView = bgImageView
		tableView.allowsSelection = false
	}
	
	fileprivate func loadSalariesData() {
		salaries = CoreDataManager.shared.fetchSalaries()
	}
	
	@objc fileprivate func handleBackButton() {
		delegate?.didRemoveSalaries(numberOfRemovedSalaries: numberOfDeletedRows)
		dismiss(animated: true, completion: nil)
	}
	
	@objc fileprivate func presentResetSalariesAlertController() {
		
		let alertController = UIAlertController(title: "UWAGA!!!", message: "Jesteś pewien, że chcesz wymazać swoje wszystkie wpłaty?", preferredStyle: .alert)
		let actionAccept = UIAlertAction(title: "Im sure!", style: .destructive) { (alert) in
			self.resetCoreDataSalariesContainer()
			self.dismiss(animated: true, completion: nil)
		}
		let actionSkip = UIAlertAction(title: "Noooo", style: .default) { (alert) in
			print("test skip")
		}
		
		alertController.addAction(actionAccept)
		alertController.addAction(actionSkip)
		
		present(alertController, animated: true, completion: nil)
	}
	
	fileprivate func resetCoreDataSalariesContainer() {
		self.delegate?.didRemoveSalaries(numberOfRemovedSalaries: self.salaries.count)
		CoreDataManager.shared.resetCoreDataContainer()
	}
	
	fileprivate func presentAlertControllerForRowDeletion(indexPath: IndexPath, inTableView: UITableView) {
		let alertController = UIAlertController(title: "Warning!!!", message: "Are you sure you want do remove this salarie", preferredStyle: .alert)
		
		let actionAccept = UIAlertAction(title: "Im sure!", style: .destructive) { (alert) in
			
			self.deleteSalaryFromCoreDataAt(indexPath: indexPath)
			UIView.transition(with: inTableView, duration: 0.5, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
				inTableView.reloadData()
			})
			
			self.countValueOfDeletedRows()
		}
		
		let actionSkip = UIAlertAction(title: "Noooo", style: .default) { (alert) in
			print("test skip")
		}
		
		alertController.addAction(actionAccept)
		alertController.addAction(actionSkip)
		
		present(alertController, animated: true, completion: nil)
	}
	
	fileprivate func deleteSalaryFromCoreDataAt(indexPath: IndexPath) {
		let context = CoreDataManager.shared.persistentContainer.viewContext
		let salary = salaries[indexPath.row]
		salaries.remove(at: indexPath.row)
		context.delete(salary)
		do {
			try context.save()
		} catch let err {
			print("Failed to delete salary", err)
		}
	}
	
	fileprivate func countValueOfDeletedRows() {
		self.numberOfDeletedRows += 1
	}
	
	fileprivate func configureDate(date: Date) -> String {
		var dateString = ""
		let dateFormatter = DateFormatter()
		let stringFormat = "dd/MM/yyyy - hh:mm"
		dateFormatter.dateFormat = stringFormat
		dateString = dateFormatter.string(from: date)
		return dateString
	}
}

//MARK:- TableView Extension
extension ListViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return salaries.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DonationCell
		
		let salary = salaries[indexPath.row]
		let date = salary.date ?? Date()
		let dateString = configureDate(date: date)
		let value = salary.value
		let currentValue = value * Float(salaries.count - indexPath.row)
		cell.donationDateLabel.text = dateString
		cell.donationValueLabel.text = "\(Int(currentValue))zł"
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 64
	}
	
	override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		
		let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (_, indexPath) in
			self.presentAlertControllerForRowDeletion(indexPath: indexPath, inTableView: tableView)
		}
		deleteAction.backgroundColor = .veryDarkRed
		return [deleteAction]
	}
	
}

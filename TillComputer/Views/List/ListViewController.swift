//
//  ListViewController.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 09/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
	
//	var donationsDate = [Date(), Date(),Date(), Date(),Date(), Date(),Date(), Date(),Date(), Date(),]
	
	let cellID = "cellID"
	
	let bgImageView: UIImageView = {
		let view = UIImageView()
//		view.translatesAutoresizingMaskIntoConstraints = false
		view.image = UIImage(named: "shadowImage")
		view.contentMode = .scaleToFill
		view.clipsToBounds = true
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .clear
		navigationItem.title = "Donations"
		
		navigationController?.navigationBar.barTintColor = .veryDarkRed
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.tintColor = .black
		
		tableView.register(DonationCell.self, forCellReuseIdentifier: cellID)
		tableView.separatorStyle = .none
		tableView.tableFooterView = UIView()
		tableView.backgroundView = bgImageView
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<< Back", style: .plain, target: self, action: #selector(backToMenu))
		
	}
	
	@objc fileprivate func backToMenu() {
		dismiss(animated: true, completion: nil)
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Donations.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DonationCell
		let date = Donations[indexPath.row].date
		let dateString = configureDate(date: date)
		cell.donationDateLabel.text = dateString
		let currentMoney = Donations[indexPath.row].currentMoneyValue
		cell.donationValueLabel.text = "\(Int(currentMoney))zł"
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 64
	}
	
	
	fileprivate func configureDate(date: Date) -> String {
		var dateString = ""
		let dateFormatter = DateFormatter()
		let stringFormat = "dd/MM/yyyy - hh:mm"
		dateFormatter.dateFormat = stringFormat
		dateString = dateFormatter.string(from: date)
		print(dateString)
		return dateString
	}
}

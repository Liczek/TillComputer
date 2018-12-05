////
////  SettingsViewController.swift
////  TillComputer
////
////  Created by Paweł Liczmański on 19/11/2018.
////  Copyright © 2018 Paweł Liczmański. All rights reserved.
////
//
//import UIKit
//
//class SettingsViewController: UITableViewController {
//	
//	let settings = [["Finish Value", "StartValue", "SalaryValue" ],
//					["Aims Images", "Colors"],
//					["Language", "Credits", "Contact"]
//	]
//	
//	let titleName = "Settings"
//	let cellID = "settingCellID"
//	
//	let bgImageView: UIImageView = {
//		let view = UIImageView()
//		view.image = UIImage(named: "shadowImage")
//		view.contentMode = .scaleToFill
//		view.clipsToBounds = true
//		return view
//	}()
//	
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		
//		view.backgroundColor = .clear
//		
//		configureNavBar()
//		configureTableView()
//		
//	}
//	
//	fileprivate func configureTableView() {
//		tableView.register(SettingsCell.self, forCellReuseIdentifier: cellID)
//		tableView.separatorStyle = .none
//		tableView.tableFooterView = UIView()
//		tableView.backgroundView = bgImageView
//		tableView.allowsSelection = true
//	}
//	
//	fileprivate func configureNavBar() {
//		navigationItem.title = titleName
//		
//		navigationController?.navigationBar.barTintColor = .veryDarkRed
//		navigationController?.navigationBar.isTranslucent = false
//		navigationController?.navigationBar.tintColor = .black
//		navigationController?.navigationBar.prefersLargeTitles = true
//		navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
//		navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
//		
//		
//		navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(handleCancel))
//		navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(handleDone))
//	}
//	
//	@objc func handleCancel() {
//		dismiss(animated: true, completion: nil)
//	}
//	
//	@objc func handleDone() {
//		dismiss(animated: true, completion: nil)
//		print("Save")
//	}
//}
//
//extension SettingsViewController {
//	
//	override func numberOfSections(in tableView: UITableView) -> Int {
//		return settings.count
//	}
//	
//	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//		return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
//	}
//	
//	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		return settings[section].count
//	}
//	
//	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SettingsCell
//		let setting = settings[indexPath.section][indexPath.row]
//		cell.settingNameLabel.text = setting
//		return cell
//	}
//	
//	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//		return 64
//	}
//	
//	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		let setting = settings[indexPath.section][indexPath.row]
//		let cell = tableView.cellForRow(at: indexPath) as! SettingsCell
//		cell.isSelected = false
//		UIView.animate(withDuration: 0.2, animations: {
//			cell.settingNameLabel.text = setting
//			cell.settingNameLabel.textColor = .lightRed
//			cell.icon.transform = CGAffineTransform(scaleX: 1.1, y: 1)
//			cell.icon.transform = CGAffineTransform(translationX: 3, y: 0)
//			cell.settingNameLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1)
//			cell.settingNameLabel.transform = CGAffineTransform(translationX: 3, y: 0)
//		}) { (true) in
//			cell.settingNameLabel.transform = CGAffineTransform.identity
//			cell.icon.transform = CGAffineTransform.identity
//			cell.settingNameLabel.textColor = .veryDarkRed
//		}
//	}
//}
//

//
//  AboutViewController.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 27/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class AboutViewController: SettingItemsVC , UITableViewDelegate, UITableViewDataSource {
	
	let aboutID = "aboutID"
	
	let settings = [
		[
			AboutSetting(name: "Skin", iconName: "setting", iconColor: .red),
			AboutSetting(name: "Settings", iconName: "setting", iconColor: .red),
			AboutSetting(name: "Siri Shortcuts (iOS 12)", iconName: "setting", iconColor: .red)
		],
		[
			AboutSetting(name: "Get Started", iconName: "arrow", iconColor: .orange)
		],
		[
			AboutSetting(name: "Upgrade app", iconName: "dolar", iconColor: .gold)
		],
		[
			AboutSetting(name: "Rete in App Store", iconName: "spotlight", iconColor: .purple),
			AboutSetting(name: "Help Center", iconName: "unlocked", iconColor: .purple),
			AboutSetting(name: "Contact us", iconName: "repeat", iconColor: .purple)
		],
		[
			AboutSetting(name: "Data backup", iconName: "upload", iconColor: .blue),
			AboutSetting(name: "Archive Data", iconName: "tabs", iconColor: .blue)
		]
	]
	
	let tableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		return tableView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.title = "About"

		
		
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.backgroundColor = UIColor.lightGray
		tableView.separatorStyle = .none
		tableView.register(AboutCell.self, forCellReuseIdentifier: aboutID)
		
		view.addSubview(tableView)
		
		NSLayoutConstraint.activate([
			
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
			
			])
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return settings.count
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return UIView()
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 8
	}
	
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView()
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 8
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 56
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return settings[section].count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let setting = settings[indexPath.section][indexPath.row]
		
		let cell = tableView.dequeueReusableCell(withIdentifier: aboutID, for: indexPath) as! AboutCell
		cell.iconView.tintColor = setting.iconColor
		cell.iconView.image = UIImage(named: setting.iconName)?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate).withAlignmentRectInsets(UIEdgeInsets(top: -2, left: -2, bottom: -2, right: -2))
		cell.nameLabel.text = setting.name
		return cell
	}
	
}

//
//  SettingsView.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 20/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

struct Setting {
	let settingName: String
	let iconName: String
}

class SettingsMenuView: UIViewController {
	
	let settings = [Setting(settingName: "Test1", iconName: "setting"), Setting(settingName: "Test2", iconName: "setting"), Setting(settingName: "Test3", iconName: "setting"), Setting(settingName: "Test4", iconName: "setting"), Setting(settingName: "Test5", iconName: "setting")]
	
//	let settingsButton: UIButton = {
//		let button = UIButton(type: UIButton.ButtonType.system)
//		button.translatesAutoresizingMaskIntoConstraints = false
//		button.setImage(UIImage(named: "setting")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
//		button.tintColor = .lightGold
//		button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//		button.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
//		return button
//	}()
	
	let containerView: UIView = {
		let view = UIView()
//		view.backgroundColor = .gold
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		view.backgroundColor = .green
		
		
		view.addSubview(containerView)
		
		

//		let test1 = createSettingRow(settingName: "Test1", iconName: "setting", index: 2)
//		containerView.addSubview(test1)
		
		NSLayoutConstraint.activate([
			
			containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
			containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
			containerView.heightAnchor.constraint(equalToConstant: 300),
			containerView.widthAnchor.constraint(equalTo: containerView.heightAnchor),
			
			
			
			])
		
		settings.enumerated().forEach { (index, setting) in
			let setting = createSettingRow(settingName: setting.settingName, iconName: setting.iconName, index: index)
			containerView.addSubview(setting)
			let settingHeight: CGFloat = 48
			
			let verticalSpacing = (settingHeight * CGFloat(index)) + CGFloat(8 * (index + 1))
			NSLayoutConstraint.activate([
				
				setting.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -verticalSpacing),
				setting.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
				setting.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
				setting.heightAnchor.constraint(equalToConstant: settingHeight),
				
				])
		}
		
//		createSettingRow(settingName: "Test1", iconName: "setting", index: 0)
	}
	
	func createSettingRow(settingName: String, iconName: String, index: Int) -> UIView {
		let buttonSize: CGFloat = 40
		
		let separatorMultiplier = CGFloat(index)
		let separator: CGFloat = (separatorMultiplier * 8) + 8
		
		let container = UIView()
//		container.backgroundColor = .darkGray
		container.translatesAutoresizingMaskIntoConstraints = false
		
		let settingLabel = UILabel()
		settingLabel.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
		settingLabel.textColor = .veryDarkRed
		settingLabel.text = settingName
		settingLabel.translatesAutoresizingMaskIntoConstraints = false

		let button = UIButton(type: UIButton.ButtonType.system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(named: iconName)?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
		button.tintColor = .lightGold
		button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//		button.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
		button.translatesAutoresizingMaskIntoConstraints = false

		container.addSubview(settingLabel)
		container.addSubview(button)

		NSLayoutConstraint.activate([

			button.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -separator),
			button.centerYAnchor.constraint(equalTo: container.centerYAnchor),
			button.heightAnchor.constraint(equalToConstant: buttonSize),
			button.widthAnchor.constraint(equalToConstant: buttonSize),

			settingLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -8),
			settingLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),

			])
		
		return container
	}
	
}

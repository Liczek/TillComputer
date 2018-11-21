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
	}
	

	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		
//		settings.enumerated().forEach { (index, setting) in
			let index = 0
			let setting = self.createSettingRow(settingName: settings[index].settingName, iconName: settings[index].iconName, index: index)
			
			UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
				
				
				self.containerView.addSubview(setting)
				let settingHeight: CGFloat = 48
				
				let verticalSpacing = (settingHeight * CGFloat(index)) + CGFloat(8 * (index))
				var leadingAnchor: NSLayoutConstraint!
				NSLayoutConstraint.activate([
					
					setting.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0),
					setting.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 8),
					setting.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 0),
					setting.heightAnchor.constraint(equalToConstant: settingHeight),
					])
				
				setting.transform = CGAffineTransform(translationX: 0, y: -verticalSpacing)
//				self.view.layoutIfNeeded()
			}, completion: { (true) in
				
				let index = 1
				let setting = self.createSettingRow(settingName: self.settings[index].settingName, iconName: self.settings[index].iconName, index: index)
				
				UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
					
					
					self.containerView.addSubview(setting)
					let settingHeight: CGFloat = 48
					
					let verticalSpacing = (settingHeight * CGFloat(index)) + CGFloat(8 * (index))
					var leadingAnchor: NSLayoutConstraint!
					NSLayoutConstraint.activate([
						
						setting.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0),
						setting.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 8),
						setting.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 0),
						setting.heightAnchor.constraint(equalToConstant: settingHeight),
						])
					
					setting.transform = CGAffineTransform(translationX: 0, y: -verticalSpacing)
//					self.view.layoutIfNeeded()
				}, completion: { (true) in
					
					let index = 2
					let setting = self.createSettingRow(settingName: self.settings[index].settingName, iconName: self.settings[index].iconName, index: index)
					
					UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
						
						
						self.containerView.addSubview(setting)
						let settingHeight: CGFloat = 48
						
						let verticalSpacing = (settingHeight * CGFloat(index)) + CGFloat(8 * (index))
						var leadingAnchor: NSLayoutConstraint!
						NSLayoutConstraint.activate([
							
							setting.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0),
							setting.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 8),
							setting.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 0),
							setting.heightAnchor.constraint(equalToConstant: settingHeight),
							])
						
						setting.transform = CGAffineTransform(translationX: 0, y: -verticalSpacing)
						//					self.view.layoutIfNeeded()
					}, completion: { (true) in
						
						
						
						
					})
					
					
				})
				
				
			})
			
			
			
		
//		}
		
	}
	
	func createSettingRow(settingName: String, iconName: String, index: Int) -> UIView {
		let buttonSize: CGFloat = 50
		
		let separatorMultiplier = CGFloat(index)
		let separator: CGFloat = (separatorMultiplier * 8)
		
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

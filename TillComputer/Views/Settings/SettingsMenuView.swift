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
	
	let settingHeight: CGFloat = 48
	let spacer: CGFloat = 8
	var verticalSpacing: CGFloat = 0
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
		verticalSpacing = settingHeight + self.spacer
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
	

	fileprivate func configureStartBottomAnchorPosition(index: Int) -> CGFloat {
		let startBottomAnchorPosition = (self.settingHeight * CGFloat(index - 1)) + CGFloat(Int(self.spacer) * (index - 1))
		return startBottomAnchorPosition
	}
	
	fileprivate func configureConstraintsFor(settingView: UIView, startBottomAnchorConstant: CGFloat) {
		NSLayoutConstraint.activate([
			
			settingView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -startBottomAnchorConstant),
			settingView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: self.spacer),
			settingView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 0),
			settingView.heightAnchor.constraint(equalToConstant: self.settingHeight),
			])
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
	
			let index = 0
			let setting = self.createSettingRow(settingName: settings[index].settingName, iconName: settings[index].iconName, index: index)
			
			UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
				
				
				self.containerView.addSubview(setting)
				self.configureConstraintsFor(settingView: setting, startBottomAnchorConstant: 0)
				

			}, completion: { (true) in
				
				let index = 1
				let setting = self.createSettingRow(settingName: self.settings[index].settingName, iconName: self.settings[index].iconName, index: index)
				
				UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
					
					
					self.containerView.addSubview(setting)
					
					
					self.configureConstraintsFor(settingView: setting, startBottomAnchorConstant: self.configureStartBottomAnchorPosition(index: index))
					
					setting.transform = CGAffineTransform(translationX: 0, y: -self.verticalSpacing)
				}, completion: { (true) in
					
					let index = 2
					let setting = self.createSettingRow(settingName: self.settings[index].settingName, iconName: self.settings[index].iconName, index: index)
					
					UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
						
						
						self.containerView.addSubview(setting)
						
						self.configureConstraintsFor(settingView: setting, startBottomAnchorConstant: self.configureStartBottomAnchorPosition(index: index))
						
						setting.transform = CGAffineTransform(translationX: 0, y: -self.verticalSpacing)
		
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

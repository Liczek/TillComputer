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

protocol SettingsMenuViewDelegate {
	func didCloseSettingsView()
}

class SettingsMenuView: UIViewController {
	
	let settings = [Setting(settingName: "About", iconName: "about"), Setting(settingName: "Images", iconName: "no_image2"), Setting(settingName: "Values", iconName: "values"), Setting(settingName: "Test4", iconName: "setting"), Setting(settingName: "Test5", iconName: "setting")]
	
	let settingHeight: CGFloat = 48
	let spacer: CGFloat = 8
	var verticalSpacing: CGFloat = 0
	
	var setting1 = UIView()
	var setting2 = UIView()
	var setting3 = UIView()
	
	var isMenuOpened = true
	
	let containerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	var delegate: SettingsMenuViewDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		verticalSpacing = settingHeight + self.spacer
		view.addSubview(containerView)
		
		NSLayoutConstraint.activate([
			
			containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			containerView.topAnchor.constraint(equalTo: view.topAnchor),
			containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			])
		
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		configureSettingsMenu()
		configureSettingsViewBGTapGesture()
	}
	
	fileprivate func configureStartBottomAnchorPosition(index: Int) -> CGFloat {
		let startBottomAnchorPosition = (self.settingHeight * CGFloat(index - 1)) + CGFloat(Int(self.spacer) * (index - 1) + 8)
		return startBottomAnchorPosition
	}
	
	fileprivate func configureConstraintsFor(settingView: UIView, startBottomAnchorConstant: CGFloat) {
		NSLayoutConstraint.activate([
			
			settingView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -startBottomAnchorConstant),
			settingView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: self.spacer),
			settingView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -self.spacer),
			settingView.heightAnchor.constraint(equalToConstant: self.settingHeight),
			])
	}
	
	fileprivate func configureSettingsMenu() {
		
		if isMenuOpened == false {
			
			closeAndDismissSettingsMenu()
			
		} else {
			
			let index = 0
			setting1 = self.createSettingRow(settings: settings, index: index, selector: #selector(self.handleAboutSetting))
			
			UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
				
				
				self.containerView.addSubview(self.setting1)
				self.setActionForSettingButton(index: index, container: self.setting1)
				self.configureConstraintsFor(settingView: self.setting1, startBottomAnchorConstant: self.spacer)
				
				
			}, completion: { (true) in
				
				let index = 1
				self.setting2 = self.createSettingRow(settings: self.settings, index: index, selector: #selector(self.handleImagesSetting))
				
				UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
					
					self.containerView.addSubview(self.setting2)
					self.setActionForSettingButton(index: index, container: self.setting2)
					self.configureConstraintsFor(settingView: self.setting2, startBottomAnchorConstant: self.configureStartBottomAnchorPosition(index: index))
					
					self.setting2.transform = CGAffineTransform(translationX: 0, y: -self.verticalSpacing)
				}, completion: { (true) in
					
					let index = 2
					self.setting3 = self.createSettingRow(settings: self.settings, index: index, selector: #selector(self.handleValuesSetting))
					
					UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
						
						self.containerView.addSubview(self.setting3)
						self.setActionForSettingButton(index: index, container: self.setting3)
						self.configureConstraintsFor(settingView: self.setting3, startBottomAnchorConstant: self.configureStartBottomAnchorPosition(index: index))
						
						self.setting3.transform = CGAffineTransform(translationX: 0, y: -self.verticalSpacing)
						
					}, completion: { (true) in
						
						
						
						
					})
				})
			})
			
			isMenuOpened = false
		}
	}
	
	fileprivate func createSettingRow(settings: [Setting], index: Int, selector: Selector) -> UIView {
		let buttonSize: CGFloat = 50
		
		let separatorMultiplier = CGFloat(index)
		let separator: CGFloat = (separatorMultiplier * 8)
		
		let container = UIView()
		container.backgroundColor = .yellow
		container.translatesAutoresizingMaskIntoConstraints = false
		
		let settingName = settings[index].settingName
		
		let settingLabel = LabelWithEdgeInsets()
		settingLabel.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
		settingLabel.textColor = .lightGold
		settingLabel.text = settingName
		settingLabel.verticalPadding = 2
		settingLabel.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
		settingLabel.layer.cornerRadius = 5
		settingLabel.clipsToBounds = true
		settingLabel.translatesAutoresizingMaskIntoConstraints = false

		let iconName = settings[index].iconName
		
		let button = UIButton(type: UIButton.ButtonType.system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(named: iconName)?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
		button.tintColor = .lightGold
		button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
		button.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
		button.layer.cornerRadius = 25
		button.clipsToBounds = true
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: selector, for: UIControl.Event.touchUpInside)
		
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
	
	fileprivate func configureSettingsViewBGTapGesture() {
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleBGTap))
		containerView.addGestureRecognizer(tapGesture)
	}
	
	fileprivate func closeAndDismissSettingsMenu() {
		
		verticalSpacing = 48
		
		UIView.animate(withDuration: 0.15, delay: 0, options: .curveLinear, animations: {
//			self.setting3.transform = CGAffineTransform(translationX: 0, y: self.verticalSpacing)
			self.setting3.transform = .identity
		}) { (true) in
			self.setting3.isHidden = true
			UIView.animate(withDuration: 0.15, delay: 0, options: .curveLinear, animations: {
//				self.setting2.transform = CGAffineTransform(scaleX: 0, y: self.verticalSpacing)
				self.setting2.transform = .identity
			}) { (true) in
				self.setting2.isHidden = true
				UIView.animate(withDuration: 0.15, delay: 0, options: .curveLinear, animations: {
//					self.setting1.transform = CGAffineTransform(scaleX: 0, y: self.verticalSpacing)
//					self.setting1.transform = .identity
				}) { (true) in
					self.setting1.isHidden = true
					self.delegate?.didCloseSettingsView()
					self.dismiss(animated: false, completion: nil)
				}
			}
		}
	}
	
	fileprivate func setActionForSettingButton(index: Int, container: UIView) {
		
		if index == 0 {
			let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleAboutSetting))
			container.addGestureRecognizer(tapGesture)
		} else if index == 1 {
			let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImagesSetting))
			container.addGestureRecognizer(tapGesture)
		} else if index == 2 {
			let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleValuesSetting))
			container.addGestureRecognizer(tapGesture)
		}
	}
	
	@objc func handleBGTap() {
		closeAndDismissSettingsMenu()
	}
	
	@objc func handleAboutSetting() {
		let aboutVC = AboutViewController()
		let navController = UINavigationController(rootViewController: aboutVC)
		self.delegate?.didCloseSettingsView()
		view.isHidden = true
		self.present(navController, animated: true, completion: nil)
	}
	
	@objc func handleValuesSetting() {
		let valuesVC = ValuesViewController()
		let navController = UINavigationController(rootViewController: valuesVC)
		self.delegate?.didCloseSettingsView()
		view.isHidden = true
		self.present(navController, animated: true, completion: nil)
	}
	
	@objc func handleImagesSetting() {
		let imagesVC = ImagesViewController()
		let navController = UINavigationController(rootViewController: imagesVC)
		self.delegate?.didCloseSettingsView()
		view.isHidden = true
		self.present(navController, animated: true, completion: nil)
	}
}

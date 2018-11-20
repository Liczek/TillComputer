//
//  ComputerProgresController.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 04/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit
import AVFoundation

class ComputerProgresController: UIViewController, AVAudioPlayerDelegate, LiveViewControllerDelegate {
	
	
	
	let finishValue: CGFloat = 3000
	var currentValue: CGFloat = 0
	var percentage: CGFloat = 0
	
	var audioPlayer: AVAudioPlayer?
	var url: URL?
	let audioSession = AVAudioSession.sharedInstance()
	
	var progresBarHeight: CGFloat = 0
	let buttonSize: CGFloat = 40
	
	let windowHeight = UIApplication.shared.keyWindow?.frame.height
	
	let navigationBarView: NavigationBarView = {
		let view = NavigationBarView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .barsColor
		return view
	}()
	
	let progresBarView: ProgresBarView = {
		let view = ProgresBarView()
		view.backgroundColor = .gold
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let componentsView: ComponentsView = {
		let view = ComponentsView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let bottomBarView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .heavyGold
		return view
	}()
	
	let currentMoneyView: CurrentMoneyView = {
		let view = CurrentMoneyView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let settingsButton: UIButton = {
		let button = UIButton(type: UIButton.ButtonType.system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(named: "setting")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
		button.tintColor = .lightGold
		button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
		button.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
		return button
	}()
	
	
	var centerXAnchor: NSLayoutConstraint!
	var centerYAnchor: NSLayoutConstraint!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureCurrentValue()
		
		configureAudioPaths()
		setupNavigationController()
		setupUI()
	
		navigationBarView.addButton.addTarget(self, action: #selector(addMoney), for: .touchUpInside)
		navigationBarView.listButton.addTarget(self, action: #selector(openList), for: .touchUpInside)
		settingsButton.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		navigationController?.navigationBar.prefersLargeTitles = false
		updateClearViewHeight(addedValue: 0)
	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	@objc func addMoney() {
		
		navigationBarView.addButton.isEnabled = false
		
		if currentValue == finishValue {
			updateClearViewHeight(addedValue: 0)
			return
		}
		
		//Creating Salary in Core Data
		_ = CoreDataManager.shared.createSalary(date: Date())

		
		
		let moneyView: MoneyView = {
			let view = MoneyView()
			view.translatesAutoresizingMaskIntoConstraints = false
			view.moneyLabel.text = "\(Int(ValueToAdd))"
			return view
		}()
		
		playChaChingSound()
		
		UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
			
			self.view.addSubview(moneyView)
			self.setupConstraintsFor(moneyView: moneyView)
			
		}) { (true) in
			UIView.animate(withDuration: 0.3, animations: {
				self.animateMoneyView(moneyView: moneyView)
				
			}, completion: { (true) in
				moneyView.removeFromSuperview()
				
				UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
					self.updateClearViewHeight(addedValue: ValueToAdd)
				}, completion: { (true) in
					UIView.animate(withDuration: 0.5, animations: {
					})
				})
				self.navigationBarView.addButton.isEnabled = true
				self.checkForAchivements()
			})
		}
	}
	
	@objc func openList() {
		print("Open List")
		createListViewControler()
	}
	
	@objc func openSettings() {
		let settingsView = SettingsMenuView()
		settingsView.modalPresentationStyle = .overCurrentContext
//		settingsView.modalTransitionStyle = .crossDissolve
		self.present(settingsView, animated: true, completion: nil)
		
//		present(settingsView, animated: true, completion: nil)
		
		
//		let settingsViewController = SettingsViewController()
//		let navController = UINavigationController(rootViewController: settingsViewController)
//		present(navController, animated: true, completion: nil)
		
	}
	
	fileprivate func configureCurrentValue() {
		let salaries = CoreDataManager.shared.fetchSalaries()
		currentValue = ValueToAdd * CGFloat(salaries.count)
	}
	
	fileprivate func createListViewControler() {
		let listViewController = ListViewController()
		listViewController.delegate = self
		let navController = UINavigationController(rootViewController: listViewController)
		navController.navigationBar.prefersLargeTitles = true
//		navigationController?.pushViewController(listViewController, animated: true)
		present(navController, animated: true, completion: nil)
	}
	
	func didRemoveSalaries(numberOfRemovedSalaries: Int) {
		UIView.animate(withDuration: 2) {
			let removedValue = ValueToAdd * CGFloat(numberOfRemovedSalaries)
			self.currentValue -= removedValue
		}
		
	}
	
	fileprivate func updateClearViewHeight(addedValue: CGFloat) {
		var clearViewHeight: CGFloat!
		
		progresBarHeight = progresBarView.frame.height - 6
		
		currentValue += addedValue
		
		if addedValue != 0 {
			let donate = Donation.init(date: Date(), currentMoneyValue: currentValue)
			Donations.insert(donate, at: 0)
		}
		
		if percentage >= 1 {
			clearViewHeight = progresBarHeight * percentage
		} else {
			percentage = currentValue / finishValue
			clearViewHeight = progresBarHeight * percentage
		}
		
		
		//Its not working
		UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
			self.componentsView.blurViewBottomAnchor.constant = -clearViewHeight
			self.componentsView.blurView.layoutIfNeeded()
			self.progresBarView.progresViewShadowBottomAnchor.constant = -clearViewHeight
			self.progresBarView.progresViewShadow.layoutIfNeeded()
			self.progresBarView.progresValueLabel.text = "\((Int(self.percentage * 100)))%"
		})
		
		updateCurrentMoneyValues()
		
	}
	
	fileprivate func checkForAchivements() {
		if currentValue == finishValue {
			navigationBarView.addButton.isEnabled = false
			createAlertController(title: "Gratulacje", message: "Już nie klikaj, tylko szukaj komputer :)", action: "WoW Classic :D")
			currentMoneyView.currentMoney = Int(currentValue)
			currentMoneyView.configureMoneyLabel()
		} else if currentValue > finishValue {
			navigationBarView.addButton.isEnabled = false
			createAlertController(title: "Gratulacje", message: "Już nie klikaj, tylko szukaj komputer :)", action: "WoW Classic :D")
			return
		} else {
			if currentValue == finishValue / 2 {
				navigationBarView.addButton.isEnabled = false
				createAlertController(title: "No no no", message: "Już jesteś w połowie", action: "Dam radę")
			} else if currentValue == finishValue - 500 {
				navigationBarView.addButton.isEnabled = false
				createAlertController(title: "Komp już jest", message: "Dozbieraj na prO headset i gryzonia", action: "Zbieram, zbieram ;)")
			}
		}
	}
	
	fileprivate func updateCurrentMoneyValues() {
		currentMoneyView.currentMoney = Int(currentValue)
		currentMoneyView.finishMoney = Int(finishValue)
		currentMoneyView.configureMoneyLabel()
	}
	
	func createAlertController(title: String, message: String, action: String){
		let alertController =  UIAlertController(title: title, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: action, style: .default, handler: nil)
		alertController.addAction(action)
		self.present(alertController, animated: true) {
			self.navigationBarView.addButton.isEnabled = true
		}
	}
	
	fileprivate func animateMoneyView(moneyView: MoneyView) {
		moneyView.transform = CGAffineTransform(scaleX: 1, y: 1)
		self.centerXAnchor.constant = -150
		self.centerYAnchor.constant = 100
		self.view.layoutIfNeeded()
		moneyView.alpha = 0.2
	}
	
	
	fileprivate func setupConstraintsFor(moneyView: MoneyView) {
		NSLayoutConstraint.activate([
			moneyView.widthAnchor.constraint(equalToConstant: 110),
			moneyView.heightAnchor.constraint(equalToConstant: 50),
			])
		centerXAnchor = moneyView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
		centerXAnchor.isActive = true
		centerYAnchor = moneyView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)
		centerYAnchor.isActive = true
		moneyView.transform = CGAffineTransform(scaleX: 3, y: 3)
	}
	
	fileprivate func setupNavigationController() {
		navigationController?.setNavigationBarHidden(true, animated: false)
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.shinningGold, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)]
		navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.shinningGold, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)]
	}
	
	fileprivate func setupUI() {
		view.backgroundColor = .barsColor
		
		view.addSubview(navigationBarView)
		view.addSubview(progresBarView)
		view.addSubview(componentsView)
		view.addSubview(bottomBarView)
		view.addSubview(currentMoneyView)
		view.addSubview(settingsButton)
		
		NSLayoutConstraint.activate([
			
			navigationBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			navigationBarView.heightAnchor.constraint(equalToConstant: windowHeight! * 0.15),
			navigationBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			navigationBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			
			progresBarView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
			progresBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			progresBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			progresBarView.widthAnchor.constraint(equalToConstant: 50),
			
			componentsView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
			componentsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			componentsView.leadingAnchor.constraint(equalTo: progresBarView.trailingAnchor),
			componentsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			
			currentMoneyView.topAnchor.constraint(equalTo: progresBarView.topAnchor),
			currentMoneyView.bottomAnchor.constraint(equalTo: progresBarView.bottomAnchor),
			currentMoneyView.leadingAnchor.constraint(equalTo: progresBarView.trailingAnchor),
			currentMoneyView.widthAnchor.constraint(equalToConstant: buttonSize),
			
			settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
			settingsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
			settingsButton.heightAnchor.constraint(equalToConstant: buttonSize + 10),
			settingsButton.widthAnchor.constraint(equalTo: settingsButton.heightAnchor),
			])
		
		settingsButton.layer.cornerRadius = (buttonSize + 10) / 2
		
		
	}
	
	func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
		
		print("Sound Finished")
		
			audioPlayer?.stop()
			do {
				try self.audioSession.setActive(false, options: AVAudioSession.SetActiveOptions.notifyOthersOnDeactivation)
			} catch let err {
				print("Failed to turn Up Backgrund Volume", err)
			}
	}
	
	fileprivate func configureAudioPaths() {
		let path = Bundle.main.path(forResource: "cha_ching.wav", ofType: nil)!
		url = URL(fileURLWithPath: path)
		audioPlayer?.delegate = self
		audioPlayer?.prepareToPlay()
	}
	
	fileprivate func playChaChingSound() {
		
		do {
			turnDownBackgroundVolume()
			audioPlayer = try AVAudioPlayer(contentsOf: url!)
			audioPlayer?.delegate = self
			audioPlayer?.play()
		} catch let err {
			print(err)
		}
	}
	
	fileprivate func turnDownBackgroundVolume() {
		do {
			try audioSession.setActive(true, options: AVAudioSession.SetActiveOptions.notifyOthersOnDeactivation)
		} catch let err {
			print("Failed to turn Down Backgrund Volume", err)
		}
	}
}


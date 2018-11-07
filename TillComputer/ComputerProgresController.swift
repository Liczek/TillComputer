//
//  ComputerProgresController.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 04/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit
import AVFoundation

class ComputerProgresController: UIViewController {
	
	let finishValue: CGFloat = 3000
	var currentValue: CGFloat = 100
	var percentage: CGFloat = 0
	let windowHeight = UIApplication.shared.keyWindow?.frame.height
	
	let navigationBarView: NavigationBarView = {
		let view = NavigationBarView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .heavyGold
		return view
	}()
	
	let progresBarView: ProgresBarView = {
		let view = ProgresBarView()
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
//		view.backgroundColor = .red
		return view
	}()
	
	var audioPlayer: AVAudioPlayer?
	var url: URL?
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let path = Bundle.main.path(forResource: "cha_ching.wav", ofType: nil)!
		url = URL(fileURLWithPath: path)
		
		
		
		navigationController?.setNavigationBarHidden(true, animated: false)
		
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.barTintColor = .heavyGold
		navigationController?.navigationBar.tintColor = .shinningGold
		
		view.backgroundColor = .heavyGold
		navigationItem.title = "Till Computer"
		
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.shinningGold, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)]
		navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.shinningGold, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)]

		view.addSubview(navigationBarView)
		view.addSubview(progresBarView)
		view.addSubview(componentsView)
		view.addSubview(bottomBarView)
		view.addSubview(currentMoneyView)
		
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
			currentMoneyView.widthAnchor.constraint(equalToConstant: 40),
			])
		
		
		navigationBarView.addButton.addTarget(self, action: #selector(addMoney), for: .touchUpInside)
		updateClearViewHeight(addedValue: 0)
		
	}
	
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		navigationController?.navigationBar.prefersLargeTitles = false
		
		
		
		
	}
	
	
	@objc func addMoney() {
		let valueToAdd: CGFloat = 10
		let moneyView: MoneyView = {
			let view = MoneyView()
//			view.backgroundColor = .blue
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: url!)
			audioPlayer?.play()
		} catch let err {
			print(err)
		}
		
		var centerXAnchor: NSLayoutConstraint!
		var centerYAnchor: NSLayoutConstraint!

		
		UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
			
			self.view.addSubview(moneyView)

			
			NSLayoutConstraint.activate([
				moneyView.widthAnchor.constraint(equalToConstant: 110),
				moneyView.heightAnchor.constraint(equalToConstant: 50),
				])
			centerXAnchor = moneyView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
			centerXAnchor.isActive = true
			centerYAnchor = moneyView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)
			centerYAnchor.isActive = true
			moneyView.transform = CGAffineTransform(scaleX: 3, y: 3)
			
			
		}) { (true) in
			UIView.animate(withDuration: 0.3, animations: {
				moneyView.transform = CGAffineTransform(scaleX: 1, y: 1)
				centerXAnchor.constant = -150
				centerYAnchor.constant = 100
				self.view.layoutIfNeeded()
				moneyView.alpha = 0.2
				
			}, completion: { (true) in
				moneyView.removeFromSuperview()
				UIView.animate(withDuration: 0.5, animations: {
					self.updateClearViewHeight(addedValue: valueToAdd)
				})
			})
			
			
		}
		
		
		
		
		
	}
	
	func updateClearViewHeight(addedValue: CGFloat) {
		currentValue += addedValue
		percentage = currentValue / finishValue
		let windowHeight = componentsView.mainWindowHeight
		let clearViewHeight = windowHeight! * percentage
		
		componentsView.blurViewBottomAnchor.constant = -clearViewHeight
		componentsView.blurView.layoutIfNeeded()
		progresBarView.progresViewShadowBottomAnchor.constant = -clearViewHeight
		progresBarView.progresViewShadow.layoutIfNeeded()
		progresBarView.progresValueLabel.text = "\((Int(percentage * 100)))%"
		
		currentMoneyView.currentMoney = Int(currentValue)
		currentMoneyView.finishMoney = Int(finishValue)
		currentMoneyView.configureMoneyLabel()
	}


}


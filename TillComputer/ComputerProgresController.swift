//
//  ComputerProgresController.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 04/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class ComputerProgresController: UIViewController {
	
	let finishValue: CGFloat = 3000
	var currentValue: CGFloat = 100
	var percentage: CGFloat = 0
	let windowHeight = UIApplication.shared.keyWindow?.frame.height
	let statusBarHeight = UIApplication.shared.statusBarFrame.height
	
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
	
	
	
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		

		
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
		
		NSLayoutConstraint.activate([
			
			navigationBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: statusBarHeight),
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
			
//			bottomBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//			bottomBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//			bottomBarView.leadingAnchor.con
			])
		
		updateClearViewHeight(addedValue: 0)
		
	}
	
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		navigationController?.navigationBar.prefersLargeTitles = false
		
		
		
	}
	
	
	@objc func addMoney() {
		let valueToAdd: CGFloat = 10
		updateClearViewHeight(addedValue: valueToAdd)
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
	}


}


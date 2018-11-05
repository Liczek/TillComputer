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
	
	let addButton: UIButton = {
		let view = UIButton()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.setImage(UIImage(named: "dolar"), for: .normal)
		view.imageView?.contentMode = .scaleAspectFit
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: addButton)
		addButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
		addButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
		addButton.addTarget(self, action: #selector(addMoney), for: .touchUpInside)

		
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.barTintColor = .heavyGold
		navigationController?.navigationBar.tintColor = .shinningGold
		
		view.backgroundColor = .heavyGold
		navigationItem.title = "Till Computer"
		
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.shinningGold, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)]
		navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.shinningGold, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)]

		view.addSubview(progresBarView)
		view.addSubview(componentsView)
		view.addSubview(bottomBarView)
		
		NSLayoutConstraint.activate([
			
			progresBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			progresBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			progresBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			progresBarView.widthAnchor.constraint(equalToConstant: 50),
			
			componentsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			componentsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			componentsView.leadingAnchor.constraint(equalTo: progresBarView.trailingAnchor),
			componentsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			
//			bottomBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//			bottomBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//			bottomBarView.leadingAnchor.con
			])
		
		updateClearViewHeight(addedValue: 0)
		
	}
	
	@objc func addMoney() {
		let valueToAdd: CGFloat = 10
		updateClearViewHeight(addedValue: valueToAdd)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		navigationController?.navigationBar.prefersLargeTitles = false
		
		
		
	}
	
	func updateProgres() {
		
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


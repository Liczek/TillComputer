//
//  ComputerProgresController.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 04/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class ComputerProgresController: UIViewController {
	
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
	

	override func viewDidLoad() {
		super.viewDidLoad()
		

		view.backgroundColor = .gold
		navigationItem.title = "Till Computer"
		
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.heavyGold]
		navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.heavyGold]

		
		
		view.addSubview(progresBarView)
		view.addSubview(componentsView)
		
		
		NSLayoutConstraint.activate([
			
			
			progresBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			progresBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			progresBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			progresBarView.widthAnchor.constraint(equalToConstant: 50),
			
			componentsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			componentsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			componentsView.leadingAnchor.constraint(equalTo: progresBarView.trailingAnchor),
			componentsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			
			])
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		navigationController?.navigationBar.prefersLargeTitles = false
	}


}


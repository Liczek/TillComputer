//
//  SettingItemsVC.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 27/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class SettingItemsVC: UIViewController {

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .blue
		
		configureNavigationController()
		
	}
	
	fileprivate func configureNavigationController() {
//		navigationItem.title = "Donations"
		navigationController?.navigationBar.barTintColor = .veryDarkRed
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.tintColor = .black
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<< Back", style: .plain, target: self, action: #selector(handleBackButton))
		
	}
	
	@objc fileprivate func handleBackButton() {
		dismiss(animated: true, completion: nil)
	}
}

//
//  AboutViewController.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 27/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class AboutViewController: SettingItemsVC {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.title = "About"
//		view.backgroundColor = .red
		
	}
	
}

//
//  SettingItemsVC.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 27/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class SettingItemsVC: UIViewController {

	let button: UIButton = {
		let btn = UIButton(type: UIButton.ButtonType.system)
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setImage(UIImage(named: "arrow back")?.withRenderingMode(.alwaysTemplate), for: .normal)
		return btn
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .lightGray
		
		configureNavigationController()
		
	}
	
	fileprivate func configureNavigationController() {
//		navigationItem.title = "Donations"
		navigationController?.navigationBar.barTintColor = .veryDarkRed
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.tintColor = .black
		
//		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow back"), style: .plain, target: self, action: #selector(handleBackButton))
		
		navigationController?.navigationBar.addSubview(button)
		button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
		NSLayoutConstraint.activate([
			
			button.leadingAnchor.constraint(equalTo: (navigationController?.navigationBar.leadingAnchor)!, constant: 8),
			button.heightAnchor.constraint(equalToConstant: 40),
			button.widthAnchor.constraint(equalToConstant: 40),
			button.topAnchor.constraint(equalTo: (navigationController?.navigationBar.topAnchor)!, constant: 8)
			
			])
	}
	
	@objc fileprivate func handleBackButton() {
		dismiss(animated: true, completion: nil)
	}
}

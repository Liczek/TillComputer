//
//  SettingRowView.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 21/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class SettingRowView: UIView {
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 22)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let icon: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	
	var name: String
	var iconName: String
	
	init(name: String, iconName: String, width: CGFloat, height: CGFloat) {
		self.name = name
		self.iconName = iconName
		
		super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
		
		self.addSubview(icon)
		self.addSubview(nameLabel)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setConstraints() {
		icon.setImage(UIImage(named: iconName), for: .normal)
		nameLabel.text = name
		
		translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			
			icon.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			icon.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			icon.widthAnchor.constraint(equalToConstant: 40),
			icon.heightAnchor.constraint(equalToConstant: 40),
			
			nameLabel.trailingAnchor.constraint(equalTo: icon.leadingAnchor, constant: -8),
			nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			
			])
	}
}

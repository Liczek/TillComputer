//
//  NavigationBarView.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 06/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class NavigationBarView: UIView {
	
	let wowImageView: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.image = UIImage(named: "wow")
		view.contentMode = .scaleAspectFit
		return view
	}()
	
	let addButton: UIButton = {
		let view = UIButton(type: UIButton.ButtonType.system)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.setImage(UIImage(named: "dolar")?.withRenderingMode(.alwaysOriginal) , for: .normal)
		view.contentMode = .scaleAspectFit
		view.imageEdgeInsets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
		view.layer.borderColor = UIColor.lightGold.cgColor
		view.layer.borderWidth = 3
		view.layer.cornerRadius = 25
		view.clipsToBounds = true
		
		
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(wowImageView)
		addSubview(addButton)
		
		NSLayoutConstraint.activate([
			wowImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
			wowImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
			wowImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			
			addButton.centerYAnchor.constraint(equalTo: wowImageView.centerYAnchor),
			addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
			addButton.heightAnchor.constraint(equalToConstant: 50),
			addButton.widthAnchor.constraint(equalToConstant: 50),
			])
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

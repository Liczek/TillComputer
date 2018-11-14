//
//  NavigationBarView.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 06/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class NavigationBarView: UIView {
	
	let bgImageView: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.image = UIImage(named: "bghorde")
		view.contentMode = .scaleAspectFill
		return view
	}()
	
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
		view.layer.cornerRadius = 10
		view.alpha = 0.8
		view.clipsToBounds = true
		return view
	}()
	
	let listButton: UIButton = {
		let view = UIButton(type: UIButton.ButtonType.system)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.setImage(UIImage(named: "list2")?.withRenderingMode(.alwaysTemplate) , for: .normal)
		view.tintColor = .lightGold
		view.contentMode = .scaleAspectFit
		view.imageEdgeInsets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
		view.layer.borderColor = UIColor.lightGold.cgColor
		view.layer.borderWidth = 3
		view.layer.cornerRadius = 10
		view.alpha = 0.8
		view.clipsToBounds = true
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(bgImageView)
		addSubview(wowImageView)
		addSubview(addButton)
		addSubview(listButton)
		
		
		
		NSLayoutConstraint.activate([
			bgImageView.topAnchor.constraint(equalTo: topAnchor),
			bgImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
			bgImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			bgImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			wowImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
			wowImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
			wowImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			
			addButton.centerYAnchor.constraint(equalTo: wowImageView.centerYAnchor),
			addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			addButton.heightAnchor.constraint(equalToConstant: 50),
			addButton.widthAnchor.constraint(equalToConstant: 50),
			
			listButton.centerYAnchor.constraint(equalTo: wowImageView.centerYAnchor),
			listButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			listButton.heightAnchor.constraint(equalToConstant: 50),
			listButton.widthAnchor.constraint(equalToConstant: 50),
			])
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

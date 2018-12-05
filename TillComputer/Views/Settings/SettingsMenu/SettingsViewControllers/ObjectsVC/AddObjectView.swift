//
//  AddObjectView.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 05/12/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class AddObjectView: UIView {
	
	let containerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .gold
		view.layer.cornerRadius = 10
		view.clipsToBounds = true
		return view
	}()
	
	let textLabel: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.font = UIFont.boldSystemFont(ofSize: 22)
		text.textColor = UIColor.white
		text.text = "Tap to add new object"
		text.textAlignment = .center
		return text
	}()
	
	let plusIconButton: UIButton = {
		let button = UIButton(type: UIButton.ButtonType.system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .gold
		button.layer.cornerRadius = 10
		button.clipsToBounds = true
		button.layer.borderWidth = 2
		button.layer.borderColor = UIColor.white.cgColor
		button.setImage(UIImage(named: "plus2")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
		button.contentMode = .scaleAspectFit
		button.tintColor = .white
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(containerView)
		
		containerView.addSubview(plusIconButton)
		containerView.addSubview(textLabel)
		
		NSLayoutConstraint.activate([
			
			containerView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
			containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
			
			plusIconButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
			plusIconButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
			plusIconButton.widthAnchor.constraint(equalTo: plusIconButton.heightAnchor, constant: 0),
			plusIconButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
			
			textLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
			textLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
			textLabel.trailingAnchor.constraint(equalTo: plusIconButton.leadingAnchor, constant: -8),
			])
		
		
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}

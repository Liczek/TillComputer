//
//  MoneyView.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 06/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class MoneyView: UIView {
	
	let container: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		
		view.layer.borderColor = UIColor.lightGold.cgColor
		view.layer.borderWidth = 3
		view.layer.cornerRadius = 10
		view.clipsToBounds = true
		view.backgroundColor = UIColor.lightGold.withAlphaComponent(0.5)
		return view
	}()
	
	let moneyLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "+10"
		label.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
		label.textColor = .shinningGold
		return label
	}()

	let dolarImageView: UIButton = {
		let view = UIButton(type: UIButton.ButtonType.system)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.setImage(UIImage(named: "dolar")?.withRenderingMode(.alwaysOriginal) , for: .normal)
		view.contentMode = .scaleAspectFit
		view.imageEdgeInsets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
		
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(container)
		container.addSubview(dolarImageView)
		container.addSubview(moneyLabel)
		
		NSLayoutConstraint.activate([
			container.topAnchor.constraint(equalTo: topAnchor),
			container.bottomAnchor.constraint(equalTo: bottomAnchor),
			container.leadingAnchor.constraint(equalTo: leadingAnchor),
			container.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			dolarImageView.topAnchor.constraint(equalTo: container.topAnchor),
			dolarImageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
			dolarImageView.widthAnchor.constraint(equalToConstant: 50),
			dolarImageView.heightAnchor.constraint(equalToConstant: 50),
			
			moneyLabel.trailingAnchor.constraint(equalTo: dolarImageView.leadingAnchor),
			moneyLabel.centerYAnchor.constraint(equalTo: dolarImageView.centerYAnchor),
			
			
			])
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

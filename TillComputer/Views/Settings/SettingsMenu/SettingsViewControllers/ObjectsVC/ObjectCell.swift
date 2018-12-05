//
//  ObjectCell.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 05/12/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class ObjectCell: UITableViewCell {
	
	let containerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .lightGold
		view.layer.cornerRadius = 10
		view.clipsToBounds = true
		return view
	}()
	
	let objectImage: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
//		view.backgroundColor = .red
		view.image = UIImage(named: "mouse")
		view.contentMode = .scaleAspectFit
		view.clipsToBounds = true
		return view
	}()
	
	let valueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "125$"
		label.textAlignment = .center
		label.font = UIFont.boldSystemFont(ofSize: 24)
		label.textColor = UIColor.darkGold
		return label
	}()
	
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		backgroundColor = .clear
		
		addSubview(containerView)
		containerView.addSubview(valueLabel)
		containerView.addSubview(objectImage)
		
		NSLayoutConstraint.activate([
			
			containerView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
			containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
			
			valueLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4),
			valueLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
			
			objectImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4),
			objectImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
			objectImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
			objectImage.bottomAnchor.constraint(equalTo: valueLabel.topAnchor, constant: -8),
			
			])
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}

//
//  SettingsCell.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 19/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
	
	let bgView: UIView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .clear
		return view
	}()
	
	let bgImage: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .clear
		view.image = UIImage(named: "verticalBar")
		view.contentMode = .scaleToFill
		view.clipsToBounds = true
		view.alpha = 0.5
		return view
	}()
	
	let icon: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.image = UIImage(named: "horde_logo")
		view.contentMode = .scaleAspectFit
		return view
	}()
	
	let settingNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "\(Int(ValueToAdd))zł"
		label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
		label.textColor = .veryDarkRed
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		backgroundColor = .clear
		selectionStyle = .none
		
		addSubview(bgImage)
		addSubview(bgView)
		bgView.addSubview(icon)
		bgView.addSubview(settingNameLabel)
		
		NSLayoutConstraint.activate([
			
			bgImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
			bgImage.bottomAnchor.constraint(equalTo: bottomAnchor),
			bgImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
			bgImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
			
			bgView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
			bgView.bottomAnchor.constraint(equalTo: bottomAnchor),
			bgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
			bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
			
			icon.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
			icon.widthAnchor.constraint(equalToConstant: 50),
			icon.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 8),
			icon.heightAnchor.constraint(equalTo: icon.widthAnchor),
			
			settingNameLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8),
			settingNameLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -8),
			settingNameLabel.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 8),
			settingNameLabel.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -8),
			
			])
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

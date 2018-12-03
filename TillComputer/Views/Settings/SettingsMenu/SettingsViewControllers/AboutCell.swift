//
//  AboutCell.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 03/12/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

struct AboutSetting {
	let name: String
	let iconName: String
	let iconColor: UIColor?
}

class AboutCell: UITableViewCell {
	
	let horizontalSpacing: CGFloat = 16
	let verticalSpacing: CGFloat = 8
	
	
	let iconView: UIImageView = {
		let icon = UIImageView()
		icon.translatesAutoresizingMaskIntoConstraints = false
		icon.contentMode = .scaleAspectFit
		return icon
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 20)
		label.textColor = .darkGray
		label.text = "Sample of beginning verry long long text"
		return label
	}()
	
	let indicatorIcon: UIButton = {
		let button = UIButton()
		button.setImage(UIImage(named: "rightIndicator")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
		button.imageView?.contentMode = .scaleAspectFit
		button.translatesAutoresizingMaskIntoConstraints = false
		button.tintColor = UIColor.lightGray
		return button
	}()
	
	let separatorView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .lightGray
		return view
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		
		
		backgroundColor = .white
		
		addSubview(iconView)
		addSubview(indicatorIcon)
		addSubview(nameLabel)
		addSubview(separatorView)
		
		NSLayoutConstraint.activate([
			
			iconView.leadingAnchor.constraint(equalTo: leadingAnchor),
			iconView.widthAnchor.constraint(equalToConstant: 70),
			iconView.topAnchor.constraint(equalTo: topAnchor, constant: verticalSpacing),
			iconView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -verticalSpacing),
			
			indicatorIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
			indicatorIcon.widthAnchor.constraint(equalToConstant: 56),
			indicatorIcon.topAnchor.constraint(equalTo: iconView.topAnchor, constant: verticalSpacing),
			indicatorIcon.bottomAnchor.constraint(equalTo: iconView.bottomAnchor, constant: -verticalSpacing),
			
			nameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 0),
			nameLabel.trailingAnchor.constraint(equalTo: indicatorIcon.leadingAnchor, constant: 0),
			nameLabel.topAnchor.constraint(equalTo: iconView.topAnchor),
			nameLabel.bottomAnchor.constraint(equalTo: iconView.bottomAnchor),
			
			separatorView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
			separatorView.heightAnchor.constraint(equalToConstant: 1),
			separatorView.leadingAnchor.constraint(equalTo: iconView.trailingAnchor),
			separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			
			])
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

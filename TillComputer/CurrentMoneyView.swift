//
//  CurrentMoneyView.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 06/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class CurrentMoneyView: UIView {
	var currentMoney: Int = 0
	var finishMoney: Int = 0
	
	var currentMoneyLabel: UILabel = {
		var label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "100zł / 3000zł"
		label.textColor = .shinningGold
		return label
	}()
	
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(currentMoneyLabel)
		currentMoneyLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 1.5)
		
		configureMoneyLabel()
		
		NSLayoutConstraint.activate([
			currentMoneyLabel.topAnchor.constraint(equalTo: topAnchor),
			currentMoneyLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
			currentMoneyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			currentMoneyLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			
			])
	}
	
	func configureMoneyLabel() {
		let attributedText = NSMutableAttributedString(string: "\(currentMoney)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.heavyGold, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.heavy)])
		attributedText.append(NSAttributedString(string: " zł", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGold, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)]))
		attributedText.append(NSAttributedString(string: " / ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.shinningGold, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.bold)]))
		attributedText.append(NSAttributedString(string: "\(finishMoney)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.heavyGold, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.heavy)]))
		attributedText.append(NSAttributedString(string: " zł", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGold, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)]))
		
		currentMoneyLabel.attributedText = attributedText
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

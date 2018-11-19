//
//  ProgresBarView.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 04/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class ProgresBarView: UIView {
	
	var progresValue: CGFloat = 51
	var progresViewShadowBottomAnchor: NSLayoutConstraint!
	
	let progresViewShadow: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = UIColor.bgColor.withAlphaComponent(0.8)
		view.image = UIImage(named: "leftBar")
		view.contentMode = .scaleAspectFill
		view.clipsToBounds = true
		view.backgroundColor = .gold
		view.alpha = 0.9
		view.layer.borderWidth = 2
		view.layer.borderColor = UIColor.veryDarkRed.cgColor
		return view
	}()
	
	let progresView: UIView = {
		let view = UIView()
		view.backgroundColor = .veryDarkRed
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let progresValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.boldSystemFont(ofSize: 18)
		label.textColor = .shinningGold
		return label
	}()
	
	let progresBordeView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .veryDarkRed
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(progresViewShadow)
		addSubview(progresView)
		addSubview(progresValueLabel)
		addSubview(progresBordeView)
		
		NSLayoutConstraint.activate([
			
			progresView.topAnchor.constraint(equalTo: progresViewShadow.bottomAnchor),
			progresView.bottomAnchor.constraint(equalTo: bottomAnchor),
			progresView.leadingAnchor.constraint(equalTo: leadingAnchor),
			progresView.trailingAnchor.constraint(equalTo: trailingAnchor),

			
			progresViewShadow.topAnchor.constraint(equalTo: topAnchor, constant: 0),
			progresViewShadow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
			progresViewShadow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
			
			progresValueLabel.topAnchor.constraint(equalTo: progresViewShadow.bottomAnchor),
			progresValueLabel.centerXAnchor.constraint(equalTo: progresViewShadow.centerXAnchor),
			
			progresBordeView.leadingAnchor.constraint(equalTo: progresViewShadow.leadingAnchor),
			progresBordeView.trailingAnchor.constraint(equalTo: progresViewShadow.trailingAnchor),
			progresBordeView.bottomAnchor.constraint(equalTo: progresViewShadow.bottomAnchor),
			progresBordeView.heightAnchor.constraint(equalToConstant: 4),
			
			])
		
		progresValueLabel.text = "\(progresValue)%"
		
		progresViewShadowBottomAnchor = progresViewShadow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -progresValue)
		
		progresViewShadowBottomAnchor.isActive = true
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

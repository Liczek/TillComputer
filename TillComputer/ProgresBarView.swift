//
//  ProgresBarView.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 04/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class ProgresBarView: UIView {
	
	var progresBarHeight: CGFloat = 150
	var progresValue: CGFloat = 51
	var progresViewShadowBottomAnchor: NSLayoutConstraint!
	
	let view: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let progresViewShadow: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = UIColor.bgColor.withAlphaComponent(0.8)
		view.image = UIImage(named: "leftBar")
		view.contentMode = .scaleAspectFill
		view.clipsToBounds = true
		view.backgroundColor = .gold
		view.alpha = 0.9
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
	
	let rigthVerticalSeparator: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .veryDarkRed
		return view
	}()
	
	let leftVerticalSeparator: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .darkGold
		return view
	}()
	
	let topSeparator: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .veryDarkRed
		return view
	}()
	
	let bottomSeparator: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .darkGold
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(view)
		view.addSubview(progresViewShadow)
		view.addSubview(progresView)
		view.addSubview(rigthVerticalSeparator)
		view.addSubview(leftVerticalSeparator)
		view.addSubview(topSeparator)
		view.addSubview(bottomSeparator)
		
		view.addSubview(progresValueLabel)
		view.addSubview(progresBordeView)
		
		NSLayoutConstraint.activate([
			
			view.topAnchor.constraint(equalTo: topAnchor),
			view.bottomAnchor.constraint(equalTo: bottomAnchor),
			view.leadingAnchor.constraint(equalTo: leadingAnchor),
			view.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			progresView.topAnchor.constraint(equalTo: progresViewShadow.bottomAnchor),
			progresView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			progresView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			progresView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			
			rigthVerticalSeparator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			rigthVerticalSeparator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			rigthVerticalSeparator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
			rigthVerticalSeparator.widthAnchor.constraint(equalToConstant: 2),
			
			leftVerticalSeparator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			leftVerticalSeparator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			leftVerticalSeparator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
			leftVerticalSeparator.widthAnchor.constraint(equalToConstant: 5),
			
			topSeparator.topAnchor.constraint(equalTo: topAnchor),
			topSeparator.heightAnchor.constraint(equalToConstant: 3),
			topSeparator.leadingAnchor.constraint(equalTo: leftVerticalSeparator.trailingAnchor),
			topSeparator.trailingAnchor.constraint(equalTo: rigthVerticalSeparator.leadingAnchor),
			
			bottomSeparator.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			bottomSeparator.heightAnchor.constraint(equalToConstant: 3),
			bottomSeparator.leadingAnchor.constraint(equalTo: leftVerticalSeparator.trailingAnchor),
			bottomSeparator.trailingAnchor.constraint(equalTo: rigthVerticalSeparator.leadingAnchor),
			
			progresViewShadow.topAnchor.constraint(equalTo: topSeparator.bottomAnchor),
			progresViewShadow.leadingAnchor.constraint(equalTo: leftVerticalSeparator.trailingAnchor),
			progresViewShadow.trailingAnchor.constraint(equalTo: rigthVerticalSeparator.leadingAnchor),
			
			progresValueLabel.topAnchor.constraint(equalTo: progresViewShadow.bottomAnchor),
			progresValueLabel.centerXAnchor.constraint(equalTo: progresViewShadow.centerXAnchor),
			
			progresBordeView.leadingAnchor.constraint(equalTo: leftVerticalSeparator.trailingAnchor),
			progresBordeView.trailingAnchor.constraint(equalTo: rigthVerticalSeparator.leadingAnchor),
			progresBordeView.bottomAnchor.constraint(equalTo: progresViewShadow.bottomAnchor),
			progresBordeView.heightAnchor.constraint(equalToConstant: 3),
			])
		
		progresValueLabel.text = "\(progresValue)%"
		
		progresViewShadowBottomAnchor = progresViewShadow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -progresValue)
		
		progresViewShadowBottomAnchor.isActive = true
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

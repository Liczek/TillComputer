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
	
	let progresViewShadow: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.shinningGold.withAlphaComponent(0.8)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let progresView: UIView = {
		let view = UIView()
		view.backgroundColor = .darkGold
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
		view.backgroundColor = .lightGold
		return view
	}()
	
	let rigthVerticalSeparator: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .heavyGold
		return view
	}()
	
	let leftVerticalSeparator: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .heavyGold
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(view)
		view.addSubview(progresView)
		view.addSubview(rigthVerticalSeparator)
		view.addSubview(leftVerticalSeparator)
		view.addSubview(progresViewShadow)
		view.addSubview(progresValueLabel)
		view.addSubview(progresBordeView)
		
		NSLayoutConstraint.activate([
			
			view.topAnchor.constraint(equalTo: topAnchor),
			view.bottomAnchor.constraint(equalTo: bottomAnchor),
			view.leadingAnchor.constraint(equalTo: leadingAnchor),
			view.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			progresView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
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
			
			progresViewShadow.topAnchor.constraint(equalTo: view.topAnchor),
			progresViewShadow.leadingAnchor.constraint(equalTo: progresView.leadingAnchor),
			progresViewShadow.trailingAnchor.constraint(equalTo: progresView.trailingAnchor),
			
			progresValueLabel.topAnchor.constraint(equalTo: progresViewShadow.bottomAnchor),
			progresValueLabel.centerXAnchor.constraint(equalTo: progresViewShadow.centerXAnchor),
			
			progresBordeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			progresBordeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			progresBordeView.bottomAnchor.constraint(equalTo: progresViewShadow.bottomAnchor),
			progresBordeView.heightAnchor.constraint(equalToConstant: 4),
			])
		
		progresValueLabel.text = "\(progresValue)%"
		
		progresViewShadowBottomAnchor = progresViewShadow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -progresValue)
		progresViewShadowBottomAnchor.isActive = true
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

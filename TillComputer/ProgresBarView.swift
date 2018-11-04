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
	var progresValue = 51
	
	let view: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let progresViewShadow: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.gold.withAlphaComponent(0.7)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let progresView: UIView = {
		let view = UIView()
		view.backgroundColor = .heavyGold
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let progresValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.boldSystemFont(ofSize: 22)
		label.textColor = .shinningGold
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(view)
		view.addSubview(progresView)
		view.addSubview(progresViewShadow)
		view.addSubview(progresValueLabel)
		
		NSLayoutConstraint.activate([
			
			view.topAnchor.constraint(equalTo: topAnchor),
			view.bottomAnchor.constraint(equalTo: bottomAnchor),
			view.leadingAnchor.constraint(equalTo: leadingAnchor),
			view.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			progresView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			progresView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			progresView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			progresView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			
			progresViewShadow.topAnchor.constraint(equalTo: progresView.topAnchor),
			progresViewShadow.heightAnchor.constraint(equalToConstant: progresBarHeight),
			progresViewShadow.leadingAnchor.constraint(equalTo: progresView.leadingAnchor),
			progresViewShadow.trailingAnchor.constraint(equalTo: progresView.trailingAnchor),
			
			progresValueLabel.topAnchor.constraint(equalTo: progresViewShadow.bottomAnchor),
			progresValueLabel.centerXAnchor.constraint(equalTo: progresViewShadow.centerXAnchor),
			])
		
		progresValueLabel.text = "\(progresValue)%"
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

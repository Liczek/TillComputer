//
//  ComponentsView.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 04/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class ComponentsView: UIView {
	
	var progresValue: CGFloat = 200
//	let mainWindowHeight = UIApplication.shared.keyWindow?.frame.height
	
	let blurView: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = UIColor.bgColor.withAlphaComponent(0.8)
		view.image = UIImage(named: "shadowImage")
		view.contentMode = .scaleAspectFill
		view.clipsToBounds = true
		view.alpha = 0.9
		return view
	}()
	
	let view: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .gold
		return view
	}()
	
	let cpuView: UIImageView = {
		let view = UIImageView()
		view.image = UIImage(named: "cpu")
		view.contentMode = .scaleAspectFit
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let mouseView: UIImageView = {
		let view = UIImageView()
		view.image = UIImage(named: "mouse")
		view.contentMode = .scaleAspectFit
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let headsetView: UIImageView = {
		let view = UIImageView()
		view.image = UIImage(named: "headset")
		view.contentMode = .scaleAspectFit
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let wowView: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let progresBordeView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .darkRed
		return view
	}()
	
	var blurViewBottomAnchor: NSLayoutConstraint!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(view)
		view.addSubview(cpuView)
		view.addSubview(mouseView)
		view.addSubview(headsetView)
		
		view.addSubview(blurView)
		view.addSubview(progresBordeView)
		view.addSubview(wowView)
		
		NSLayoutConstraint.activate([
			
			view.topAnchor.constraint(equalTo: topAnchor),
			view.bottomAnchor.constraint(equalTo: bottomAnchor),
			view.leadingAnchor.constraint(equalTo: leadingAnchor),
			view.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			headsetView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
			headsetView.heightAnchor.constraint(equalTo: mouseView.heightAnchor),
			headsetView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			headsetView.widthAnchor.constraint(equalTo: view.widthAnchor),
			
			mouseView.topAnchor.constraint(equalTo: headsetView.bottomAnchor, constant: 16),
			mouseView.heightAnchor.constraint(equalTo: headsetView.heightAnchor),
			mouseView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			mouseView.widthAnchor.constraint(equalTo: view.widthAnchor),
			
			cpuView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
			cpuView.topAnchor.constraint(equalTo: mouseView.bottomAnchor, constant: 16),
			cpuView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
			cpuView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			cpuView.widthAnchor.constraint(equalTo: view.widthAnchor),
			
			blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			blurView.topAnchor.constraint(equalTo: view.topAnchor),
			
			progresBordeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			progresBordeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			progresBordeView.bottomAnchor.constraint(equalTo: blurView.bottomAnchor),
			progresBordeView.heightAnchor.constraint(equalToConstant: 4),
			
			])
		blurViewBottomAnchor = blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -progresValue)
		blurViewBottomAnchor.isActive = true
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

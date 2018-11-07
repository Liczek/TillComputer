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
	let mainWindowHeight = UIApplication.shared.keyWindow?.frame.height
	
	let blurView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = UIColor.gold.withAlphaComponent(0.8)
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
		view.backgroundColor = .lightGold
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
			
			cpuView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -mainWindowHeight! * 0.015),
			cpuView.heightAnchor.constraint(equalToConstant: mainWindowHeight! * 0.4),
			cpuView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			cpuView.widthAnchor.constraint(equalTo: view.widthAnchor),
			
			mouseView.bottomAnchor.constraint(equalTo: cpuView.topAnchor, constant: -mainWindowHeight! * 0.015),
			mouseView.heightAnchor.constraint(equalToConstant: mainWindowHeight! * 0.15),
			mouseView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			mouseView.widthAnchor.constraint(equalTo: view.widthAnchor),
			
			headsetView.bottomAnchor.constraint(equalTo: mouseView.topAnchor, constant: -mainWindowHeight! * 0.015),
			headsetView.heightAnchor.constraint(equalToConstant: mainWindowHeight! * 0.15),
			headsetView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			headsetView.widthAnchor.constraint(equalTo: view.widthAnchor),
			
			blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			blurView.topAnchor.constraint(equalTo: view.topAnchor),
			
			progresBordeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			progresBordeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			progresBordeView.bottomAnchor.constraint(equalTo: blurView.bottomAnchor),
			progresBordeView.heightAnchor.constraint(equalToConstant: 2),
			
			])
		blurViewBottomAnchor = blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -progresValue)
		blurViewBottomAnchor.isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

//
//  ComputerProgresController.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 04/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class ComputerProgresController: UIViewController {
	
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
	
	let cpuViewShadow: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.gold.withAlphaComponent(0.7)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let cpuView: UIImageView = {
		let view = UIImageView()
		view.image = UIImage(named: "cpu")
		view.contentMode = .scaleAspectFit
		view.backgroundColor = .heavyGold
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let mouseViewShadow:UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.gold.withAlphaComponent(0.7)
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
	
	let headsetViewShadow:UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.gold.withAlphaComponent(0.7)
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

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .gold
		navigationItem.title = "Till Computer"
		
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.heavyGold]
		navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.heavyGold]


		view.addSubview(cpuView)
		view.addSubview(mouseView)
		view.addSubview(cpuViewShadow)
		view.addSubview(headsetView)
		view.addSubview(mouseViewShadow)
		view.addSubview(headsetViewShadow)
		view.addSubview(progresView)
		view.addSubview(progresViewShadow)
		view.addSubview(wowView)
		
		NSLayoutConstraint.activate([
			
			progresView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			progresView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			progresView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			progresView.widthAnchor.constraint(equalToConstant: 40),
			
			progresViewShadow.topAnchor.constraint(equalTo: progresView.topAnchor),
			progresViewShadow.heightAnchor.constraint(equalToConstant: 170),
			progresViewShadow.leadingAnchor.constraint(equalTo: progresView.leadingAnchor),
			progresViewShadow.trailingAnchor.constraint(equalTo: progresView.trailingAnchor),
			
		cpuView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
		cpuView.heightAnchor.constraint(equalToConstant: 300),
//		cpuView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//		cpuView.widthAnchor.constraint(equalTo: view.widthAnchor),
			cpuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
			cpuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		
		cpuViewShadow.topAnchor.constraint(equalTo: cpuView.topAnchor),
		cpuViewShadow.heightAnchor.constraint(equalToConstant: 150),
		cpuViewShadow.leadingAnchor.constraint(equalTo: cpuView.leadingAnchor),
		cpuViewShadow.trailingAnchor.constraint(equalTo: cpuView.trailingAnchor),
		
		mouseView.bottomAnchor.constraint(equalTo: cpuView.topAnchor, constant: -32),
		mouseView.heightAnchor.constraint(equalToConstant: 150),
		mouseView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
		mouseView.widthAnchor.constraint(equalTo: view.widthAnchor),
		
		mouseViewShadow.topAnchor.constraint(equalTo: mouseView.topAnchor),
		mouseViewShadow.heightAnchor.constraint(equalToConstant: 100),
		mouseViewShadow.leadingAnchor.constraint(equalTo: mouseView.leadingAnchor),
		mouseViewShadow.trailingAnchor.constraint(equalTo: mouseView.trailingAnchor),
		
		headsetView.bottomAnchor.constraint(equalTo: mouseView.topAnchor, constant: -32),
		headsetView.heightAnchor.constraint(equalToConstant: 150),
		headsetView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
		headsetView.widthAnchor.constraint(equalTo: view.widthAnchor),
		
		headsetViewShadow.topAnchor.constraint(equalTo: headsetView.topAnchor),
		headsetViewShadow.heightAnchor.constraint(equalToConstant: 70),
		headsetViewShadow.leadingAnchor.constraint(equalTo: headsetView.leadingAnchor),
		headsetViewShadow.trailingAnchor.constraint(equalTo: headsetView.trailingAnchor),
		])
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		navigationController?.navigationBar.prefersLargeTitles = false
	}


}


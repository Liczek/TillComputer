////
////  ViewWithSettings.swift
////  TillComputer
////
////  Created by Paweł Liczmański on 21/11/2018.
////  Copyright © 2018 Paweł Liczmański. All rights reserved.
////
//
//import UIKit
//
//struct SettingRow {
//	let name: String
//	let iconName: String
//}
//
//class ViewWithSettings: UIView {
//	
//	let row2 = SettingRow(name: "About", iconName: "setting")
//	let row1 = SettingRow(name: "Colors", iconName: "setting")
//	
//	override init(frame: CGRect) {
//		super.init(frame: frame)
//		
//		backgroundColor = .red
//		translatesAutoresizingMaskIntoConstraints = false
//	
//	}
//	
//	required init?(coder aDecoder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
//	
//	func createRowView(settingRow: SettingRow, index: CGFloat) -> UIView {
//		let containerView = SettingRowView(name: settingRow.name, iconName: settingRow.iconName, width: 150, height: 50)
//		containerView.translatesAutoresizingMaskIntoConstraints = false
//		
//		
//		NSLayoutConstraint.activate([
//			
//			containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
//			containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
//			containerView.widthAnchor.constraint(equalToConstant: 200),
//			containerView.heightAnchor.constraint(equalToConstant: 60)
//			
//			])
//		
//		return containerView
//	}
//	
//	func setObjects() {
//		UIView.animate(withDuration: 2, delay: 2, options: .curveEaseOut, animations: {
//			
//			self.addSubview(self.createRowView(settingRow: self.row1, index: 0))
//			
//			
//		}) { (true) in
//			
//			
//			
//		}
//	}
//	
//	
//}

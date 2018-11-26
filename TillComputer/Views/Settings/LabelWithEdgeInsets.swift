//
//  LabelWithEdgeInsets.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 26/11/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class LabelWithEdgeInsets: UILabel {
	var verticalPadding: CGFloat = 4
	var horizontalPadding: CGFloat = 8
	
	override func drawText(in rect: CGRect) {
		let insets = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
		super.drawText(in: rect.inset(by: insets))
	}
	
	override var intrinsicContentSize: CGSize {
		let size = super.intrinsicContentSize
		return CGSize(width: size.width + (2 * horizontalPadding), height: size.height + (2 * verticalPadding))
	}
	
}

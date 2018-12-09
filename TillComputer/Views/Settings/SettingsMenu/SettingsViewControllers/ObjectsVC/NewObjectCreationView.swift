//
//  NewObjectCreationView.swift
//  TillComputer
//
//  Created by Paweł Liczmański on 06/12/2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

protocol NewObjectCreationViewDelegate {
	func didCreateNewObject(value: CGFloat, image: UIImage)
}

class NewObjectCreationView: SettingItemsVC, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	var delegate: NewObjectCreationViewDelegate?
	
	let containerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .veryDarkRed
		view.layer.cornerRadius = 10
		view.clipsToBounds = true
		view.layer.borderWidth = 2
		view.layer.borderColor = UIColor.white.cgColor
		return view
	}()
	
	let imageView: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.isUserInteractionEnabled = true
		view.backgroundColor = .gold
		view.layer.cornerRadius = 10
		view.clipsToBounds = true
		view.layer.borderWidth = 2
		view.layer.borderColor = UIColor.white.cgColor
		return view
	}()
	
	let valueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.textColor = .white
		label.text = "Value:"
		label.textAlignment = .left
		return label
	}()
	
	let valueTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = "Set object value"
		textField.borderStyle = UITextField.BorderStyle.roundedRect
		textField.backgroundColor = UIColor.gold
		textField.keyboardType = .decimalPad
		textField.textAlignment = .center
		textField.clearButtonMode = .always
		return textField
	}()
	
	let acceptValueButton: UIButton = {
		let button = UIButton(type: UIButton.ButtonType.system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.tintColor = .veryDarkRed
		button.backgroundColor = .gold
		button.addTarget(self, action: #selector(handelAccept), for: .touchUpInside)
		button.layer.cornerRadius = 10
		button.clipsToBounds = true
		button.setTitle("Accept", for: .normal)
		button.layer.borderWidth = 2
		button.layer.borderColor = UIColor.white.cgColor
		return button
	}()
	
	let tapLabel: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.font = UIFont.boldSystemFont(ofSize: 22)
		text.textColor = UIColor.white
		text.text = "Tap to add new object"
		text.textAlignment = .center
		return text
	}()
	
	let plusIcon: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .gold
		view.layer.cornerRadius = 10
		view.clipsToBounds = true
		view.layer.borderWidth = 2
		view.layer.borderColor = UIColor.white.cgColor
		view.image = UIImage(named: "plus2")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
		view.contentMode = .scaleAspectFit
		view.tintColor = .white
		return view
	}()
	
	
	let imagePicker = UIImagePickerController()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		imagePicker.delegate = self
		
		view.backgroundColor = .yellow
		
		view.addSubview(containerView)
		containerView.addSubview(imageView)
		containerView.addSubview(valueLabel)
		containerView.addSubview(valueTextField)
		containerView.addSubview(acceptValueButton)
		
		imageView.addSubview(tapLabel)
		imageView.addSubview(plusIcon)
		
		let tapImage = UITapGestureRecognizer(target: self, action: #selector(handelImageSelection))
		imageView.addGestureRecognizer(tapImage)
		
		NSLayoutConstraint.activate([
			
			containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
			containerView.heightAnchor.constraint(equalToConstant: 270),
			containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
			containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
			
			imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
			imageView.heightAnchor.constraint(equalToConstant: 200),
			imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
			imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
			
			plusIcon.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
			plusIcon.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -32),
			plusIcon.heightAnchor.constraint(equalToConstant: 50),
			plusIcon.widthAnchor.constraint(equalToConstant: 50),
			
			tapLabel.centerXAnchor.constraint(equalTo: plusIcon.centerXAnchor, constant: 0),
			tapLabel.topAnchor.constraint(equalTo: plusIcon.bottomAnchor, constant: 16),
			tapLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 8),
			tapLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8),
			
			
			valueLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 0),
			valueLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
			valueLabel.widthAnchor.constraint(equalToConstant: 100),
			
			acceptValueButton.centerYAnchor.constraint(equalTo: valueLabel.centerYAnchor, constant: 0),
			acceptValueButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0),
			acceptValueButton.heightAnchor.constraint(equalToConstant: 30),
			acceptValueButton.widthAnchor.constraint(equalToConstant: 60),
			
			valueTextField.centerYAnchor.constraint(equalTo: valueLabel.centerYAnchor, constant: 0),
			valueTextField.leadingAnchor.constraint(equalTo: valueLabel.trailingAnchor, constant: 8),
			valueTextField.trailingAnchor.constraint(equalTo: acceptValueButton.leadingAnchor, constant: -16),
			
			])
		
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		
		if let pickedImageEdited = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
			imageView.contentMode = .scaleAspectFit
			imageView.image = pickedImageEdited
		}
		plusIcon.isHidden = true
		tapLabel.isHidden = true
		
		dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
	
	@objc func handelImageSelection() {
		print("chose image")
		
		imagePicker.allowsEditing = true
		imagePicker.sourceType = .photoLibrary
		
		present(imagePicker, animated: true, completion: nil)
		
	}
	
	@objc func handelAccept() {
		guard let value = NumberFormatter().number(from: valueTextField.text ?? "0") else {return}
		
		print("accept \(value)$")
		valueTextField.resignFirstResponder()
		
		dismiss(animated: true) {
			self.delegate?.didCreateNewObject(value: CGFloat(value), image: self.imageView.image ?? UIImage(named: "no_image2")!)
		}
	}
	
	
	
}

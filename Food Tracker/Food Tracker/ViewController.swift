//
//  ViewController.swift
//  Food Tracker
//
//  Created by Seth Penna on 6/26/16.
//  Copyright © 2016 Seth Penna. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	// MARK: UITextFieldDelegate
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		// Hide the keyboard
		textField.resignFirstResponder()
		return true
	}
	
	func textFieldDidEndEditing(textField: UITextField) {
		nameLabel.text = nameTextField.text
	}
	
	
	
	// MARK: Properties
	
	@IBOutlet weak var photoImageView: UIImageView!
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var nameLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Handle the text field's user input through delegate callbacks
		nameTextField.delegate = self
	}
	
	
	// MARK: UIImageControllerDelegate
	
	func imagePickerControllerDidCancel(picker: UIImagePickerController) {
		// Dismiss the picker if the user cancelled
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
		// Use original image
		let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
		
		// Set photoView to display chosen image
		photoImageView.image = selectedImage
		
		// Dismiss the picker
		dismissViewControllerAnimated(true, completion: nil)
		
	}
	
	
	
	// MARK: Actions
	
	@IBAction func setDefaultLabelText(sender: UIButton) {
		nameLabel.text = "Default Text"
	}
	
	@IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
		//  Hide the keyboard in case it is shown
		nameTextField.resignFirstResponder()
		
		// Let the user pick a photo
		let imagePickerController = UIImagePickerController()
		
		// Only allow the user to pick a photo
		imagePickerController.sourceType = .PhotoLibrary
		
		// Make sure the viewcontroller is notified when the user picks a photo
		imagePickerController.delegate = self
		
		presentViewController(imagePickerController, animated: true, completion: nil)
		
	}
	
	
}


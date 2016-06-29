//
//  ViewController.swift
//  Calculator
//
//  Created by Seth Penna on 6/26/16.
//  Copyright © 2016 Seth Penna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: Properties
	
	var display: String = ""
	var initial: String = ""
	var second: String = ""
	var operatorType: Character = "p"
	var aData: String = ""
	var bData: String = ""
	var aState = false
	var bState = false
	
	@IBOutlet weak var displayText: UILabel!
	@IBOutlet weak var subDisplayView: UILabel!
	@IBOutlet weak var aLabel: UILabel!
	@IBOutlet weak var bLabel: UILabel!
	
	
	
	// MARK: Methods
	
	func updateDisplay(){
		//  print the current reading to the main display
		if(display == ""){displayText.text = "0.0";}
		else{
			displayText.text = display
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//  Setup values for first time run
		subDisplayView.text = ""
		aLabel.text = "A"
		bLabel.text = "B"
		updateDisplay()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	// MARK: Numbers
	
	//  For each number pressed add to the end of the string currently stored in the display variable
	
	@IBAction func number9(sender: UIButton) {
		display = display + "9"
		updateDisplay()
	}
	@IBAction func number8(sender: UIButton) {
		display = display + "8"
		updateDisplay()
	}
	@IBAction func number7(sender: UIButton) {
		display = display + "7"
		updateDisplay()
	}
	@IBAction func number6(sender: UIButton) {
		display = display + "6"
		updateDisplay()
	}
	@IBAction func number5(sender: UIButton) {
		display = display + "5"
		updateDisplay()
	}
	@IBAction func number4(sender: UIButton) {
		display = display + "4"
		updateDisplay()
	}
	@IBAction func number3(sender: UIButton) {
		display = display + "3"
		updateDisplay()
	}
	@IBAction func number2(sender: UIButton) {
		display = display + "2"
		updateDisplay()
	}
	@IBAction func number1(sender: UIButton) {
		display = display + "1"
		updateDisplay()
	}
	@IBAction func number0(sender: UIButton) {
		display = display + "0"
		updateDisplay()
	}
	@IBAction func decimal(sender: UIButton) {
		display = display + "."
		updateDisplay()
	}
	
	
	// MARK: Operators
	
	/* 
	
	For each operator pressed:
        - save the current reading as the initial value
        - update the display to keep the current number
        - reset the display variable for the next value
        - show the currently selected operator in the subview window
        - save the operator type so that it can be used to calculate later
	*/

	@IBAction func divide(sender: UIButton) {
		initial = display
		updateDisplay()
		display = ""
		subDisplayView.text = "/"
		operatorType = "d"
	}
	@IBAction func multiply(sender: UIButton) {
		initial = display
		updateDisplay()
		display = ""
		subDisplayView.text = "x"
		operatorType = "m"
	}
	@IBAction func subtract(sender: UIButton) {
		initial = display
		updateDisplay()
		display = ""
		subDisplayView.text = "-"
		operatorType = "s"
	}
	@IBAction func add(sender: UIButton) {
		initial = display
		updateDisplay()
		display = ""
		subDisplayView.text = "+"
		operatorType = "a"
	}
	
	// The sign change button does exactly that, changes the sign of the number.  This can be improved to switch back and forth for positive and negative numbers, but that is not currently implemented
	
	@IBAction func sign(sender: UIButton) {
		if(display == "" || display.hasPrefix("-")){}
		else{
			display = "-" + display
			updateDisplay()
		}
	}
	
	// When the equals is pressed, clear the subview window, save the second value, and then calculate the resulting final value from the two given and the operator stored from earlier.  Finally update the display to show the result
	
	@IBAction func equals(sender: UIButton) {
		subDisplayView.text = ""
		second = display
		switch operatorType {
		case "d":
			display = String(Double(initial)! / Double(second)!)
		case "m":
			display = String(Double(initial)! * Double(second)!)
		case "s":
			display = String(Double(initial)! - Double(second)!)
		case "a":
			display = String(Double(initial)! + Double(second)!)
		default:
			displayText.text = "Error"
		}
		
		updateDisplay()
	}
	
	
	// Format the clear button so that it resets the main display and the display variable to start from scratch when tapped.  If there is a long press on the clear button, reset all variables stored.
	
	@IBAction func clear(sender: UIButton) {
		subDisplayView.text = ""
		display = ""
		updateDisplay()
	}
	@IBAction func longPress(sender: UILongPressGestureRecognizer) {
		subDisplayView.text = ""
		aData = ""
		bData = ""
		aLabel.text = "A"
		bLabel.text = "B"
		aState = false
		bState = false
		display = ""
		updateDisplay()
	}
	
	// The A and B buttons allow the user to store two values in these variables.  At first the variables wait to be set by pressing the button corresponding to the variable name when a value is displayed.  Once that has happened they save that value and produce it any time they are tapped.  If the variable button is long pressed it will reset that variable.

	@IBAction func aButton(sender: UIButton) {
		// if the value hasn't been stored yet
		if(aState == false){
			aData = display
			display = ""
			updateDisplay()
			aLabel.text = "A: " + aData
			aState = true
		}
		
		// if the value has been set already
		else{
			display = aData
			updateDisplay()
		}
	}
	@IBAction func aLongPress(sender: UILongPressGestureRecognizer) {
		aData = ""
		aLabel.text = "A"
		aState = false
	}
	
	@IBAction func bButton(sender: UIButton) {
		// if the value hasn't been stored yet
		if(bState == false){
			bData = display
			display = ""
			updateDisplay()
			bLabel.text = "B: " + bData
			bState = true
		}
		
		// if the value has been set already
		else{
			display = bData
			updateDisplay()
		}
	}
	@IBAction func bLongPress(sender: UILongPressGestureRecognizer) {
		bData = ""
		bLabel.text = "B"
		bState = false
	}
	
}


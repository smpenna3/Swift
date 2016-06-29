//
//  ViewController.swift
//  Tap Me
//
//  Created by Brian on 9/9/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// attach a variable to the labels
	@IBOutlet var scoreLabel: UILabel!
	@IBOutlet var timerLabel: UILabel!
	var count = 0
	var seconds = 0
	var timer = NSTimer()
	
	// function that declares what happens on button press
	@IBAction func buttonPressed()  {
		// increase and display the score
		count += 1
		scoreLabel.text = "Score \n\(count)"
	}
	
	func setupGame()  {
		// sets up the timer with 30 seconds and 0 score
		seconds = 30
		count = 0
		
		// displays the timer and score
		timerLabel.text = "Time: \(seconds)"
		scoreLabel.text = "Score: \(count)"
		timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		setupGame()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	func subtractTime() {
		seconds-=1
		timerLabel.text = "Time: \(seconds)"
		
		if(seconds == 0)  {
			timer.invalidate()
			let alert = UIAlertController(title: "Time is up!",
			                              message: "You scored \(count) points",
			                              preferredStyle: UIAlertControllerStyle.Alert)
			alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {
				action in self.setupGame()
			}))
			presentViewController(alert, animated: true, completion:nil)
		}
	}
	
	
}


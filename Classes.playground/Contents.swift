import UIKit

// Classes create a template for a collection of properties and methods

class Person {
	// properties define variables for the class
	var firstName = ""
	var lastName = ""
	var age = 0
	
	// methods let us do things to the class
	func input() -> String {
       let keyboard = NSFileHandle.fileHandleWithStandardInput()
	   let inputData = keyboard.availableData
       let rawString = NSString(data: inputData, encoding:NSUTF8StringEncoding)
	   if let string = rawString {
			return string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
		} else {
			return "Invalid input"
		}
   	}
	
	func changeFirstName(newFirstName:String){
		firstName = newFirstName
	}
	
	func enterInfo(){
		print("What is the first name? ");
		firstName = input();
	}
	
	func printInfo(){
		print("First name: \(firstName)");
		
	}
	
}

// create a new object from the class Person

var newPerson = Person()

// give the object properties

newPerson.firstName = "John"
newPerson.lastName = "Doe"
newPerson.age = 56

// use a method to change the name of the person

newPerson.changeFirstName("Paul")

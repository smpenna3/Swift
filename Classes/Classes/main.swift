import Foundation

var response: String

// Create an array to store objects of class people
var people: [Person] = []

repeat{
	var newPerson = Person()
	newPerson.enterInfo()
	people.append(newPerson)
	newPerson.printInfo()
	
	print("Do you want to enter another? (y/n)")
	response = input()
} while(response == "y")

print("Number of people in database: \(people.count)")

for onePerson in people {
	onePerson.printInfo()
}
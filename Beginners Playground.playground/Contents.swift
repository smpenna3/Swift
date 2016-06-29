//: Playground - noun: a place where people can play

import UIKit

// variables
var str: String = "Hello World"
var int: Int = 120


// constants
let a: Int = 322
let b: String = "hi there"


// conditional statements
if(a > int){
    let c: String = "a is larger"
}
else{
    let c: String = "int is larger"
}


// printing
print("hello")


// semicolons are not required but can be used
var d = 100; var g = 150;
print(d);
print(g)


// while and breaks are the same
while(true){
    if(int > 500){
        break
    }
    int += 1
}


// variable conversions
var number = 100
var letter = String(number)


// concatenate strings
var apples = 5
print("Sally has \(apples) apples")


// optionals
var optionalNumber: Int? = 5
optionalNumber = nil
if let number = optionalNumber  {
    print("It is a number")
}
else  {
    print("It is not a number")
}


// repeat while, like do while
var i = 0
repeat{
	print(i)
	i += 1
} while(i < 10)

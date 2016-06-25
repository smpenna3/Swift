//: Playground - noun: a place where people can play

import UIKit

func randomIntBetween(low:Int, high:Int) -> Int {
    let range = high - (low - 1)
    return (Int(arc4random()) % range) + (low - 1)
}

let answer = randomIntBetween(1, 100);

print("Pick a number between 1 and 100");

int guess = 7;

if(guess > answer){print("Lower!");}
else if(guess < answer){print("Higher!");}
else if(guess == answer){print("Correct! The answer was \(Answer)");}


import Foundation

let answer = randomIntBetween(0, 100)
var turn = 1

while(true)  {
    
    print("Guess #\(turn): Enter a number between 1 and 100.  ")
    
    let userInput = input()
    
    let inputAsInt = userInput.toInt()
    if let guess = inputAsInt  {
        
        if(guess > answer) {
            print("Lower!")
        } else if(guess < answer) {
            print("Higher!")
        } else {
            print("Correct! The answer was \(answer).")
            break
        }
        
    } else  {
        print("Invalid input! Please enter a number.")
        continue
    }
    
    turn = turn + 1
    
}

print("It took you \(turn) tries.")
import Cocoa

var greeting = "Hello, playground"


// Closure // Very Useful in SwiftUI

func greetUser() {
    print("Hi there!")
}

greetUser() // () -> () // () -> Void

var greetCopy: () -> Void = greetUser
greetCopy()

let sayHello = { // closure expression // closure
    print("Hi there from sayHello!")
}

sayHello()

let sayGoodBye = { (inputStr: String) -> () in // in marks the end of the return
    print("\(inputStr) this is greeting")
}

sayGoodBye("John")

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anomymous"
    }
}

var getUser1Data = getUserData
print(getUser1Data(1989))

let sayNewHello = { (name: String) -> String in
    return "Hi \(name)!"
}

print(sayNewHello("Jerry"))


let team = ["Gloria", "Suzzy", "Roxane", "Tiffany", "Tasha", "Sarah"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzzy" { return true }
    else if name2 == "Suzzy" { return false }
    
    return name1 < name2
}

//let customSortedTeam = team.sorted(by: captainFirstSorted)
//print(customSortedTeam)

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzzy" { return true }
    else if name2 == "Suzzy" { return false }
    
    return name1 < name2

})

print(captainFirstTeam)


// most common reasons for closures in Swift is to store functionality // to be able to say “here’s some work I want you to do at some point, but not necessarily now
//Some examples:
//
//    Running some code after a delay.
//    Running some code after an animation has finished.
//    Running some code when a download has finished.
//    Running some code when a user has selected an option from your menu.

// Closures let us wrap up some functionality in a single variable, then store that somewhere. We can also return it from a function, and store the closure somewhere else


func pay(user: String, amount: Int) {
    // code
}


let payment = { (user: String, amount: Int) in
    // code
}

// Closures take their parameters inside the brace to avoid confusing Swift: if we had written let payment = (user: String, amount: Int)
// then it would look like we were trying to create a tuple, not a closure, which would be strange
// Without in keyword not possible for swift to understand closure body starts

let learnSwift = {
    print("Closures are like functions")
}

learnSwift()


var takeMedicine = {
    print("I feel a little better")
}

takeMedicine()



var cleanRoom = { (name: String) in
    print("I'm cleaning the \(name).")
}
cleanRoom("kitchen")


var sendMessage = { (message: String) in
    if message != "" {
        print("Sending to Twitter: \(message)")
    } else {
        print("Your message was empty.")
    }
}

sendMessage("JFK has died")


var click = { (button: Int) in
    if button >= 0 {
        print("Button \(button) was clicked.")
    } else {
        print("That button doesn't exist.")
    }
}

click(5)


let fixCar = { (problem: String) in
    print("I fixed the \(problem).")
}

fixCar("Engine Problem")


let makeReservation = { (people: Int) in
    print("I'd like a table for \(people), please.")
}

makeReservation(5)

//var cutGrass = { (length currentLength: Int) in // Closure cannot use external parameters // Only Internal Parameters are allowed
//    switch currentLength {
//    case 0...1:
//        print("That's too short")
//    case 1...3:
//        print("It's already the right length")
//    default:
//        print("That's perfect.")
//    }
//}


let rowBoat = { (distance: Int) in
    for _ in 1...distance {
        print("I'm rowing 1km.")
    }
}

rowBoat(10)


var flyDrone = { (hasPermit: Bool) -> Bool in
    if hasPermit {
        print("Let's find somewhere safe!")
        return true
    }
    print("That's against the law.")
    return false
}

flyDrone(true)
flyDrone(false)



let measureSize = { (inches: Int) -> String in
    switch inches {
    case 0...26:
        return "XS"
    case 27...30:
        return "S"
    case 31...34:
        return "M"
    case 35...38:
        return "L"
    default:
        return "XL"
    }
}

print(measureSize(36))


var difficultyRating = { (trick: String) -> Int in
    if trick == "ollie" {
        return 1
    } else if trick == "Yoyo Plant" {
        return 3
    } else if trick == "900" {
        return 5
    } else {
        return 0
    }
}
print(difficultyRating("ollie"))


var costToShootMovie = { (location: String) -> Int in
    if location == "UK" {
        return 1_000_000
    } else if location == "US" {
        return 5_000_000
    } else {
        return 500_000
    }
}

print(costToShootMovie("US"))

// Reduce the amount of syntax for closures

let team2 = ["Abhram", "Johnny", "Ash", "Tiffany", "Monica", "Sarah"]

let captainFirstSorted = team2.sorted { a, b in // Trailing Closure Syntax
    if a == "Tiffany" { return true }
    if a == "Tiffany" { return false }
    return a < b
}

let captainFirstSortedUsingFunctionalProgramming = team2.sorted { // Trailing Closure Syntax using functional programming // Only use it when only parameters are used once
    if $0 == "Tiffany" { return true }
    if $1 == "Tiffany" { return false }
    return $0 < $1
}


print(captainFirstSorted)

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

// More examples for Xcode
let tOnly = team2.filter { a in // Good Easy to Read
    return a.hasPrefix("T")
}

// filter function - allows to filter out the array to find some items that meet out creteria
let aOnlyUsingFunctionalProgramming = team2.filter { $0.hasPrefix("A") } // Functional Programming

print(tOnly)
print(aOnlyUsingFunctionalProgramming)

// Map Function // Transform all the members of the array using this function and returns a modified Array
let mappedArray = team2.map { $0.uppercased() }
print(mappedArray)

//

func makeArray(size: Int, using generator: () -> Int) -> [Int] { // Functions as parameters
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let array1 = makeArray(size: 5) {
    return 5
}

print(array1)

let rolls = makeArray(size: 10) {
    return Int.random(in: 1...20)
}

print(rolls)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("First Work")
    first()
    
    print("Second Work")
    second()

    print("Third Work")
    third()
    
    print("Done")
}

let chainCalls: () = doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

print(chainCalls)

// Why Closures are needed
// Another common example is making network requests. Your average iPhone can do several billion things a second, but connecting to a server in Japan takes half a second or more – it’s almost glacial compared to the speed things happen on your device. So, when we request data from the internet we do so with closures: “please fetch this data, and when you’re done run this closure.” Again, it means we don’t force our user interface to freeze while some slow work is happening.


var swift = {
    print("Cool - I can use closures!")
}

func writeCode(using language: () -> Void) {
    language()
    print("That'll be eleventy billion dollars, please.")
}

// More Examples of Closures

let swanDive = {
    print("SWAN DIVE!")
}
func performDive(type dive: () -> Void) {
    print("I'm climbing up to the top")
    dive()
}
performDive(type: swanDive)


let helicopterTravel = {
    print("Get to the chopper!")
}
func travel(by travelMeans: () -> Void) {
    print("Let's go on vacation...")
    travelMeans()
}
travel(by: helicopterTravel)



var goOnBike = {
    print("I'll take my bicycle.")
}
func race(using vehicleType: () -> Void) {
    print("Let's race!")
    vehicleType()
}




var payCash = {
    print("Here's the money.")
}
func buyClothes(item: String, using payment: () -> Void) {
    print("I'll take this \(item).")
    payment()
}
buyClothes(item: "jacket", using: payCash)


let resignation = { (name: String) in
    print("Dear \(name), I'm outta here!")
}
func printDocument(contents: (String) -> Void) {
    print("Connecting to printer...")
    print("Sending document...")
    contents("Hello")
}
printDocument(contents: resignation)


let driveSafely = { () -> String in
    return "I'm being a considerate driver"
}
func drive(using driving: () -> String) {
    print("Let's get in the car")
    driving()
    print("We're there!")
}
drive(using: driveSafely)


var learnWithUnwrap = {
    print("Hey, this is fun!")
}
func learnSwift(using approach: () -> Void) {
    print("I'm learning Swift")
    approach()
}
learnSwift(using: learnWithUnwrap)

var playWithDog = {
    print("Fetch!")
}
func play(using playType: () -> Void) -> String {
    print("Let's play a game")
    playType()
    
    return "Cool"
}
play(using: playWithDog)





let evilRobot = {
    print("EXTERMINATE")
}
func buildRobot(using personality: () -> Void) {
    print("Time to turn on the robot!")
    personality()
}
buildRobot(using: evilRobot)




func holdClass(name: String, lesson: () -> Void) {
    print("Welcome to \(name)!")
    lesson()
    print("Make sure your homework is done by next week.")
}

holdClass(name: "Philosophy 101") {
    print("All we are is dust in the wind, dude.")
}





func phoneFriend(conversation: () -> Void) {
    print("Calling 555-1234...")
    conversation()
}

phoneFriend {
    print("Hello!")
    print("A foreign prince wants to give you $5 million.")
    print("What are your bank details?")
}




func doTricks(_ tricks: () -> Void) {
    print("Start recording now!")
    tricks()
    print("Did you get all that?")
}

doTricks {
    print("2")
}






func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}

tendGarden {
    print("Let's grow some roses!")
}




func makeCake(instructions: () -> Void) {
    print("Wash hands")
    print("Collect ingredients")
    instructions()
    print("Here's your cake!")
}
makeCake {
    print("Mix egg and flour")
}



func brewTea(steps: () -> Void) {
    print("Get tea")
    print("Get milk")
    print("Get sugar")
    steps()
}
brewTea {
    print("Brew tea in teapot.")
    print("Add milk to cup")
    print("Pour tea into cup")
    print("Add sugar to taste.")
}



func assembleToy(instruction: () -> Void) {
    instruction()
    print("It's done!")
}
assembleToy {
    print("Grok the glib")
    print("Flop the flip")
    print("Click the clack")
}



func knitSweater(then: () -> Void) {
    print("Buy wool")
    for _ in 1...100 {
        print("Knit knit knit...")
    }
    then()
}
knitSweater {
    print("Who wants to buy a sweater?")
}



func repeatAction(count: Int, action: () -> Void) {
    for _ in 0..<count {
        action()
    }
}
repeatAction(count: 5) {
    print("Hello, world!")
}




func clean(tasks: () -> Void) {
    print("It's time to clean the house.")
    tasks()
}

clean {
    print("I'm going to clean the kitchen.")
    print("I'm going to tidy the study.")
    print("I'm going to nuke the kids' room.")
}




func goCamping(then action: () -> Void) {
    print("We're going camping!")
    action()
}
goCamping {
    print("Sing songs")
    print("Put up tent")
    print("Attempt to sleep")
}




func goOnVacation(to destination: String, _ activities: () -> Void) {
    print("Packing bags...")
    print("Getting on plane to \(destination)...")
    activities()
    print("Time to go home!")
}
goOnVacation(to: "Mexico") {
    print("Go sightseeing")
    print("Relax in sun")
    print("Go hiking")
}

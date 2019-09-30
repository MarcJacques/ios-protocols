import Foundation

//Protocols are as per Apples Definition in the _Swift PRogramming Language book:
//
//" a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol."
//
//The Below example shows a protocol that requires conforming types have a particular property defined.
protocol FullyNamed {
    //protocols are giving you the requirements or properties for what the type needs to use or have
    var fullName: String { get }
    //get actually has to be able to get this name not necessarily has to have it in their.
}

struct Person: FullyNamed { //adding the colon and the type we just created in the protocol means that the "person" struct has adopted the FullyNamed
    var fullName: String
}

let marc = Person(fullName: "Marc Jacques")
let roger = Person(fullName: "Roger Jacques")

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
//        var validPrefix: String
//        if prefix != nil {
//            validPrefix = prefix!
//        } else  {
//            validPrefix = " "
//        }
//
//        return validPrefix + " " + name
//        return (prefix ?? "") + " " + name
        return (prefix != nil ? prefix! + " ": "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName


var fireFly = Starship(name: "Firefly")
fireFly.fullName



//Protocols can also require that conforming types implement certain methods.
protocol GeneratesRandomNumbers {
    func random() -> Int
}

class OneThroughTen: GeneratesRandomNumbers {
    func random() -> Int {
        return Int.random(in: 1...10)
    }
}

let rand = OneThroughTen()
rand.random()


extension Starship: Equatable {
    static func == (lhs: Starship, rhs: Starship) -> Bool {
//        if lhs.fullName == rhs.fullName {
//            return true
//        } else {
//            return false
//        }
        return lhs.fullName == rhs.fullName
    }
}

if ncc1701 == fireFly {
    print("Same starship!")
} else {
    print("Not the same starship!")
}
//if a==b...
//
//Starship.==(lhs: a, rhs: b)



//Protocols as Types

class Dice {
    let sides: Int
    let generator: GeneratesRandomNumbers
    
    init(sides: Int, generator: GeneratesRandomNumbers) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int { // 10 ÷ 6, gives us 1 remainder 4
        return (generator.random() % sides) + 1 // [0, 5] -> [1, 6]
    }
}

var d6 = Dice(sides: 6, generator: OneThroughTen())
for _ in 1...5 {
    print("Random dice roll for one through ten is \(d6.roll())")
}
//: [Next](@next)

class EvenThroughTwenty: GeneratesRandomNumbers {
    func random() -> Int {
        return Int.random(in: 1...10)*2 - 1
    }
}
    
var d6AlwaysEven = Dice(sides: 6, generator: EvenThroughTwenty())
    for _ in 1...5 {
        print("Random dice roll is \(d6AlwaysEven.roll())")
    }


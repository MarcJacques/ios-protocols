//: [Previous](@previous)

/*:
 Below there is a protocol called `Cook`. Create two structs or classes that conform to the `Cook` protocol. In the implementation of the `cookSteak` function for each struct, print out how that object would cook a steak. For example, the robot might use laser vision to cook it.
 
 */

protocol Cook {
    func cookSteak()
}

struct Human {
    let name: String
    let age: String
}

struct Robot {
    let modelName: Int
}

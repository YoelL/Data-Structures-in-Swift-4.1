//: [Previous](@previous)
import Foundation

struct Stack<Element> {
	
	fileprivate var array:[Element] = []
	
	var isEmpty: Bool {
		return array.isEmpty
	}
	
	var count: Int {
		return array.count
	}
	
	mutating func push(_ element:Element){
		self.array.append(element)
	}
	
	
	mutating func pop()->Element?{
		return self.array.popLast()
	}
	
	mutating func peek()->Element?{
		return self.array.last
	}
	
}


extension Stack : CustomStringConvertible {
	
	var description: String {
		
		let topDivider = "#-_-_-_-_-_-_-Stack-_-_-_-_-_-_-#\n"
		let bottomDivider = "\n#-_-_-_-_-_-_-------_-_-_-_-_-_-#\n"
		
		let stackElements = array.map { "\($0)" }.reversed().joined(separator: "\n")

		return topDivider + stackElements + bottomDivider
		
	}
}





var comics = Stack<String>()

comics.push("Back to the future episode 1")
comics.push("Back to the future episode 2")
comics.push("Back to the future episode 3")
comics.push("Star Wars A New Hope")
comics.push("Star Wars The Last Jedi")

comics.peek()
comics.pop()
comics.peek()

comics.count
comics.isEmpty

print(comics)



var numbers = Stack<Int>()

numbers.push(0)
numbers.push(1)
numbers.push(2)
numbers.push(3)

numbers.peek()
numbers.pop()
print(numbers)



//: [Next](@next)

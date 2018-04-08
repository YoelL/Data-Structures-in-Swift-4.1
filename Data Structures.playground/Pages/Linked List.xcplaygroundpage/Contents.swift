//: [Previous](@previous)

import Foundation

public class Node {
	
	var value:String
	var next:Node?
	weak var previous:Node?
	
	init(value:String) {
		self.value = value
	}
	
	
	
}



//: [Next](@next)

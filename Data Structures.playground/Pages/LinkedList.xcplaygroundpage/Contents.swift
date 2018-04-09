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


public class LinkedList {
	
	fileprivate var head: Node?
	private var tail: Node?
	
	public var isEmpty: Bool {
		return head == nil
	}
	
	public var first: Node? {
		return head
	}
	
	public var last: Node? {
		return tail
	}
	
	
	public func append(value: String) {
		
		let newNode = Node(value: value)
	
		if let tailNode = tail {
			newNode.previous = tailNode
			tailNode.next = newNode
		}else{
			head = newNode
		}
		
		tail = newNode
	}
	
	public func nodeAt(index:Int)->Node? {
		
		if index >= 0 {
			var i = index
			var node = head
			
			while node != nil {
				
				if i == 0 { return node }
				
					i -= 1
					node = node!.next
			}
		}
		return nil
	}
	
	public func removeAll() {
		head = nil
		tail = nil
	}



}

extension LinkedList: CustomStringConvertible {
	
	public var description: String {
		var text = "["
		var node = head
		while node != nil {
			text += "\(node!.value)"
			node = node!.next
			if node != nil { text += " -> " }
		}
		return text + "]"
	}
}




let ll = LinkedList()

	ll.append(value: "First Item")
	ll.append(value: "Second Item")
	ll.append(value: "Third Item")
	ll.append(value: "Fourth Item")


print(ll)

let node = ll.nodeAt(index: 3)
print("\(node?.value ?? "Unknow")")





//: [Next](@next)

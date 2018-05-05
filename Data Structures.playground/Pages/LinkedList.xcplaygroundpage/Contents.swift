//: [Previous](@previous)

import Foundation

public class Node<Value> {
	
	var value:Value
	var next:Node?
	weak var previous:Node?
	
//	init(value:Value) {
//		self.value = value
//	}
	
	public init(value: Value, next: Node? = nil) {
		self.value = value
		self.next = next
	}
	
}


public class LinkedList<Value> {
	
	fileprivate var head: Node<Value>?
	private var tail: Node<Value>?
	
	public init() {}
	
	public var isEmpty: Bool {
		return head == nil
	}
	
	public var first: Node<Value>? {
		return head
	}
	
	public var last: Node<Value>? {
		return tail
	}
	
	//push: Adds a value at the front of the list.
	public  func push(_ value:Value){
		
		head = Node(value: value, next: head)
		
		if tail == nil {
			tail = head
		}
	}
	
	
	//append: Adds a value at the end of the list.
	public  func append(_ value: Value) {

		guard !isEmpty else { push(value) ; return }
		
		tail!.next = Node(value: value)
		
		tail = tail!.next
	}
	
	
	//insert(after:): Adds a value after a particular node of the list.
	
	
	public func nodeAt(index:Int)->Node<Value>? {

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
	
	public  func removeAll() {
		head = nil
		tail = nil
	}
	
	
	// 1
	@discardableResult
	public func insert(_ value:Value ,after node: Node<Value>) -> Node<Value> {
		// 2
		guard tail !== node else {
			append(value)
			return tail!
		}
		// 3
		node.next = Node(value: value, next: node.next)
		return node.next!
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



var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)

print(list)


var listA = LinkedList<Int>()
listA.append(1)
listA.append(2)
listA.append(3)

print(listA)

var listP = LinkedList<Int>()
listP.push(3)
listP.push(2)
listP.push(1)

print("Before inserting: \(listP)")

var middleNode = listP.nodeAt(index: 1)
for _ in 1...5 {
	middleNode = listP.insert( 30, after: middleNode!)
}
print("After inserting 30 five times: \(listP)")



//: [Next](@next)

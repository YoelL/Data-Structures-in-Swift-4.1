//: [Previous](@previous)

import Foundation

class Node<T> {
	
	var key: T!
	var next: Node!
}

public class Queue<T> {
	
    private var top: Node<T>!

    init() {
        top = Node<T>()
    }


    //the number of items
    var count: Int {

        guard top.key != nil else {
            return 0
        }


        var current: Node<T> = top
        var x: Int = 1


        //cycle through items
        while current.next != nil {
            current = current.next
            x += 1
        }

        return x

    }


    //MARK: Supporting Functions

    //retrieve the top most item
    func peek() -> T! {
        return top.key
    }



    //check for the presence of a value
    func isEmpty() -> Bool {

        guard top.key != nil else {
            return true
        }

        return false

    }



    //MARK: Queuing Functions


    //enqueue the specified object
    func enQueue(_ key: T) {


        //trivial case
        guard top.key != nil else {
            top.key = key
            return
        }

        let childToUse = Node<T>()
        var current = top


        //cycle through the list
        while current?.next != nil {
            current = current?.next
        }


        //append new item
        childToUse.key = key
        current?.next = childToUse

    }



    //retrieve items from the top level - O(1) time
    func deQueue() -> T? {


        //determine key instance
        guard top.key != nil else {
            return nil
        }


        //retrieve and queue the next item
        let queueItem: T? = top.key


        //use optional binding
        if let nextItem = top.next {
            top = nextItem
        }
        else {
            top = Node<T>()
        }


        return queueItem

    }

}


extension Queue:CustomStringConvertible{
	
	
	public var description: String {

			let divider = "--"
			var queue =  divider
			
		while top.next != nil {
			
			queue += "\n\(top.key)"

		}

			return queue + "\n" + divider
	}
	
}


//MARK: Queue Example

let queue = Queue<Int>()

	queue.isEmpty()
	queue.enQueue(1)
   	queue.enQueue(2)
 	queue.enQueue(3)
	queue.enQueue(4)

	queue.peek()
	queue.deQueue()

	queue.peek()
	queue.isEmpty()

	//print(queue)
//: [Next](@next)

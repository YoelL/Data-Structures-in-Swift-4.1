//: [Previous](@previous)

import Foundation


func naiveHash(_ string: String) -> Int {
	let unicodeScalars = string.unicodeScalars.map { Int($0.value) }
	return unicodeScalars.reduce(0, +)
}

naiveHash("abc")  // == bca

// sourced from https://gist.github.com/kharrison/2355182ac03b481921073c5cf6d77a73#file-country-swift-L31
func djb2Hash(_ string: String) -> Int {
	let unicodeScalars = string.unicodeScalars.map { $0.value }
	return unicodeScalars.reduce(5381) {
		($0 << 5) &+ $0 &+ Int($1)
	}
}

djb2Hash("abc") // outputs 193485963
djb2Hash("bca") // outputs 193487083
//: [Next](@next)

//: [Previous](@previous)

import Foundation

enum VendingMachineError: Error {
	case invalidSelection
	case insufficientFunds(coinsNeeded: Int)
	case outOfStock
}

struct Item {
	var price: Int
	var count: Int
}

class VendingMachine {
	private(set) var inventory = [
		"Candy Bar": Item(price: 12, count: 7),
		"Chips": Item(price: 10, count: 4),
		"Pretzels": Item(price: 7, count: 11)
	]
	private(set)var coinsDeposited = 0

	func depoit(coins: Int) {
		coinsDeposited += coins
	}

	func vend(itemNamed name: String) throws {
		guard let item = inventory[name] else {
			throw VendingMachineError.invalidSelection
		}

		guard item.count > 0 else {
			throw VendingMachineError.outOfStock
		}

		guard item.price <= coinsDeposited else {
			throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
		}

		coinsDeposited -= item.price

		var newItem = item
		newItem.count -= 1
		inventory[name] = newItem

		print("Dispensing \(name)")
	}
}

let vendingMachine = VendingMachine()
vendingMachine.depoit(coins: 50)

do {
	try vendingMachine.vend(itemNamed: "Chips")
} catch {
	print(error)
}


//: [Next](@next)

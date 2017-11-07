//
//  Counter.swift
//  ButtonCounter
//
//  Created by Kajetan Dąbrowski on 05/11/2017.
//  Copyright © 2017 DaftMobile. All rights reserved.
//

import Foundation

struct Counter {
	private static let min = -100
	private static let max = 100

	private(set) var value: Int

	mutating func increment() {
		value += 1
	}

	mutating func decrement() {
		value -= 1
	}

	mutating func randomize() {
		value = Int.random(min: Counter.min, max: Counter.max)
	}
}

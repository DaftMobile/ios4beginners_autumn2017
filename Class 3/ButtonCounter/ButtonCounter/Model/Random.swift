//
//  Random.swift
//  ButtonCounter
//
//  Created by Kajetan Dąbrowski on 07/11/2017.
//  Copyright © 2017 DaftMobile. All rights reserved.
//

import Foundation

extension Int {
	static func random(min: Int, max: Int) -> Int {
		assert(max >= min, "Max should be greater or equal than min")
		guard max > min else { return min }
		let result = arc4random_uniform(UInt32(max - min + 1))
		return Int(result) + min
	}
}

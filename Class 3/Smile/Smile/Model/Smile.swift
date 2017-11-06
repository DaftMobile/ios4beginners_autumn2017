//
//  Smile.swift
//  Smile
//
//  Created by Kajetan Dąbrowski on 05/11/2017.
//  Copyright © 2017 DaftMobile. All rights reserved.
//

import Foundation

class Smile {
	var level: Float {
		didSet {
			level = min(1.0, max(-1.0, level))
		}
	}

	init(level: Float) {
		self.level = level
	}

	convenience init() {
		self.init(level: 0.0)
	}
}

extension Smile {
	var description: String {
		switch level {
		case -1.0 ..< -0.4:
			return "Sad 😫"
		case -0.4 ... 0.4:
			return "Meh... 😐"
		case 0.4 ... 1.0:
			return "Smile! 😁"
		default:
			fatalError("Unexpected smile level \(level)!")
		}
	}
}

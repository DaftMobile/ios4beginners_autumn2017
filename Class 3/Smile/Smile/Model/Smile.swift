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
}

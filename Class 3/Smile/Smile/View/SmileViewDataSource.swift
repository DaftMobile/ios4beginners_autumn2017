//
//  SmileViewDataSource.swift
//  Smile
//
//  Created by Kajetan Dąbrowski on 05/11/2017.
//  Copyright © 2017 DaftMobile. All rights reserved.
//

import Foundation

protocol SmileDataSource: class {
	func smileLevel(for smileView: SmileView) -> Float
}

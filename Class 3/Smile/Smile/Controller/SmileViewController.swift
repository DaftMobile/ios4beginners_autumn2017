//
//  SmileViewController.swift
//  Smile
//
//  Created by Kajetan Dąbrowski on 05/11/2017.
//  Copyright © 2017 DaftMobile. All rights reserved.
//

import UIKit

class SmileViewController: UIViewController {

	// MARK: - Model
	let smile = Smile(level: 0)

	// MARK: - Views
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var smileView: SmileView!

	override func viewDidLoad() {
		super.viewDidLoad()
		smileView.dataSource = self
	}
	
	@IBAction func sliderChanged(_ sender: UISlider) {
		smile.level = sender.value * 2.0 - 1.0
		smileView.setNeedsDisplay()
	}
}

extension SmileViewController: SmileDataSource {
	func smileLevel(for smileView: SmileView) -> Float {
		return smile.level
	}
}

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
	let smile = Smile()

	// MARK: - Views
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var smileView: SmileView!
	@IBOutlet weak var smileLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		smileView.dataSource = self
		updateSmileLabel()
	}

	private func updateSmileLabel() {
		smileLabel.text = smile.description
	}
	
	@IBAction func sliderChanged(_ sender: UISlider) {
		smile.level = sender.value * 2.0 - 1.0
		smileView.setNeedsDisplay()
		updateSmileLabel()
	}
}

extension SmileViewController: SmileDataSource {
	func smileLevel(for smileView: SmileView) -> Float {
		return smile.level
	}
}

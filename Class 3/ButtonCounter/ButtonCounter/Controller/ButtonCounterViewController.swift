//
//  ButtonCounterViewController.swift
//  ButtonCounter
//
//  Created by Kajetan Dąbrowski on 05/11/2017.
//  Copyright © 2017 DaftMobile. All rights reserved.
//

import UIKit

class ButtonCounterViewController: UIViewController {

	// MARK: - Views
	@IBOutlet weak var counterLabel: UILabel!

	// MARK: - Model
	var counter = Counter(value: 0)

	override func viewDidLoad() {
		super.viewDidLoad()
		counterLabel.font = UIFont.monospacedDigitSystemFont(ofSize: counterLabel.font.pointSize, weight: .bold)
		setupGestureRecognizer()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateLabel(with: counter.value)
	}

	@objc func randomizeCounter() {
		counter.randomize()
		updateLabel(with: counter.value)
	}

	@IBAction func plusButtonPressed(_ sender: UIButton) {
		counter.increment()
		updateLabel(with: counter.value)
	}

	@IBAction func minusButtonPressed(_ sender: UIButton) {
		counter.decrement()
		updateLabel(with: counter.value)
	}

	private func setupGestureRecognizer() {
		let tap = UITapGestureRecognizer(target: self, action: #selector(randomizeCounter))
		tap.numberOfTapsRequired = 3
		counterLabel.addGestureRecognizer(tap)
	}

	private func updateLabel(with value: Int) {
		counterLabel.text = "\(value)"
	}
}

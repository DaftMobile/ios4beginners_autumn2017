//: [Previous](@previous)

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {

	var colorView: UIView!

	override func loadView() {
		self.view = UIView()
		view.backgroundColor = .white

		colorView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
		colorView.backgroundColor = .purple
		view.addSubview(colorView)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		colorView.transform = CGAffineTransform(rotationAngle: .pi * 0.25)
		print(colorView.bounds)
		print(colorView.center)
		print(colorView.frame)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		UIView.animate(withDuration: 0.5) {
			self.colorView.center = CGPoint(x: 200, y: 200)
			self.colorView.transform = .identity
		}
	}

}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

//: [Next](@next)

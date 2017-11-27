//: [Previous](@previous)

import UIKit
import PlaygroundSupport

class ParentViewController: UIViewController {

	override func loadView() {
		view = UIView()
		view.backgroundColor = .white
		let pushButton = UIButton(type: .system)
		pushButton.addTarget(self, action: #selector(push), for: .touchUpInside)
		pushButton.setTitle("Push!", for: [])
		view.addSubview(pushButton)

		view.addConstraint(NSLayoutConstraint.init(item: pushButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))

		view.addConstraint(NSLayoutConstraint.init(item: pushButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
		pushButton.translatesAutoresizingMaskIntoConstraints = false
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Parent"
	}

	@objc func push() {
		print("TODO")
	}
}

class ChildViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Child"
	}

	override func loadView() {
		view = UIView()
		view.backgroundColor = .yellow
	}
}

let navigationController = UINavigationController(rootViewController: ParentViewController())

PlaygroundPage.current.liveView = navigationController
//: [Next](@next)

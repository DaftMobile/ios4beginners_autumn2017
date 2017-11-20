//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport


//: # Closure captures

//: Closure capture values
func makeIncrementer(amount: Int) -> (() -> Int) {
	var runningTotal = 0
	let function = { () -> Int in
		//: RunningTotal <-
		runningTotal += amount
		return runningTotal
	}
	return function
}

let incrementByTen = makeIncrementer(amount: 10)
let incrementBySeven = makeIncrementer(amount: 7)
print(incrementByTen())
print(incrementByTen())







//: ### Real life capture example

class HelloFetcher {

	// MARK: Properties and constants
	let session: URLSession
	let helloUrl = URL(string: "https://switter.int.daftcode.pl/api/hello")!

	// MARK: Initializers

	init(session: URLSession) {
		self.session = session
	}

	// MARK: Publi API

	func fetch(completion: @escaping (String?, Error?) -> Void) {
		session.dataTask(with: helloUrl) { (data, response, error) in
			sleep(1)
			DispatchQueue.main.async {
				if let error = error { completion(nil, error); return }
				guard let data = data else { completion(nil, error); return }
				completion(String(data: data, encoding: .utf8), nil)
			}
		}.resume()
	}
}

class MyViewController: UIViewController {

	let fetcher = HelloFetcher(session: URLSession(configuration: .ephemeral))
	var someLabel: UILabel!

	override func loadView() {
		self.view = UIView()
		view.backgroundColor = .white
		someLabel = UILabel()
		someLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(someLabel)
		view.addConstraint(NSLayoutConstraint(item: someLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
		view.addConstraint(NSLayoutConstraint(item: someLabel, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0))
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		someLabel.text = "DidAppear"
	}
}

PlaygroundPage.current.liveView = MyViewController()
//: [Next](@next)

//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {

	var tableView: UITableView!

    override func loadView() {
        self.view = UIView()
        view.backgroundColor = .white

		tableView = UITableView(frame: .zero, style: .plain)
		view.addSubview(tableView)
		view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[tableView]|", options: [], metrics: nil, views: ["tableView": tableView]))
		view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options: [], metrics: nil, views: ["tableView": tableView]))
		tableView.translatesAutoresizingMaskIntoConstraints = false
    }

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") else { fatalError() }
		return cell
	}
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyCustomCollectionViewCell: UICollectionViewCell {

	let titleLabel: UILabel = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(titleLabel)
		setupConstraints()
		setupFont()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		contentView.addSubview(titleLabel)
		setupConstraints()
		setupFont()
	}

	private func setupConstraints() {
		addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0))
		addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
	}

	private func setupFont() {
		titleLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .black)
	}
}

class MyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

	var collectionView: UICollectionView!
	var layout: UICollectionViewFlowLayout!

    override func loadView() {
        self.view = UIView()
        view.backgroundColor = .white

		layout = UICollectionViewFlowLayout()
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		view.addSubview(collectionView)
		view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[collectionView]|", options: [], metrics: nil, views: ["collectionView": collectionView]))
		view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[collectionView]|", options: [], metrics: nil, views: ["collectionView": collectionView]))
		collectionView.translatesAutoresizingMaskIntoConstraints = false
    }

	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(MyCustomCollectionViewCell.self, forCellWithReuseIdentifier: "CELL")
		collectionView.backgroundColor = .white

		layout.itemSize = CGSize(width: 100, height: 150)
		layout.minimumLineSpacing = 20
		layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 30, right: 10)
	}

//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//		let width = max(30, (65 * (indexPath.item + 41)) % 217)
//		let height = max(30, (45 * (indexPath.item + 53)) % 132)
//		return CGSize(width: width, height: height)
//	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 4
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 16
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as? MyCustomCollectionViewCell else { fatalError() }
		cell.backgroundColor = UIColor.lightGray
		cell.titleLabel.text = "[\(indexPath.section):\(indexPath.item)]"
		cell.titleLabel.textColor = .white
		return cell
	}
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

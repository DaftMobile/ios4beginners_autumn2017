//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Kajetan Dąbrowski on 20/11/2017.
//  Copyright © 2017 DaftMobile. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	var model: [Pokemon]!

	@IBOutlet weak var tableView: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		self.model = try! PokemonDiskLoader().load()
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return model.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") else { fatalError() }
		let pokemon = model[indexPath.row]
		cell.textLabel?.text = "#\(pokemon.number): \(pokemon.name)"
		cell.contentView.backgroundColor = pokemon.keyColor
		cell.textLabel?.textColor = UIColor.white
		cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 21.0)
		return cell
	}
}

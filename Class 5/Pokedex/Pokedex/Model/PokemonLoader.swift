//
//  PokemonLoader.swift
//  Pokedex
//
//  Created by Kajetan Dąbrowski on 20/11/2017.
//  Copyright © 2017 DaftMobile. All rights reserved.
//

import Foundation

enum LoaderError: Error {
	case fileNotFound
}

protocol PokemonLoading {
	func load() throws -> [Pokemon]
}

class PokemonDiskLoader: PokemonLoading {
	func load() throws -> [Pokemon] {
		let bundle = Bundle.main
		guard let url = bundle.url(forResource: "pokemon_list", withExtension: "json") else {
			throw LoaderError.fileNotFound
		}
		let pokemonData = try Data(contentsOf: url)
		return try JSONDecoder().decode(Array<Pokemon>.self, from: pokemonData)
	}
}

//
//  Pokemon.swift
//  Pokedex
//
//  Created by Guilherme Rosa on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

struct PokemonList: Codable {
    let pokemons: [Pokemon]
}

struct Stats: Codable {
    let value: Int
    let name: String
}

struct Pokemon : Codable {
    let name: String
    let id: String
    let types: [PokemonType]
    let image: String
    let description: String?
    let stats: [Stats]?
}

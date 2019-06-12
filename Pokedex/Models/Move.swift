//
//  Move.swift
//  Pokedex
//
//  Created by Guilherme Rosa on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

struct Move : Codable {
    let name: String
    let learnLevel: Int
    let type: PokemonType
}

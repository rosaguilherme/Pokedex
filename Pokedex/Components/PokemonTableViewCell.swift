//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Guilherme Rosa on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var pokemonTypeOneView: PokemonTypeView!
    @IBOutlet weak var pokemonTypeTwoView: PokemonTypeView!
    
    func config(with model: Pokemon){
        pictureImageView.loadImage(from: model.image)
        
        nameLabel.text = model.name.capitalized
        idLabel.text = "#\(model.id.leftPadding(toLength: 3, withPad: "0"))"
        
        if let pokemonFirstType = model.types.first {
            pokemonTypeOneView.config(type: pokemonFirstType, showLabel: false)
        }
        
        if model.types.count > 1 {
            pokemonTypeTwoView.config(type: model.types[1], showLabel: false)
            pokemonTypeTwoView.isHidden = false
        } else {
            pokemonTypeTwoView.isHidden = true
        }
    }
    
}

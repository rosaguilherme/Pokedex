//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Guilherme Moreira on 13/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonDetailView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    @IBOutlet weak var pokemonFirstTypeView: PokemonTypeView!
    @IBOutlet weak var pokemonSecondTypeView: PokemonTypeView!
    
    @IBOutlet weak var pokemonDescriptionLabel: UILabel!
    @IBOutlet weak var statsTableView: UITableView!
    
    var pokemonStats: [Stats]?
    let nibName = "PokemonDetailView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        contentView.fixInView(self)
        
        self.statsTableView.delegate = self
        self.statsTableView.dataSource = self
    }
    
    func config(pokemon: Pokemon) {
        DispatchQueue.main.async {
            self.pokemonNameLabel.text = pokemon.name.capitalized
            
            if let pokemonFirstType = pokemon.types.first {
                self.pokemonFirstTypeView.config(type: pokemonFirstType, showLabel: true)
            }
            
            if pokemon.types.count > 1 {
                self.pokemonSecondTypeView.config(type: pokemon.types[1], showLabel: true)
                self.pokemonSecondTypeView.isHidden = false
            } else {
                self.pokemonSecondTypeView.isHidden = true
            }
            
            self.pokemonDescriptionLabel.text = pokemon.description
        }
    }
}

extension PokemonDetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let pokemonStats = self.pokemonStats {
            return pokemonStats.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonStatsView", for: indexPath) as! PokemonStatsView
        
        if let pokemonStats = self.pokemonStats {
            cell.config(stats: pokemonStats[indexPath.row])
        }
        return cell
    }
}

extension PokemonDetailView: UITableViewDelegate {
    
}

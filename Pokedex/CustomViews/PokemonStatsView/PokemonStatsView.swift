//
//  PokemonStatsView.swift
//  Pokedex
//
//  Created by Guilherme Moreira on 14/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonStatsView: UITableViewCell {
    
    @IBOutlet weak var statsLabel: UILabel!
    @IBOutlet weak var statsValueLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    func config(stats: Stats) {
        self.statsLabel.text = stats.name.capitalized
        self.statsValueLabel.text = "\(stats.value)"
        self.progressBar.progress = Float((stats.value / 100))
    }
}

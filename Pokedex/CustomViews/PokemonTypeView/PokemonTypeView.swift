//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by Guilherme Rosa on 12/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonTypeView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    
    let nibName = "PokemonTypeView"
    
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
        
    }
    
    func config(type: PokemonType, showLabel: Bool) {
        self.typeImageView.image = type.icon
        if showLabel {
            self.typeLabel.text = type.rawValue.uppercased()
        } else {
            self.typeLabel.isHidden = true
        }
        self.contentView.backgroundColor = type.color
    }
    
}

//
//  MoveTableViewCell.swift
//  Pokedex
//
//  Created by Guilherme Rosa on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class MoveTableViewCell: UITableViewCell {
    
    @IBOutlet weak var typeNameLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    
    func config(with model: Move){
        typeNameLabel.text = model.name.capitalized
        typeImageView.image = model.type.icon
        typeImageView.backgroundColor = model.type.color
    }
}

//
//  ViewController.swift
//  Pokedex
//
//  Created by Juliano Nardon on 07/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController {
    
    var requestMaker = RequestMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testAPI()
    }
}

extension PokemonListViewController {
    
    func testAPI(){
        requestMaker.make(withEndPoint: .list){
            (pokemonList: PokemonList) in
            print(pokemonList)
        }
    }
}

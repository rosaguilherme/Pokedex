//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Guilherme Rosa on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var gradientView: GradientView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    @IBOutlet weak var pokemonImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewVerticallyConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var detailView: PokemonDetailView!
    
    @IBOutlet weak var detailViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var detailViewTopConstraint: NSLayoutConstraint!
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initalConfig()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loadPokemonAnimation()
        self.requestPokemon()
    }
    
    func animateImagePokemonToTop(){
        DispatchQueue.main.async {
            self.pokemonImageView.layer.removeAllAnimations()
            
            self.pokemonImageViewVerticallyConstraint.priority = UILayoutPriority(900)
            self.pokemonImageViewTopConstraint.priority = UILayoutPriority(999)
            self.pokemonImageViewTopConstraint.constant = 15
            self.pokemonImageViewHeightConstraint.constant = 80
            self.pokemonImageViewWidthConstraint.constant = 80
            
            self.detailViewHeightConstraint.priority = UILayoutPriority(900)
            self.detailViewTopConstraint.priority = UILayoutPriority(999)
            self.detailViewTopConstraint.constant = 70
            
            UIView.animate(withDuration: 1, animations: {
                self.pokemonImageView.alpha = 1
                self.view.layoutIfNeeded()
            })
        }
    }
    
    func loadPokemonAnimation(){
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.pokemonImageView.alpha = 0.2
        })
    }
    
    func requestPokemon(){
        if let pokemon = self.pokemon {
            let requestMaker = RequestMaker()
            requestMaker.make(withEndPoint: .details(query: pokemon.id)) {
                (pokemonDetail: Pokemon) in
                self.animateImagePokemonToTop()
                self.detailView.config(pokemon: pokemonDetail)
            }
        }
    }
    
    func initalConfig(){
        if let pokemon = self.pokemon {
            self.gradientView.startColor = pokemon.types.first?.color ?? .black
            self.gradientView.endColor = pokemon.types.first?.color?.lighter() ?? .white
            self.pokemonImageView.loadImage(from: pokemon.image)
        }
    }
    
    
    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

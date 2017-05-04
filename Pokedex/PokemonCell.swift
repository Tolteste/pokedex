//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Stefan on 04/05/17.
//  Copyright © 2017 Synetech. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    @IBOutlet weak var pokemonImage : UIImageView!
    @IBOutlet weak var nameLbl : UILabel!
    
    var pokemon : Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0 
    }
    
    func configureCell ( _ pokemon : Pokemon ) {
        self.pokemon = pokemon
        self.nameLbl.text = pokemon.name.capitalized
        self.pokemonImage.image = UIImage(named: "\(pokemon.pokedexId)")
    }
    
}

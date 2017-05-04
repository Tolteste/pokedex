//
//  PokemonDetailController.swift
//  Pokedex
//
//  Created by Stefan on 04/05/17.
//  Copyright © 2017 Synetech. All rights reserved.
//

import UIKit

class PokemonDetailController: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    var pokemon : Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name

    }
}

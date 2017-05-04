//
//  Pokemon.swift
//  Pokedex
//
//  Created by Stefan on 03/05/17.
//  Copyright © 2017 Synetech. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name : String!
    private var _pokedexId : Int!
    
    var name : String {
        return _name
    }
    
    var pokedexId : Int {
        return _pokedexId
    }
    
    init(name : String , pokedexId : Int) {
        _name = name
        _pokedexId = pokedexId
    }
}

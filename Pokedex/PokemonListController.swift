//
//  ViewController.swift
//  Pokedex
//
//  Created by Stefan on 03/05/17.
//  Copyright © 2017 Synetech. All rights reserved.
//

import UIKit

class PokemonListController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection : UICollectionView!
    
    var pokemons = [Pokemon]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collection.dataSource = self
        collection.delegate = self
        parsePokemonCSV()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as? PokemonCell {
            let pokemon = Pokemon(name: pokemons[indexPath.row].name, pokedexId: pokemons[indexPath.row].pokedexId)
            cell.configureCell(pokemon)
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 106, height: 107)
    }
    
    func parsePokemonCSV() {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            let csv =  try CSV(contentsOfURL: path)
            let rows = csv.rows

            for row in rows {
                let name = row["identifier"]!
                let pokedexId = Int(row["id"]!)!
                
                pokemons.append(Pokemon(name: name, pokedexId: pokedexId))
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}


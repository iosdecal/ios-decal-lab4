//
//  PokemonGenerator.swift
//  PokedexLab
//
//  Created by SAMEER SURESH on 2/25/17.
//  Copyright © 2017 iOS Decal. All rights reserved.
//

import Foundation

class PokemonGenerator {
    
    static let categoryDict: [Int:String] =
        [
            0: "Bug",
            1: "Dark",
            2: "Dragon",
            3: "Electric",
            4: "Fairy",
            5: "Fighting",
            6: "Fire",
            7: "Flying",
            8: "Ghost",
            9: "Grass",
            10: "Ground",
            11: "Ice",
            12: "Normal",
            13: "Poison",
            14: "Psychic",
            15: "Rock",
            16: "Steel",
            17: "Water"
    ]
    
    static func getPokemonArray() -> [Pokemon] {
        var pokemonArray: [Pokemon] = []
        if let path = Bundle.main.path(forResource: "pokeData", ofType: "json")
        {
            if let jsonData = NSData(contentsOfFile: path) {
                do {
                    let json = try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) as! [String:AnyObject]
                    for key in json.keys {
                        let pokemonData = json[key] as! [String:AnyObject]
                        let number = Int(pokemonData["#"] as! String)!
                        let attack = Int(pokemonData["Attack"] as! String)!
                        let defense = Int(pokemonData["Defense"] as! String)!
                        let hp = Int(pokemonData["HP"] as! String)!
                        let spatk = Int(pokemonData["Sp. Atk"] as! String)!
                        let spdef = Int(pokemonData["Sp. Def"] as! String)!
                        let species = pokemonData["Species"] as! String
                        let speed = Int(pokemonData["Speed"] as! String)!
                        let total = Int(pokemonData["Total"] as! String)!
                        let type = pokemonData["Type"] as! [String]
                        pokemonArray.append(Pokemon(name: key, number: number, attack: attack, defense: defense, health: hp, spAttack: spatk, spDef: spdef, species: species, speed: speed, total: total, types: type))
                    }
                } catch {
                    NSLog("Could not load Pokemon array")
                }
                
            }
        }
        return pokemonArray
    }
    
    
}

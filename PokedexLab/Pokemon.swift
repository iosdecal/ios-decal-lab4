//
//  Pokemon.swift
//  PokedexLab
//
//  Created by SAMEER SURESH on 2/25/17.
//  Copyright © 2017 iOS Decal. All rights reserved.
//

import Foundation

@objc class Pokemon: NSObject {
    
    let name: String!
    let number: Int!
    let attack: Int!
    let defense: Int!
    let health: Int!
    let specialAttack: Int!
    let specialDefense: Int!
    let species: String!
    let speed: Int!
    let total: Int!
    let types: [String]
    let imageUrl: String!
    
    init(name: String, number: Int, attack: Int, defense: Int, health: Int, spAttack: Int, spDef: Int, species: String, speed: Int, total: Int, types: [String]) {
        self.name = name
        self.number = number
        self.attack = attack
        self.defense = defense
        self.health = health
        self.specialAttack = spAttack
        self.specialDefense = spDef
        self.species = species
        self.speed = speed
        self.total = total
        self.types = types
        self.imageUrl = "http://img.pokemondb.net/artwork/\(name.components(separatedBy: " ")[0].lowercased()).jpg"
    }
  
    static func ==(lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.name == rhs.name
    }
    
}


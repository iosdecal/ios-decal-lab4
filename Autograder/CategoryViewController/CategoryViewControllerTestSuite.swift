//
//  CategoryViewControllerTestCases.swift
//  PokedexLabTests
//
//  Created by Chris Zielinski on 7/22/17.
//  Copyright © 2017 iOS Development Decal. All rights reserved.
//

import UIKit
import XCTest
import BKAutograder
@testable import PokedexLab

extension CategoryViewController: BKTableView {}

final class b_CategoryViewControllerTestSuite: BKTestSuite, BKAutogradable {
    
    let gradingFileName: String = "CategoryViewController"
    
    var indexPath: IndexPath!
    var categoryViewController: CategoryViewController!
    var tableViewController: BKTableView!
    var pokemonArray: [Pokemon]!
    var tableView: UITableView!
    var cell: UITableViewCell!
    
    func testQ0Existence() {
        BKAssertNotNil(categoryViewController)
        tableViewController = categoryViewController as BKTableView
        pokemonArray = BKAssertInstance(from: categoryViewController, withDescription: "'pokemonArray' correctly set by SearchViewController", andSkip: [3, 4, 5, 7, 8])
        BKAssertTrue(pokemonArray.count != 0, withDescription: "'pokemonArray' correctly set by SearchViewController", andSkip: [3, 4, 5, 7, 8])
    }
    
    func testQ1TableViewExists() {
        tableView = BKAssertInstance(from: categoryViewController)
        BKAssertView(tableView, isDescendantOf: categoryViewController)
    }
    
    func testQ2ConformsToUITableViewDataSource() {
        BKAssertConforms(categoryViewController, conformsTo: UITableViewDataSource.self)
    }
    
    func testQ3TableViewNumberOfRows() {
        let numberOfRows = tableViewController.tableView?(tableView, numberOfRowsInSection: 0)
        BKAssertEqual(pokemonArray.count, studentValue: numberOfRows)
    }

    func testQ4TableViewCellForRow() {
        indexPath = BKUtilities.randomIndexPath(withRowUpperBound: pokemonArray.count, inSection: 0)
        
        cell = BKAssertNotNil(tableViewController.tableView?(tableView, cellForRowAt: indexPath))

        BKAssertExistance(of: UIImageView.self, inSubviewsOf: cell)
        BKAssertExistance(of: UILabel.self, inSubviewsOf: cell, count: 3)
    }

    func testQ5TableViewCellFormat() {
        let pokemon = pokemonArray[indexPath.row]
        BKAssertLabel(in: cell, contains: pokemon.name)
        BKAssertLabel(in: cell, contains: String(pokemon.number))
        BKAssertLabel(in: cell, contains: [String(pokemon.attack), String(pokemon.defense), String(pokemon.health)])
    }

    func testQ6ConformsToUITableViewDelegate() {
        BKAssertConforms(categoryViewController, conformsTo: UITableViewDelegate.self)
    }

    func testQ7TableViewDidSelectRowAt() {
        BKAssertNotNil(tableViewController.tableView?(tableView, didSelectRowAt: indexPath))
    }
    
    func testQ8StoryboardSegueToPokemonInfoViewController() {
        BKAssertSegue(to: PokemonInfoViewController.self)
    }
    
}






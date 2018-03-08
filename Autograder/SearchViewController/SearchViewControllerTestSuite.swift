//
//  SearchViewControllerTestSuite.swift
//  PokedexLabTests
//
//  Created by Chris Zielinski.
//  Copyright © 2017 iOS Development Decal. All rights reserved.
//


import Foundation
import UIKit
import BKAutograder
import XCTest
@testable import PokedexLab

extension SearchViewController: BKCollectionView {}

final class a_SearchViewControllerTestSuite: BKTestSuite, BKAutogradable {
    
    var gradingFileName: String = "SearchViewController"
    
    var indexPath = BKUtilities.randomIndexPath(withRowUpperBound: PokemonGenerator.categoryDict.count, inSection: 0)
    var searchViewController: SearchViewController!
    var categoryViewController: CategoryViewController!
    var collectionViewController: BKCollectionView!
    var collectionView: UICollectionView!
    var imageView: UIImageView!

    func testQ0Existence() {
        searchViewController = BKAssertStoryboardViewController()
        BKLoadView(in: searchViewController)
        collectionViewController = searchViewController as BKCollectionView
    }
    
    func testQ1EmbeddedInNavigationController() {
        BKAssertViewController(searchViewController, isEmbeddedIn: UINavigationController.self)
    }
    
    func testQ2CollectionViewExists() {
        collectionView = BKAssertInstance(from: searchViewController)
        BKAssertView(collectionView, isDescendantOf: searchViewController)
    }
    
    func testQ3ConformsToUICollectionViewDataSource() {
        BKAssertConforms(searchViewController, conformsTo: UICollectionViewDataSource.self)
    }
    
    func testQ4CollectionViewNumberOfItems() {
        let numberOfItems = collectionViewController.collectionView?(collectionView, numberOfItemsInSection: 0)
        BKAssertEqual(PokemonGenerator.categoryDict.count, studentValue: numberOfItems)
    }
    
    func testQ5CollectionViewCellForItem() {
        let cell: UICollectionViewCell = BKAssertNotNil(collectionViewController.collectionView?(collectionView, cellForItemAt: indexPath))
        imageView = BKAssertInstance(from: cell)
        BKAssertView(imageView, isDescendantOf: cell)
    }
    
    func testQ6CollectionViewCellImage() {
        BKAssertEqual(imageIn: imageView, andImageFromName: PokemonGenerator.categoryDict[indexPath.row]!)
    }
    
    func testQ7ConformsToUICollectionViewDelegate() {
        BKAssertConforms(searchViewController, conformsTo: UICollectionViewDelegate.self)
    }
    
    func testQ8CollectionViewDidSelectItem() {
        BKAssertNotNil(collectionViewController.collectionView?(collectionView, didSelectItemAt: indexPath))
    }
    
    func testQ9StoryboardSegueToCategoryViewController() {
        categoryViewController = BKAssertSegue(to: CategoryViewController.self)
    }
    
}








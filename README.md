# Lab 4 : TableViews and CollectionViews #


## Due Date ##
Tuesday, March 7th at 11:59 pm

## Overview ##

In this lab you'll get to see how tableviews and collectionviews are typically implemented in an iOS app. We'll be building a simple Pokedex app that displays a list of different Pokemon by category and allows you to view their statistics.

To begin this lab, clone this repository onto your own computer:
	
	git clone https://github.com/iosdecal/ios-decal-lab3

## Getting Started 

Open the project in Xcode and go into the project navigator. You'll notice that the following files have been created and implemented or partially implemented for you:

1. `pokeData.json` - this is our data file which contains information for over 600 Pokemon in JSON format. You will not need to do anything with this file. 
2. `Pokemon.swift` in the `Model` folder - this is the model for Pokemon objects. Take a look at all the variables we are keeping track of. Note that there is not much code in this file - we simply use it to store and access the properties of each Pokemon. You do not need to edit any code here.
3. `PokemonGenerator.swift` in the `Model` folder - this file contains a useful function which goes through the JSON file and generates an array of Pokemon objects for us. It also stores a dictionary mapping integer values to all of the possible categories of Pokemon. You will need to reference this dictionary in the first part of the lab.
4. `SearchViewController.swift` in the `Controllers` folder - this is the initial view controller which handles category selection. You will have to implement all of the collectionview functionality for this class.
5. `CategoryViewController.swift` in the `Controllers` folder - displays a list of Pokemon which belong to the selected category. You will have to implement all of the tableview functionality for this class.
6. `PokemonInfoViewController.swift` in the `Controllers` folder - displays an expanded view of the statistics for a single Pokemon. You do not need to edit any code in this file, but you still need to handle the segue from `CategoryViewController` to `PokemonInfoViewController` and the passing of data.

In `Main.storyboard`, you'll see three screens corresponding to each of our three view controllers. The third one has already been set up, but you need to complete the first two, as well as handle all navigation between screens. 

Also notice images of all 18 categories in the `Assets.xcassets` folder. 

Now, let's go ahead and get started! 

## Part 1: Navigation ##
Before we start writing any code, let's make sure that the flow of our app is completely fleshed out. Go to `Main.storyboard` and complete the following tasks:
- **Create a segue** between `SearchViewController` and `CategoryViewController` and another one between `CategoryViewController` and `PokemonInfoViewController`. Both of these should be "show" type segues. **Be sure to give the segues identifiers so that we can reference them from our code**. 
- Embed the first screen in a **navigation controller** (this will allow us to move freely back and forth between screens). You can do this either by dragging out a navigation controller and dragging a segue to `SearchViewController` as its root view controller, or by clicking on `SearchViewController`, going to the Editor tab, and choosing Embed In > Navigation Controller. Also, **make sure that the navigation controller is set to our initial view controller in the attributes inspector**.

## Part 2: SearchViewController ##


## Part 3: CategoryViewController ##


## Grading ##
You have the option to either be checked off by a TA or instructor during lab to receive your grade immediately **(recommended)**, or submit your files to [Gradescope](https://gradescope.com/courses/5482/assignments/17996/) to be graded later.

If you are submitting via Gradescope, you will need to submit a zip folder of all of your project files (compress and submit the folder you cloned from GitHub).

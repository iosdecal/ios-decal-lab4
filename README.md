# Lab 4 : TableViews and CollectionViews #

##### Note: This is a two week lab (we will be finishing it next week). 

## Overview ##

In this lab you'll get to see how tableviews and collectionviews are typically implemented in an iOS app. We'll be building a simple Pokedex app that displays a list of different Pokemon by category and allows you to view their statistics.

To begin this lab, clone this repository onto your own computer or download a zip version:
	
	git clone https://github.com/iosdecal/ios-decal-lab4

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
- **Create a show segue** between `SearchViewController` and `CategoryViewController` and add a segue identifier
- **Create a show segue** between `CategoryViewController` and `PokemonInfoViewController` and add a segue identifier
- Embed the first screen in a **navigation controller**. You can do this either by dragging out a navigation controller and dragging a segue to `SearchViewController` as its root view controller, or by clicking on `SearchViewController`, going to the Editor tab, and choosing Embed In > Navigation Controller. Also, **make sure that the navigation controller is set to our initial view controller in the attributes inspector**.

## Part 2: SearchViewController ##

Now we'll start implementing the collectionview in `SearchViewController`, which will display all of our 18 categories in a grid format. 

![](/README-images/collectionview.png)

- Still in `Main.storyboard`, drag out a collectionview onto the first screen and extend it so that it fills the whole screen, including the navigation bar segment (you'll need to set some constraints here). Notice that a small box appears in the top left corner of the collectionview - this is a prototype cell where you can design the layout for each collectionview cell. Extend the box to be a square that fills about a third of the width of the screen (drag the corner of the prototype cell, ideally we want our grid to be something like six rows of three - see the image above).
- Inside the prototype cell, place an imageView and set its constraints to fill the entire cell. 
- We need to create two outlets at this point: one for the collectionview itself and one for the imageview. 
    - The collectionview should be easy - just drag an outlet into `SearchViewController`. 
    - However, the imageview isn't a property of the view controller, so it's outlet doesn't belong there (why? we want the image view to appear in every **cell** of our collectionview, so it should be a property of a UICollectionViewCell instead). To do this, **(1) create a class for our custom collectionViewCell that subclasses UICollectionViewCell**. Once you've created this file, **(2) set your prototype cell in storyboard class to your new custom cell class**. Then, **(3)create an outlet for the imageview in your new collectionviewcell class file.**

Head over to `SearchViewController.swift` now. The code for this section isn't too difficult, but there's many tedious things to take care of. By the end of this section, you should have implemented all of the collectionview's functionality.

Some things to consider:
- The view controller should subclass UICollectionViewDataSource and UICollectionViewDelegate (this tells the program that the view controller is guaranteed to implement a certain set of functions that are relevant to the collectionview).
- In `viewDidLoad`, set the collectionview's delegate and datasource properties to self (this tells the collectionview that it should look within the view controller for the functions it needs to be functional).

You should implement the following collectionview functions:

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}

You'll find the dictionary in `PokemonGenerator.swift` particularly useful for this section. You can reference the dictionary as follows:
	
	PokemonGenerator.categoryDict[/* some int */]

- In `cellForItemAt`, make sure to dequeue a cell object and cast it to the custom cell class you created before setting its properties. In order to dequeue the cell, you'll need to set a cell reuse identifier for your collectionview cell in `Main.storyboard` 
- In `didSelectItemAt` you'll need to implement the following functionality:
 - Use the `filteredPokemon(ofType type: Int)` function to get an array of Pokemon belonging to the selected category (based off the cell the user selected).
 - Then perform a segue to CategoryViewController using the identifier you created in Part 1. (Though we've only gone over triggering segues in Storyboard by control-dragging from a button, you can trigger a segue that you created in Storyboard between two view controllers programmatically by calling the following method in your code: `performSegue(withIdentifier: <YourSegueIdentifierFromStoryboard>, sender: <Any?>)`	
- Since we only want the CategoryViewController to display Pokemon from the category selected by the user, we need to create and implement the `prepareForSegue` method as well to pass along which Pokemon should be displayed. To do this, add the prepareForSegue method to the SearchViewController, and set the pokemonArray variable in the destination view controller (segue.destination) to your filtered array. (If you're having trouble at this step, check out the prepare for segue example in [Lecture 4](https://drive.google.com/open?id=1ONnUUkurmfIGnPHytIIL6s7G0WBk_OxG))

Once you've completed all of these steps, you should be able to run the program and see a grid of 18 different Pokemon categories. 

## Part 3: CategoryViewController ##

Our goal in this section is to display a list of all Pokemon that fit the search criteria (e.g. selecting "electric" should show us only electric type Pokemon). We'll use a tableview for this part, but the process will be very similar.

- Go back to `Main.storyboard` and this time, place a tableview fitting the entire screen on `CategoryViewController`. You won't see a prototype cell automatically this time, but you can drag out a tableview cell and drop it on the tableview to see this. Extend the height of the cell to be a reasonable amount (about 80-100 should be good). 
- We want to display four things on each cell: the name, number, key stats (attack/defense/health), and image for each Pokemon. Drag out the necessary UI elements and place them on the cell.

The format should look something like this (does not have to be exact):
![alt text](/README-images/tableviewcell.png)

- Just like before, you'll need to create a subclass of UITableViewCell for the cell elements and set the prototype cell's class to your new class again. Once you have done this create outlets for your cell's UI elements in your newly created custom tableviewcell class.

Now go to `CategoryViewController.swift`, so we can set up our table view (these steps are almost identical to what you did for your collectionview in part 2).

- Create an outlet for your tableview 
- Set the delegate and datasource for this tableview in `viewDidLoad`, and make your class subclass UITableViewDelegate and UITableViewDataSource in the same way you did for your collectionview
- implement the same set of functions from part 2. You'll need to use the `pokemonArray` variable to implement `numberOfRowsInSection` and also `cellForRowAt`. 

Instead of loading images from `xcassets`, for this table view, we will be using a URL to load an images from the internet. This isn't too difficult to look up but it involves some URL requests which we have not covered yet, so feel free to copy this block of code into your function `cellForRowAt`:

        if let image = cachedImages[indexPath.row] {
            cell.pokemonImageView.image = image
        } else {
            cell.pokemonImageView.image = nil
            let url = URL(string: pokemon.imageUrl)!
            let session = URLSession(configuration: .default)
            let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
                if let e = error {
                    print("Error downloading picture: \(e)")
                } else {
                    if let _ = response as? HTTPURLResponse {
                        if let imageData = data {
                            let image = UIImage(data: imageData)
                            DispatchQueue.main.async {
                                self.cachedImages[indexPath.row] = image
                                cell.pokemonImageView.image = image // UIImage(data: imageData)
                            }
                        } else {
                            print("Couldn't get image: Image is nil")
                        }
                    } else {
                        print("Couldn't get response code")
                    }
                }
            }
            downloadPicTask.resume()
        }

For reference, `cachedImages` is a dictionary that stores images we've already loaded so that we don't have to make a network request every time we scroll to a cell. 

- In `didSelectRowAt`, set the `selectedIndexPath` variable at the top of the file
- Then perform a segue to `PokemonInfoViewController` within `didSelectRowAt` Your `prepareForSegue` function should assign both the `pokemon` and `image` properties of `PokemonInfoViewController`. 
 - To set the image, you should make use of `cachedImages`, but in some cases it is possible that we click on a cell before its image has been loaded. To handle this, you should check that the image is actually in the dictionary (hint: use safe optional unwrapping). Otherwise, just do nothing (`PokemonInfoViewController` takes care of image loading if nothing is passed in). 

*A quick side note about image loading: typically it's not a good idea to attempt to cache images ourselves (we could end up unnecessarily storing hundreds of images); instead, most iOS developers use external libraries which automatically take care of making URL requests and also caching images for us. Since we haven't gone over how to implement third party libraries in an app yet, we'll avoid that for this lab, but be aware that there are more efficient/less redundant ways to load images than this.*

And that's it! If everything works correctly, you should be able to navigate across the entire app and click on any Pokemon to see its statistics. You've now built your first tableview/collectionview app!

## Grading ##
Once you've finished the lab, you can get checked-off by showing a TA or Facilitaotr a working version of the app. 

//
//  PokemonInfoViewController.swift
//  PokedexLab
//
//  Created by SAMEER SURESH on 2/25/17.
//  Copyright © 2017 iOS Decal. All rights reserved.
//

import UIKit

class PokemonInfoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var atkLabel: UILabel!
    @IBOutlet weak var defLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var spatkLabel: UILabel!
    @IBOutlet weak var spdefLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var image: UIImage?
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pokemon = pokemon {
            nameLabel.text = pokemon.name
            speciesLabel.text = pokemon.species
            atkLabel.text = "Attack: \(pokemon.attack!)"
            defLabel.text = "Defense: \(pokemon.defense!)"
            healthLabel.text = "Health: \(pokemon.health!)"
            spatkLabel.text = "Sp. Atk: \(pokemon.specialAttack!)"
            spdefLabel.text = "Sp. Def: \(pokemon.specialDefense!)"
            speedLabel.text = "Speed: \(pokemon.speed!)"
            totalLabel.text = "Total: \(pokemon.total!)"
            if let image = image {
                imageView.image = image
            } else {
                let url = URL(string: pokemon.imageUrl)!
                let session = URLSession(configuration: .default)
                let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
                    if let e = error {
                        print("Error downloading picture: \(e)")
                    } else {
                        if let _ = response as? HTTPURLResponse {
                            if let imageData = data {
                                DispatchQueue.main.async {
                                    self.imageView.image = UIImage(data: imageData)
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
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

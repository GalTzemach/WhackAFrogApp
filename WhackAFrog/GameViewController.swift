//
//  GameViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var images: [String] = ["good", "bad", "life"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // Actions
    
    @IBAction func backClicked(_ sender: Any) {
        performSegue(withIdentifier: "gameToMainSegue", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCell
        
        cell.myImage.image = UIImage(named: images[indexPath.row])
        
        return cell
    }

}

//
//  GameViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit

let numOfRow: Int = 5
let numOfCol: Int = 4 // num of element per row

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var timer: Timer!
    var images: [String] = ["good", "bad", "life"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth: Int = Int(UIScreen.main.bounds.width)
        let itemSize = screenWidth / numOfCol - (30 + 40 / numOfCol) // 4 element each row
    
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 30
        
        collectionView.collectionViewLayout = layout
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
    }
    
    func runTimedCode() {
    
        print("time out")
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("timer invalitade")
        timer.invalidate()
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
        
        return numOfRow * numOfCol
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCell
        
        //cell.layer.cornerRadius = 50
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        
        
        // random number in order to choose image
        let randomNum: Int = Int(arc4random_uniform(3)) // range is 0 to 2
        cell.myImage.image = UIImage(named: images[randomNum])
        
        /// print(indexPath.row)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item pressed is: " , indexPath.row)
    }

}

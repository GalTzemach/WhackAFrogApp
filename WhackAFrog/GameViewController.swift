//
//  GameViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, TileTimeUp {

    // outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    
    let mUserDefaults = UserDefaults.standard
    
    var typeCharacter: Int = 1
    
    let numOfRow: Int = 5
    let numOfCol: Int = 4
    let durationGame: Int = 10 // Sec
    
    weak var timer: Timer?
    var gameLogic: GameLogic?
    var currentTime: Int = 0
    var score: Int = 0
    var totalLife: Int = 0
    
    let images1: [String] = ["good", "bad", "life"]
    let images2: [String] = ["good2", "bad2", "life2"]
    var images: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        // choose appropriate images to show
        typeCharacter = mUserDefaults.integer(forKey: "typeCharacter")
        
        if typeCharacter == 2 {
            images = images2
        } else {
            images = images1
        }
        
        let screenWidth: Int = Int(UIScreen.main.bounds.width)
        let itemSize = screenWidth / numOfCol - (20 + 40 / numOfCol) // 4 element each row
    
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        
        collectionView.collectionViewLayout = layout
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        gameLogic = GameLogic.init()
        
        scoreLabel.text = String(describing: gameLogic!.score)
        lifeLabel.text = String(describing: gameLogic!.life)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // start main timer
        timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(mainTimerReady), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(true)
        print("timer invalitade")
        timer?.invalidate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        
        currentTime = 0
        score = 0
        totalLife = 0
        
        gameLogic = GameLogic.init()
        
        scoreLabel.text = "0"
        timeLabel.text = "0"
        lifeLabel.text = "3"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "gameToGameOverSegue") {
//            let vc = segue.destination as! GameOverViewController
//            vc.score = score
//        }
//    }
    
    func tileDisappeare(data: Int) {
        
        deleteTile(index: data)
    }
    
    func deleteTile(index: Int) {
        
        let cell: CustomCell = collectionView.cellForItem(at: [0, index]) as! CustomCell
        
        switch gameLogic?.gameBoard.tailMatrix[index].typeOfTile {
            
        case eType.good?:
            gameLogic?.gameBoard.currentGood -= 1
        case eType.bad?:
            gameLogic?.gameBoard.currentBad -= 1
        case eType.life?:
            gameLogic?.gameBoard.currentLife -= 1
        default:
            break
        }
        
        cell.myImage.image = nil
        gameLogic?.gameBoard.tailMatrix[index].invisible()
        gameLogic?.gameBoard.currentTotalVisible -= 1
    }
    
    func mainTimerReady() {
        
        currentTime += 1
        timeLabel.text = String(currentTime / 4)
        
        createNewTile()
        
        // end game
        if currentTime / 4 == durationGame {
            gameOver();
        }
    }
    
    
    func createNewTile() {
        
        // choose random tile
        let randRow: Int = Int(arc4random_uniform(UInt32(numOfRow)))
        let randCol: Int = Int(arc4random_uniform(UInt32(numOfCol)))
        
        let numOfCell: Int = randRow * numOfCol + randCol
        
        let cell : CustomCell = collectionView.cellForItem(at: [0, numOfCell]) as! CustomCell
        
        if gameLogic?.gameBoard.tailMatrix[numOfCell].isVisible == false {
            cell.myImage.alpha = 0

            let randImage: Int = Int(arc4random_uniform(UInt32(images.count)))
            
            if (gameLogic?.gameBoard.currentTotalVisible)! < (gameLogic?.gameBoard.maxTotalVisible)! {
                
                switch randImage {
                case 0:
                    if (gameLogic?.gameBoard.currentGood)! < (gameLogic?.gameBoard.maxGood)!{
                        gameLogic?.gameBoard.tailMatrix[numOfCell].visible(type: eType.good, location: numOfCell)
                        cell.myImage.image = UIImage(named: images[0])
                        
                        gameLogic?.gameBoard.currentTotalVisible += 1
                        gameLogic?.gameBoard.currentGood += 1
                        
                        gameLogic?.gameBoard.tailMatrix[numOfCell].delegate = self
                        
                    }
                case 1:
                    if (gameLogic?.gameBoard.currentBad)! < (gameLogic?.gameBoard.maxBad)!{
                        gameLogic?.gameBoard.tailMatrix[numOfCell].visible(type: eType.bad, location: numOfCell)
                        cell.myImage.image = UIImage(named: images[1])
                        
                        gameLogic?.gameBoard.currentTotalVisible += 1
                        gameLogic?.gameBoard.currentBad += 1
                        
                        gameLogic?.gameBoard.tailMatrix[numOfCell].delegate = self
                    }
                case 2:
                    if (gameLogic?.gameBoard.currentLife)! < (gameLogic?.gameBoard.maxCurrentLife)! && (totalLife < (gameLogic?.gameBoard.maxLife)!){
                        
                        totalLife += 1
                        gameLogic?.gameBoard.tailMatrix[numOfCell].visible(type: eType.life, location: numOfCell)
                        cell.myImage.image = UIImage(named: images[2])
                        
                        gameLogic?.gameBoard.currentTotalVisible += 1
                        gameLogic?.gameBoard.currentLife += 1
                        
                        gameLogic?.gameBoard.tailMatrix[numOfCell].delegate = self
                    }
                default:
                    break
                }
                
                UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                    cell.myImage.alpha = 1
                }, completion: nil)
                
            }
        }
    }
    
    func gameOver() {
        
        mUserDefaults.set(score, forKey: "recentScore")
        performSegue(withIdentifier: "gameToGameOverSegue", sender: self)
    }
    
    
    // actions - (buttons clicked)
    @IBAction func backClicked(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // selelct number of item to collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return numOfRow * numOfCol
    }
    
    // pupolate the callle in collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCell
        
        /// cell.layer.borderColor = UIColor.lightGray.cgColor
        /// cell.layer.borderWidth = 1

        return cell
    }
    
    // perform when any item clicked
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // print("Item pressed is: " , indexPath.row)
        
        if gameLogic?.gameBoard.tailMatrix[indexPath.row].isVisible == true {
            
            let cell : CustomCell = collectionView.cellForItem(at: indexPath) as! CustomCell
            
            switch gameLogic?.gameBoard.tailMatrix[indexPath.row].typeOfTile {
            case eType.good?:
                
                score += 1
                scoreLabel.text = String(score)
                
                gameLogic?.gameBoard.currentGood -= 1
                
                // animation for good click
                let height = cell.myImage.frame.size.height
                let width = cell.myImage.frame.size.width
                
                UIView.animate(withDuration: 0.2, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                    cell.myImage.frame.size.height = 0
                    cell.myImage.frame.size.width = 0
                }, completion: { (success:Bool) in
                    cell.myImage.frame.size.height = height
                    cell.myImage.frame.size.width = width
                    cell.myImage.image = nil
                })
                
            case eType.bad?:
                
                if (gameLogic?.life)! > 1 {
                    gameLogic?.life -= 1
                    lifeLabel.text = String(describing: gameLogic!.life)
                    gameLogic?.gameBoard.currentBad -= 1
                } else {
                    gameOver()
                }
                
                // animation for bad click
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear, animations: {
                    cell.myImage.frame.origin.x += 20
                }, completion: { (success:Bool) in
                    UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear, animations: {
                        cell.myImage.frame.origin.x -= 20
                    }, completion: { (success:Bool) in
                        cell.myImage.image = nil
                    })
                })
                
            case eType.life?:
                
                gameLogic?.life += 1
                lifeLabel.text = String(describing: gameLogic!.life)
                gameLogic?.gameBoard.currentLife -= 1
                
                // animation for life click
                UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                    cell.myImage.frame.size.width += 100
                    cell.myImage.frame.size.height += 100
                }, completion: { (success:Bool) in
                    cell.myImage.frame.size.width -= 100
                    cell.myImage.frame.size.height -= 100
                    cell.myImage.image = nil
                })
                
            default:
                break
            }
            
            gameLogic?.gameBoard.tailMatrix[indexPath.row].invisible()
            gameLogic?.gameBoard.currentTotalVisible -= 1
        }
    }
}

//
//  GameViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

//for git
import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    
    let numOfRow: Int = 5
    let numOfCol: Int = 4
    let durationGame: Int = 20 /// change to 60
    
    weak var timer: Timer? /// weak is nessesary ?
    var gameLogic: GameLogic?
    var currentTime: Int = 0
    
    var score: Int = 0
    var images: [String] = ["good", "bad", "life"]
    
    var totalLife: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
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
        
        timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(timerReady), userInfo: nil, repeats: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "gameToGameOverSegue") {
            let vc = segue.destination as! GameOverViewController
            vc.score = score
        }
    }
    
    func timerReady() {
        
        currentTime += 1
        timeLabel.text = String(currentTime / 4)
        
        createNewTile()
        
        // end game
        if currentTime / 4 == durationGame {
            won();
        }
    }
    
    
    func createNewTile() {
        
        /// print("create new tile :: gameLogic?.gameBoard.currentTotalVisible = ", gameLogic!.gameBoard.currentTotalVisible)
        /// print("currentTotalVisible = ", gameLogic!.gameBoard.currentTotalVisible)
        
        // choose tile
        let randRow: Int = Int(arc4random_uniform(UInt32(numOfRow)))
        let randCol: Int = Int(arc4random_uniform(UInt32(numOfCol)))
        
        let idx: IndexPath = [0, randRow * numOfCol + randCol]
        
        let cell : CustomCell = collectionView.cellForItem(at: idx) as! CustomCell
        
        if gameLogic?.gameBoard.tailMatrix[randRow * numOfCol + randCol].isVisible == false {
            
            let randIndex: Int = Int(arc4random_uniform(UInt32(images.count)))
            
            if (gameLogic?.gameBoard.currentTotalVisible)! < (gameLogic?.gameBoard.maxTotalVisible)! {
                
                switch randIndex {
                case 0:
                    if (gameLogic?.gameBoard.currentGood)! < (gameLogic?.gameBoard.maxGood)!{
                        gameLogic?.gameBoard.tailMatrix[randRow * numOfCol + randCol].visible(type: eType.good)
                        cell.myImage.image = UIImage(named: images[0])
                        
                        gameLogic?.gameBoard.currentTotalVisible += 1
                        gameLogic?.gameBoard.currentGood += 1
                    }
                case 1:
                    if (gameLogic?.gameBoard.currentBad)! < (gameLogic?.gameBoard.maxBad)!{
                        gameLogic?.gameBoard.tailMatrix[randRow * numOfCol + randCol].visible(type: eType.bad)
                        cell.myImage.image = UIImage(named: images[1])
                        
                        gameLogic?.gameBoard.currentTotalVisible += 1
                        gameLogic?.gameBoard.currentBad += 1
                    }
                case 2:
                    totalLife += 1
                    if (gameLogic?.gameBoard.currentLife)! < (gameLogic?.gameBoard.maxCurrentLife)! && (totalLife <= (gameLogic?.gameBoard.maxLife)!){
                        gameLogic?.gameBoard.tailMatrix[randRow * numOfCol + randCol].visible(type: eType.life)
                        cell.myImage.image = UIImage(named: images[2])
                        
                        gameLogic?.gameBoard.currentTotalVisible += 1
                        gameLogic?.gameBoard.currentLife += 1
                    }
                default:
                    break
                }
            }
        }
    }
    
    
    func won() {
        
        performSegue(withIdentifier: "gameToGameOverSegue", sender: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("timer invalitade")
        timer?.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Actions
    @IBAction func backClicked(_ sender: Any) {
        performSegue(withIdentifier: "gameToMainSegue", sender: self)
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
        
        print("Item pressed is: " , indexPath.row)
        
        if gameLogic?.gameBoard.tailMatrix[indexPath.row].isVisible == true {
            
            let cell : CustomCell = collectionView.cellForItem(at: indexPath) as! CustomCell
            
            switch gameLogic?.gameBoard.tailMatrix[indexPath.row].typeOfTile {
            case eType.good?:
                
                score += 1
                scoreLabel.text = String(score)
                
                gameLogic?.gameBoard.currentGood -= 1
                
            case eType.bad?:
                
                if (gameLogic?.life)! > 1 {
                    gameLogic?.life -= 1
                    lifeLabel.text = String(describing: gameLogic!.life)
                    gameLogic?.gameBoard.currentBad -= 1
                } else {
                    won() /// change name to finish
                }
                
            case eType.life?:
                
                gameLogic?.life += 1
                lifeLabel.text = String(describing: gameLogic!.life)
                gameLogic?.gameBoard.currentLife -= 1
                
            default:
                break
            }
            
            cell.myImage.image = nil
            gameLogic?.gameBoard.tailMatrix[indexPath.row].invisible()
            gameLogic?.gameBoard.currentTotalVisible -= 1
        }
    }
}

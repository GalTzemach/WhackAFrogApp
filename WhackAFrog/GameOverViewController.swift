//
//  GameOverViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    let mUserDefaults = UserDefaults.standard
    var newRecordIsView: Bool = false
    
    var recordArr: [Record] = [Record]()
    var score: Int = 0
    
    // outlets
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        score = mUserDefaults.integer(forKey: "recentScore")
        scoreLabel.text = String(score)
        
        // update recordArr from userDefault
        let recordArrData = mUserDefaults.data(forKey: "recordArr")
        
        if recordArrData != nil {
            recordArr = NSKeyedUnarchiver.unarchiveObject(with: recordArrData!) as? [Record] ?? [Record]()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /// code
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if recordIsTopTen() && !newRecordIsView {
            performSegue(withIdentifier: "gameOverToNewRecordSegue", sender: self)
            newRecordIsView = true
        }
    }
    
    func recordIsTopTen() -> Bool {
        
        var isTopTen = false
        
        if recordArr.count < 10  {
            isTopTen = true
        } else {
            if score > recordArr[recordArr.count - 1].score {
                isTopTen = true
            }
        }
        return isTopTen && score > 0;
    }
    

    // actions - (buttons clicked)
    @IBAction func newGameClicked(_ sender: Any) {
        
        ///self.presentingViewController?.beginAppearanceTransition(false, animated: true)
        
        self.dismiss(animated: true, completion: nil)
        
        ///performSegue(withIdentifier: "gameOverToGameSegue", sender: self)
        
        
        /// self.dismiss(animated: true, completion: nil)
        /// UIApplication.shared.keyWindow?.rootViewController = storyboard!.instantiateViewController(withIdentifier: "GameViewController")
    }
    
    @IBAction func recordTableClicked(_ sender: Any) {        
        performSegue(withIdentifier: "gameOverToRecordTableSegue", sender: self)
    }
    
    
    @IBAction func exitClicked(_ sender: Any) {
        exit(0)
    }
}

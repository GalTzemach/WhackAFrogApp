//
//  GameOverViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // Actions
    
    @IBAction func newGameClicked(_ sender: Any) {
        performSegue(withIdentifier: "gameOverToGameSegue", sender: self)
    }
    
    @IBAction func exitClicked(_ sender: Any) {
        exit(0)
    }
}

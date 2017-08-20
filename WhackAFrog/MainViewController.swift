//
//  MainViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startGameClicked(_ sender: Any) {
        performSegue(withIdentifier: "mainToGameSegue", sender: self)
    
    }
    
    @IBAction func helpClicked(_ sender: Any) {
        performSegue(withIdentifier: "mainToHelpSegue", sender: self)
    }

    @IBAction func exitClicked(_ sender: Any) {
       
        exit(0)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

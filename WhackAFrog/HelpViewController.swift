//
//  HelpViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    var helpDescription: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // actions - (buttons clicked)
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

//
//  HelpViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    // outlets
    @IBOutlet weak var textView: UITextView!
    
    var helpDescription: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.backgroundColor = UIColor.clear
        
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

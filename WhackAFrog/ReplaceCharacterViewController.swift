//
//  ReplaceCharacterViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 04/09/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit

class ReplaceCharacterViewController: UIViewController {

    // outlets
    /// delete Title
    @IBOutlet weak var option1Title: UIButton!
    @IBOutlet weak var option2Title: UIButton!
    @IBOutlet weak var selectLabel: UILabel!
    
    var typeCharacter: Int = 1
    
    let mUserDefaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        selectLabel.text = selectLabel.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // actions - (buttons clicked)
    @IBAction func option1Clicked(_ sender: Any) {
        typeCharacter = 1
        selectLabel.text = "Frog"
        selectLabel.textColor = UIColor.blue
        /// change color & size
    }
    
    @IBAction func option2Clicked(_ sender: Any) {
        typeCharacter = 2
        selectLabel.text = "Basic"
        selectLabel.textColor = UIColor.blue
        /// change color & size
    }
    
    @IBAction func chooseClicked(_ sender: Any) {
        
        mUserDefaults.set(typeCharacter, forKey: "typeCharacter")
        self.dismiss(animated: true, completion: nil)
        
        ///performSegue(withIdentifier: "replaceCharacterToMainSegue", sender: self)
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

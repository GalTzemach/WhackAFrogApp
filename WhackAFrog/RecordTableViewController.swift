//
//  RecordTableViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 04/09/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit

class RecordTableViewController: UIViewController {

    var minimalScore: Int = 0 /// change 0 to real value
    /// var recordArr = [Record]()

    
    // outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // actions - (buttons clicked)
    @IBAction func showMapClicked(_ sender: Any) {
        performSegue(withIdentifier: "recordTableToRecordMapSegue", sender: self)
        //self.present(RecordMapViewController(), animated: true, completion: nil)
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

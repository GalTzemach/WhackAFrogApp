//
//  RecordTableViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 04/09/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit
import CoreLocation

class RecordTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let mUserDefaults = UserDefaults.standard
    var recordArr: [Record] = [Record]()
    
    /// var minimalScore: Int = 0 /// change 0 to real value
    /// var recordArr = [Record]()

    
    // outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customTableViewCell
        
        cell.nameLabel.text = recordArr[indexPath.row].name
        cell.scoreLabel.text = String(recordArr[indexPath.row].score)
        cell.locationImage.image = #imageLiteral(resourceName: "location")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let tempLocation = CLLocationCoordinate2DMake(Double(recordArr[indexPath.row].latitude)!, Double(recordArr[indexPath.row].longitude)!)
        
        mUserDefaults.set(Double(recordArr[indexPath.row].latitude), forKey: "latitudeToShow")
        mUserDefaults.set(Double(recordArr[indexPath.row].longitude), forKey: "longitudeToShow")
        mUserDefaults.set(recordArr[indexPath.row].name, forKey: "nameToShow")
        mUserDefaults.set(recordArr[indexPath.row].score, forKey: "scoreToShow")
        
        performSegue(withIdentifier: "recordTableToRecordMapSegue", sender: self)
    }
    
    
    // actions - (buttons clicked)
    @IBAction func backClicked(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
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

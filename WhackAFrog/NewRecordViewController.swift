//
//  NewRecordViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 06/09/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit
import CoreLocation

class NewRecordViewController: UIViewController, CLLocationManagerDelegate {

    let mUserDefaults = UserDefaults.standard
    
    let LocationManager = CLLocationManager()
    var myLocation: CLLocation = CLLocation.init()
    
    var recordArr: [Record] = [Record]()
    var score: Int = 0
    
    // outlets
    @IBOutlet weak var nameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // location
        LocationManager.delegate = self
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.startUpdatingLocation()
        
        // update recordArr from userDefault
        let recordArrData = mUserDefaults.data(forKey: "recordArr")
        recordArr = NSKeyedUnarchiver.unarchiveObject(with: recordArrData!) as? [Record] ?? [Record]()
        
        score = mUserDefaults.integer(forKey: "recentScore")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        myLocation = locations[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // actions - (buttons clicked)
    @IBAction func saveClicked(_ sender: Any) {
        
        let tempRecord = Record(score: score, name: nameTextField.text!, latitude: String(myLocation.coordinate.latitude), longitude: String(myLocation.coordinate.longitude))
        
        updateRecordArr(recordToAdd: tempRecord)
        
        // save update arr to userDefault
        let recordData = NSKeyedArchiver.archivedData(withRootObject: recordArr)
        mUserDefaults.set(recordData, forKey: "recordArr")
        
        for record in recordArr {
            record.show()
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateRecordArr(recordToAdd: Record) {
        
        var recordIsAdded = false
        
        if recordArr.count == 0 {
            
            recordArr.append(recordToAdd)
            recordIsAdded = true
            
        } else {
            
            for i in 0...recordArr.count - 1 {
                if score > recordArr[i].score {
                    recordArr.insert(recordToAdd, at: i)
                    recordIsAdded = true
                    break
                }
            }
        }
        
        if recordIsAdded == false {
            recordArr.insert(recordToAdd, at: recordArr.count)
        }
        
        if recordArr.count == 11 {
            recordArr.remove(at: 10)
        }
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

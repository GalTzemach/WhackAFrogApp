//
//  RecordMapViewController.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 06/09/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class RecordMapViewController: UIViewController {

    let mUserDefaults = UserDefaults.standard
    
    /// var locationToShow: CLLocationCoordinate2D?
    
    // outlets
    @IBOutlet weak var map: MKMapView!    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeLocation = CLLocationCoordinate2D(latitude: 31.753879, longitude: 34.988457)
        
        let locationToShow = CLLocationCoordinate2DMake(mUserDefaults.double(forKey: "latitudeToShow"), mUserDefaults.double(forKey: "longitudeToShow"))
        
        print(locationToShow)
        print(homeLocation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: locationToShow, span: span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationToShow
        annotation.title = mUserDefaults.object(forKey: "nameToShow") as? String ?? ""
        annotation.subtitle = "Score: " + String(mUserDefaults.integer(forKey: "scoreToShow"))
        
        map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

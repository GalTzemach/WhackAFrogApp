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

    /// var location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 31.753879, longitude: 34.988457)

    
    // outlets
    
    @IBOutlet weak var map: MKMapView!    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeLocation = CLLocationCoordinate2D(latitude: 31.753879, longitude: 34.988457)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: homeLocation, span: span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = homeLocation
        annotation.title = "Home"
        annotation.subtitle = "Hahaluzim 12"
        
        map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

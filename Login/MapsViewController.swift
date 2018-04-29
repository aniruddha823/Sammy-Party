//
//  MapsViewController.swift
//  Login
//
//  Created by Dominic on 4/27/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit
import MapKit

class MapsViewController: UIViewController {
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = "One Washington Square San Jose, CA 95192"
        let activitySearch = MKLocalSearch(request: searchRequest)
        activitySearch.start { (response, error) in
            if(response == nil){
                print("error")
            }
            else{
                let annotations = self.myMapView.annotations
                self.myMapView.removeAnnotations(annotations)
                
                
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                let annotation = MKPointAnnotation()
                annotation.title = "SJSU"
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.myMapView.addAnnotation(annotation)
                
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!,longitude!)
                let span = MKCoordinateSpanMake(0.01, 0.01)
                let region = MKCoordinateRegionMake(coordinate, span)
                self.myMapView.setRegion(region, animated: true)
                
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

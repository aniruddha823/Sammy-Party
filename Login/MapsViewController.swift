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
    //Mapview instance
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //create search request
        let searchRequest = MKLocalSearchRequest()
        //temperorary query
        searchRequest.naturalLanguageQuery = "One Washington Square San Jose, CA 95192"
        
        let activitySearch = MKLocalSearch(request: searchRequest)
        //Search the string
        activitySearch.start { (response, error) in
            if(response == nil){
                print("error")
            }
            else{
                //create pin annotation
                let annotations = self.myMapView.annotations
                self.myMapView.removeAnnotations(annotations)
                
                
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                let annotation = MKPointAnnotation()
                //sjsu is pinned anotation
                annotation.title = "SJSU"
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.myMapView.addAnnotation(annotation)
                //set coordinate
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!,longitude!)
                let span = MKCoordinateSpanMake(0.01, 0.01)
                let region = MKCoordinateRegionMake(coordinate, span)
                //display map
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

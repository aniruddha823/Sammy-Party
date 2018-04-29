//
//  MapViewController.swift
//  Login
//
//  Created by Aniruddha Prabhu on 4/27/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // This is the array array of parties to
    // be processed for the map
    var parties : [Party] = [Party]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = CLLocationCoordinate2DMake(37.33275, -121.879700)
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(location, 1500, 1500), animated: true)
        mapView.isZoomEnabled = true
        
        getPartyLocations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getPartyLocations(){
        
        // This sets the initial region in which to look for
        // the locations of parties
        var region = MKCoordinateRegion()
        region.center = CLLocationCoordinate2D(latitude: 37.335689, longitude: -121.881570)
        
        // This loop grabs each party from the array,
        // searches for a location based on the ones
        // users provided, and generates a pin
        // to add to the map view.
        for loc in parties {
            var str = loc.partyLocation
            
            // The location search generates a variety of map
            // items, but we only want the first item as a result
            let request = MKLocalSearchRequest()
            request.naturalLanguageQuery = str
            request.region = region
            
            let search = MKLocalSearch(request: request)
            search.start(completionHandler: { (response, error) in
                
                guard let response = response else {
                    return
                }
                
                var pinloc = response.mapItems[0].placemark.coordinate
                
                // Generates the pin for the map
                let pin = PinAnnotation(title: loc.partyName, subtitle: loc.partyOrganizer, coordinate: pinloc)
                
                self.mapView.addAnnotation(pin)
            })
            
            print(str)
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
}

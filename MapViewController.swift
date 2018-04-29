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
        var region = MKCoordinateRegion()
        region.center = CLLocationCoordinate2D(latitude: 37.335689, longitude: -121.881570)
        
        for loc in parties {
            let str = loc.partyLocation
            
            let request = MKLocalSearchRequest()
            request.naturalLanguageQuery = str
            request.region = region
            
            let search = MKLocalSearch(request: request)
            search.start(completionHandler: { (response, error) in
                
                guard let response = response else {
                    return
                }
                
                let pinloc = response.mapItems[0].placemark.coordinate
                let pin = PinAnnotation(title: loc.partyName, subtitle: loc.partyOrganizer, coordinate: pinloc)
                
                self.mapView.addAnnotation(pin)
            })
            
            print(str)
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    // 37.332759, -121.879700
}

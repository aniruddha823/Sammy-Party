import MapKit

// This class is used to help generate the pin & annotation
// to add to a MapKit view
class PinAnnotation : NSObject, MKAnnotation{
    var title : String?
    var subtitle : String?
    var coordinate : CLLocationCoordinate2D
    
    init(title : String, subtitle : String, coordinate : CLLocationCoordinate2D){
        
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
    }
}

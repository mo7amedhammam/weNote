//
//  openedNoteVC.swift
//  weNote
//
//  Created by Muhammad Hammam on 09/02/2021.
//

import UIKit
import MapKit

class openedNoteVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.loadLocation()
    }
    
    @IBOutlet weak var mapKitOutlet: MKMapView!
    
    func loadLocation ()  {
            let latitude = "51.50998"
            let longitude = "-0.1337"
        
        let location = CLLocationCoordinate2D(latitude: Double(latitude) ?? 0, longitude: Double(longitude) ?? 0)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.mapKitOutlet.setRegion(region, animated: true)
        
        let pin = customPin(location: location, pinTitle: "Note Name", pinSubTitle: "some more setails")
        self.mapKitOutlet.addAnnotation(pin)
        
    }

}

class customPin: NSObject,MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(location:CLLocationCoordinate2D,pinTitle:String,pinSubTitle:String) {
        self.coordinate=location
        self.title=pinTitle
        self.subtitle=pinSubTitle
    }
}

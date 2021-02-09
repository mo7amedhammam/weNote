//
//  notesTable.swift
//  weNote
//
//  Created by Muhammad Hammam on 06/02/2021.
//

import UIKit
import CoreLocation

class notesTable: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOutlet.dequeue() as notecell
        cell.accessoryType = .disclosureIndicator
        cell.noteTitle.text = "note"
        cell.notesubtitle.text = "this is the body of the note"
        return cell
    }
    
    
    @IBOutlet weak var tableOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true

        // Do any additional setup after loading the view.
    tablesetup()
        
    }
    
    
    func tablesetup(){
        tableOutlet.delegate = self
        tableOutlet.dataSource = self
        tableOutlet.registerCellNib(cellClass: notecell.self)
        tableOutlet.estimatedRowHeight = 77
        
    }

    @IBAction func addNoteButton(_ sender: Any) {
//        let cardVC = addNoteCard()
        let cardVC = (self.storyboard?.instantiateViewController(withIdentifier: "addNoteCard")) as! addNoteCard
        self.present(cardVC, animated: true, completion: nil)
 
    }
    
    @IBAction func newnoteBu(_ sender: Any) {
        addNewNoteAlert()
    }
    
    func addNewNoteAlert(){
        let alert = UIAlertController(title: "Tell Me Your Note", message: "", preferredStyle: .alert)
        
        
        alert.addTextField(configurationHandler: { TitleTF in
            TitleTF.placeholder = "Note name..."
            TitleTF.textAlignment = .center
        })
        
        alert.addTextField(configurationHandler: { BodyTF in
            BodyTF.placeholder = "What's your note datails..."
        })
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action) in
            let noteTitle = alert.textFields?.first?.text
            let noteBody = alert.textFields?.last?.text
            print(noteTitle!)
            print(noteBody!)
            
            self.determineMyCurrentLocation()

        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Mark: current location
    var locationManager:CLLocationManager!
    func determineMyCurrentLocation() {
           locationManager = CLLocationManager()
           locationManager.delegate = self
           locationManager.desiredAccuracy = kCLLocationAccuracyBest
           locationManager.requestAlwaysAuthorization()
           
           if CLLocationManager.locationServicesEnabled() {
               locationManager.startUpdatingLocation()
//               locationManager.startUpdatingHeading()
           }else{
        displayerror(errorBody: "Enable location services")
           }
        
        }
       
       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           let userLocation:CLLocation = locations[0] as CLLocation
             
//            Call stopUpdatingLocation() to stop listening for location updates,
           // other wise this function will be called every time when user location changes.
           
           manager.stopUpdatingLocation()
           
           print("user latitude = \(userLocation.coordinate.latitude)")
           print("user longitude = \(userLocation.coordinate.longitude)")
       }
       
       func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
       {
        displayerror(errorBody: "Enable location services")
           print("Error \(error)")
       }
    
    
    
    
    //    Dismiss alert  function && Error
    func displayerror(errorBody : String){
        let alert = UIAlertController.init(title: "Error", message: errorBody, preferredStyle: .alert)
        let dismissbutton = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        alert.addAction(dismissbutton)
        self.present(alert, animated: true, completion: nil)
        
    }

}

//********** current lication **********//

//    //Working Ok   ////////////////////
//    func getCoordinatesFromPlace(place: String){
//
//        let geoCoder = CLGeocoder()
//        geoCoder.geocodeAddressString(place) { (placemarks, error) in
//            guard
//                let placemarks = placemarks,
//                let location = placemarks.first?.location?.coordinate
//            else {
//                // handle no location found
//                return
//            }
//            print(location.latitude)
//            print(location.longitude)
//
//        }
//    }




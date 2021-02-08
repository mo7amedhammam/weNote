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
            self.NoteLocation()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func NoteLocation(){
        let locationManager = CLLocationManager()
        let longtude:Double?
        let latitude:Double?
        let DateCreated:Date
        let readableDateCreated:String
        locationManager.requestAlwaysAuthorization()
        locationManager.startMonitoringVisits()
        locationManager.delegate = self
        
        longtude = CLLocation().coordinate.longitude
        latitude = CLLocation().coordinate.latitude
//        DateCreated = CLLocation()

        //current location
            print("current location latitude is :", longtude!)
            print("current location longitude is :", latitude!)
                
    }
    
    

}


extension AppDelegate: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
    // create CLLocation from the coordinates of CLVisit
    let clLocation = CLLocation(latitude: visit.coordinate.latitude, longitude: visit.coordinate.longitude)

    // Get location description
  }

//    func newVisitReceived(_ visit: CLVisit, description: String) {
//  //    let location = Location(visit: visit, descriptionString: description)
//  //
//  //    // Save location to disk
//  //  }//
}


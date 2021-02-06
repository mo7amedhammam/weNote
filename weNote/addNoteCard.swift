//
//  addNoteCard.swift
//  weNote
//
//  Created by Muhammad Hammam on 06/02/2021.
//

import UIKit

class addNoteCard: UIViewController {

    
    @IBOutlet weak var containerCard: UIView!
    @IBOutlet weak var newNoteTitle: UITextField!
    @IBOutlet weak var newNoteBody: UITextField!

    @IBOutlet var buttons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
decorate()
        // Do any additional setup after loading the view.
    }
    
    func addTheNote()  {
        let title = newNoteTitle.text
        let body = newNoteBody.text
//        print(title!)  // OK
//        metaDate() // not yet
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
//    func metaData()  {
//
//    }
    
    func decorate() {
        self.containerCard.layer.cornerRadius = 20
        for b in buttons{
            b.layer.cornerRadius = 12
        }
        newNoteBody.layer.cornerRadius = 9
        newNoteTitle.layer.cornerRadius = 9
    }
    @IBAction func addNoteBu(_ sender: Any) {
        
        addTheNote()
//        let nodeTitle = newNoteTitle.text
//        let noteBody = newNoteBody.text

    }
    
    @IBAction func cancelBu(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    


}

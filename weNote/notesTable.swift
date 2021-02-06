//
//  notesTable.swift
//  weNote
//
//  Created by Muhammad Hammam on 06/02/2021.
//

import UIKit

class notesTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
    
    
    

}

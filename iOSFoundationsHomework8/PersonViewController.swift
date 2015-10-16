//
//  PersonViewController.swift
//  iOSFoundationsHomework8
//
//  Created by Regular User on 10/10/15.
//  Copyright © 2015 Lynn Kuhlman. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var personTableView: UITableView!
   
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personTableView.dataSource = self
        
       if let peopleFromArchive = self.loadFromArchive() {
           people = peopleFromArchive
        } else {
        
            
            let fredImage = UIImage(named: "fred_flinstone")!
            let fred = Person(fName: "Fred", lName: "Flintstone", photo: fredImage)
            
            let bettyImage = UIImage(named: "betty_ruble.jpg")
            let betty = Person(fName: "Betty", lName: "Rubble", photo: bettyImage!)
            
            let barneyImage = UIImage(named: "barney_rubble.jpg")
            let barney = Person(fName: "Barney", lName: "Rubble", photo: barneyImage!)
            
            let wilmaImage = UIImage(named: "wilma_flinstone.jpg")
            let wilma = Person(fName: "Wilma", lName: "Flintstone", photo: wilmaImage!)
            
            let dinoImage = UIImage(named: "dino_flintstone.jpg")
            let dino = Person(fName: "Dino", lName: "Flintstone", photo: dinoImage!)
            
            people.append(fred)
            people.append(betty)
            people.append(barney)
            people.append(wilma)
            people.append(dino)
        
           
        }
        
        
        
        //      for var i = 0; i < people.count; i++ {
        //        print("loop \(i)")
        //        let person = people[i]
        //      }
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        personTableView.reloadData()
        saveToArchive()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("segue fired!")
        if segue.identifier == "ShowPersonDetail" {
            
            
            if let personDetailViewController = segue.destinationViewController as? PersonDetailViewController {
                
                if let selectedIndexPath = personTableView.indexPathForSelectedRow {
                    let selectedRow = selectedIndexPath.row
                    //let selectedName = names[selectedRow]
                    let chosenPerson = people[selectedRow]
                    
                    personDetailViewController.selectedPerson = chosenPerson
                    
                    //      destinationViewController.selectedName = selectedName
                }
            }
        } else if segue.identifier == "MyOtherSegue" {
            //this code would customize based on going to a different view controller
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return people.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //part 1 - dequeue the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath: indexPath) as! PersonTableViewCell
        
        //part 2 - configure the cell
        let person = people[indexPath.row]
        
        cell.firstNameLabel.text = person.firstName
        cell.lastNameLabel.text = person.lastName
        cell.imgView.image = person.image
        
        //part 3 - return the cell to the table view, because it needs it to show it
        
        return cell
    }
    
    func saveToArchive() {
        if let documentPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last {
            
            NSKeyedArchiver.archiveRootObject(people, toFile: documentPath + "/archive")
        }
    }
    
    func loadFromArchive() -> [Person]? {
        if let documentPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last {
            
            if let people = NSKeyedUnarchiver.unarchiveObjectWithFile(documentPath + "/archive") as? [Person] {
                return people
            }
        }
        return nil
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
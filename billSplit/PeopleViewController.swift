//
//  PeopleViewController.swift
//  billSplit
//
//  Created by Cindy Zhou on 6/29/17.
//  Copyright © 2017 Cindy Zhou. All rights reserved.
//

import UIKit

protocol CellDelegator{
    func segueFromCell(_ dataObject: AnyObject)
}
class PeopleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CellDelegator, UITextFieldDelegate {
    
    internal func segueFromCell(_ dataObject: AnyObject) {
        self.performSegue(withIdentifier: "personInformation", sender: dataObject)
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return information!.numberofMembers
    }
    var personNumber = 1
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonCell
        cell.delegate = self
       // cell.personLabel.text = "person" + String(personNumber)
        people.append(Person("person" + String(personNumber)))
        cell.person = people[personNumber - 1]
        
        personNumber += 1

        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var people: Array<Person> = []
    
    
    
    var information : GroupInformation? {
        didSet{
            print("information is set")
            
        }
    }
    
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //passes information on which user to display information with detail
        if segue.identifier == "personInformation"{
            //the segue is to a navigation controller, but the view that is displayed 
            // is the visibleViewController
            if let destination = segue.destination as? UINavigationController {
                if let peopleView = destination.visibleViewController as? DetailInfoViewController{
                    if let profile = (sender as? Person){
                        peopleView.person = profile
                    }
                }
            }
        } else if segue.identifier == "popUp"{
            if let destination = segue.destination as? PopUpViewController{
                destination.people = people
            }
        }
        
        
        
    }
 

}

class PersonCell: UITableViewCell{
    var delegate:CellDelegator!
    var person: Person? {
        didSet{
            personLabel.text = person?.name
            let amountText = String(format:"%.2f", (person?.amount)!)
            amountLabel.text = amountText
        
            
        }
    }
    
    @IBOutlet weak var personLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if(self.delegate != nil){
            self.delegate.segueFromCell(person!) // this links up so you can get data from the main view controller
        }
        
    }
    
    
}

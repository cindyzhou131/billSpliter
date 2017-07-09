//
//  personInformationViewController.swift
//  billSplit
//
//  Created by Cindy Zhou on 6/30/17.
//  Copyright © 2017 Cindy Zhou. All rights reserved.
//

import UIKit

class DetailInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
      //  nameLabel.text = person?.name!
//        self.navigationItem.title = person?.name!
//         self.navigationItem.hidesBackButton = false //HOW TO FREAKING OPERATE THE NAVIGATION CONTROLLER?!?!
        foodTableView.delegate = self
        foodTableView.dataSource = self
        totalLabel.text = "Total: $" + String(format:"%.2f", (person?.amount)!)
        totalLabel.sizeToFit()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    
    var person: Person?{
        didSet{
            self.navigationItem.title = person?.name!
            print("titleset?")
        }
    }
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var foodTableView: UITableView!
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return person?.foods.count ?? 0
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell" )
        let food = person?.foods[indexPath.row]
        cell?.textLabel?.text = food?.name
        cell?.detailTextLabel?.text = String(format:"%.2f", (food?.ogprice)!) //format helps get rid of optional
        
        return cell!
    }
    
    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            person?.amount -= (person?.foods[indexPath.row].ogprice)!
            person?.foods.remove(at: indexPath.row)
        
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

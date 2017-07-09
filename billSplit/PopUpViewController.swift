//
//  PopUpViewController.swift
//  billSplit
//
//  Created by Cindy Zhou on 7/5/17.
//  Copyright © 2017 Cindy Zhou. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var people: Array<Person> = []
    
    
    @IBOutlet weak var peopletableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        peopletableView.delegate = self
        peopletableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return people.count
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell")
        if tableView == peopletableView{
            cell?.textLabel?.text = people[indexPath.row].name
        }else{
            cell?.textLabel?.text = selectedPeople[indexPath.row].name
        }
        return cell!
    }
    @IBOutlet weak var selectedTableView: UITableViewCell!
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPeople.append(people[indexPath.row])
        people.remove(at: indexPath.row)
    
        print(selectedPeople.count)
        
    }
    
    var selectedPeople: Array<Person> = []


 


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


/** UIPICKER Example
 UIPickerViewDelegate, UIPickerViewDataSource {
 
 var people: Array<Person> = []
 
 @IBOutlet weak var pickerView: UIPickerView!
 
 override func viewDidLoad() {
 super.viewDidLoad()
 pickerView.delegate = self
 pickerView.dataSource = self
 }
 
 public func numberOfComponents(in pickerView: UIPickerView) -> Int{
 return 1
 
 }
 
 
 // returns the # of rows in each component..
 public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
 return people.count
 }
 
 
 
 public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
 return people[row].name
 }
**/

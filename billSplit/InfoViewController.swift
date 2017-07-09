//
//  InfoViewController.swift
//  billSplit
//
//  Created by Cindy Zhou on 6/29/17.
//  Copyright © 2017 Cindy Zhou. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        numPeopleTextField.delegate = self
        taxRateTextField.delegate = self
        tipRateTextField.delegate = self
//        
//        numPeopleTextField.tag = 0
//        taxRateTextField.tag = 1
//        tipRateTextField.tag = 2
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var information : GroupInformation = GroupInformation()
    
    
    @IBOutlet weak var numPeopleTextField: UITextField!
    
    @IBOutlet weak var taxRateTextField: UITextField!
    
    @IBOutlet weak var tipRateTextField: UITextField!
    
    
    @IBAction func Continue(_ sender: UIButton) {
        
        information.numberofMembers = Int(numPeopleTextField.text!) ?? 0
        information.tipRate = Double(tipRateTextField.text!) ?? 0
        information.taxRate = Double(taxRateTextField.text!) ?? 0
    }
    
    //as? String ?? "empty"
//    func textFieldDidEndEditing(_ textField: UITextField){
//        if let input: String  = textField.text {
//            if textField.tag == 0 {
//                information.numberofMembers = (Int(input))!
//            }else if textField.tag == 1{
//                information.taxRate = Double(input)!
//            }else{
//                information.tipRate = Double(input)!
//            }
//
//        }
//    }
//    
//
//    @IBAction func numPeopleTextField(_ sender: UITextField) {
//        
//        information.numberofMembers =
//    }
//    
//    
//    @IBAction func taxRateTextField(_ sender: UITextField) {
//    }
//    
//    
//    @IBAction func tipRateTextField(_ sender: UITextField) {
//    }
//    
    
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "peopleViewer"){
            if let destination = segue.destination as? PeopleViewController {
                destination.information = self.information
                print("segue was prepared")
            }
        }
        
    }
 

}

//
//  PersonDetailViewController.swift
//  iOSFoundationsHomework8
//
//  Created by Regular User on 10/11/15.
//  Copyright © 2015 Lynn Kuhlman. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate {

    var selectedName = "None"
    var selectedPerson: Person!
    //    var firstNameText = "None"
    //   var lastNameText = "None"
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        
        firstNameTextField.text = selectedPerson.firstName
        lastNameTextField.text = selectedPerson.lastName
        imageView.image = selectedPerson.image
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if let firstNameText = firstNameTextField.text {
            selectedPerson.firstName = firstNameText
        }
        
        if let lastNameText = lastNameTextField.text {
            selectedPerson.lastName = lastNameText
        }
        
        textField.resignFirstResponder()
        return true
        
    }
    
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

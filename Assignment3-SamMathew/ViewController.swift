//
//  ViewController.swift
//  Assignment3-SamMathew
//
//  Created by Sam Mathew on 2023-09-26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        successLabel.isHidden = true
        errorLabel.isHidden = true
        
        // to make placeholder and input values center aligned as per question
        firstName.textAlignment = .center
        lastName.textAlignment = .center
        countryName.textAlignment = .center
        age.textAlignment = .center
    }

    @IBOutlet weak var firstName: UITextField!
 
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var countryName: UITextField!
    
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var successLabel: UILabel!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var checkResult = "" // used while input fields are validated to submit
    
    @IBAction func clearButton(_ sender: Any) { // this button clears all fields
        clear()
        textView.text = ""
        
        successLabel.isHidden = true
        errorLabel.isHidden = true
    }
    
    @IBAction func addButton(_ sender: Any){ // to add input field values to text view box
        
        guard let fName = firstName.text,
              let lName = lastName.text,
              let cName = countryName.text,
              let ageValue = age.text,
              !fName.isEmpty, !lName.isEmpty, !cName.isEmpty, !ageValue.isEmpty,
              let ageNum = Int(ageValue)
              
        else {
            incompleteData()
            return
        }
        
        let inputText = "\nFirst Name: \(fName) \(lName)\nCountry: \(cName)\nAge: \(ageNum)\n"
        textView.text += inputText
        checkResult = "full" // if value is non empty, Submit is successful
        
        clear() //clear values from input fields once added.
    }
    
    @IBAction func submitButton(_ sender: Any) {
        if checkResult.isEmpty {
            errorLabel.isHidden = false
            successLabel.isHidden = true
        }
        
        else {
            successLabel.isHidden = false
            errorLabel.isHidden = true
        }
        
        checkResult = ""
        textView.text = "" //clear text display after submitting.
    }
    
    func clear() { // clear function to clear input field values
        firstName.text = ""
        lastName.text = ""
        countryName.text = ""
        age.text = ""
    }
    
    func incompleteData() { // function used if input fields are incomplete. add field values to text view box even if incomplete
        if let fName = firstName.text,
        let lName = lastName.text,
        let cName = countryName.text,
        let ageValue = age.text {
        let inputText = "\nFirst Name: \(fName) \(lName)\nCountry: \(cName)\nAge: \(ageValue)\n"
        textView.text += inputText
        }
        else {
            //Else condition not needed.
        }
    }
}


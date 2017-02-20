//
//  ViewController.swift
//  apiPrac
//
//  Created by Alex Votry on 2/19/17.
//  Copyright © 2017 Alex Votry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //MARK: Properties

    @IBOutlet weak var criteriaLabel: UILabel!
    @IBOutlet weak var criteriaTextField: UITextField!

    @IBOutlet weak var pickerView: UIPickerView!



    var criter: Criteria?
    var area: String?


    var crimes = ["Threats", "Auto Theft", "Fight", "Suspicious Circumstances", "Hit & Run", "Theft", "Property", "Fraud", "ACC", "Disturbance", "Burgulary", "Traffic", "Shoplift", "Robbery", "Narcotics", "ASLT"]

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
        
        
       
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return crimes.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        criteriaLabel.text = crimes[row]
        let crit = Criteria()
        crit.crime = crimes[row]
        crit.location = "here"
        criter = crit
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return crimes[row]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    @IBAction func crimeButton(_ sender: UIButton) {
      // crit?.crime = criteriaLabel.text
      guard
          let crit = criter,
          let crime = crit.crime,
          let location = crit.location
          else {
            print("fubbed up")
            return
        }

      print("crit: \(crime)")
      print("loc: \(location)")

    }
}

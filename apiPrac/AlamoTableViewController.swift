//
//  AlamoTableViewController.swift
//  apiPrac
//
//  Created by Alex Votry on 2/19/17.
//  Copyright © 2017 Alex Votry. All rights reserved.
//

import UIKit
import Alamofire


class AlamoTableViewController: UITableViewController {

    var crimeData:Array < String > = Array < String >()
    var spdCalls: [SpdCall]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCrimeData("Stupid")
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crimeData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alamoCell", for: indexPath)

        cell.textLabel?.text = crimeData[indexPath.row]

        return cell
    }


    func getCrimeData(_ criteria: String) {
    Alamofire.request("https://data.seattle.gov/resource/pu5n-trf4.json").responseJSON { response in
      if let JSON = response.result.value {
        self.extractData(JSON, criteria)
      }
    }
  }

    func extractData(_ data: Any, _ criteria: String) {
        print(criteria)
    if let value = data as? NSArray {

       for i in 0 ..< value.count {

         if let crime = value[i] as? NSDictionary
         {
           if let description = crime["initial_type_description"] as? String
           {
             if let location = crime["hundred_block_location"] as? String
             {
               crimeData.append("description: \(description), location: \(location)")
             }
           }
         }
       }
    }
    DispatchQueue.main.async(execute: {self.do_table_refresh()})
  }
  func do_table_refresh()
  {
      self.tableView.reloadData()
  }
}

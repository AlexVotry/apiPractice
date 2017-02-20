//
//  ViewController.swift
//  apiPrac
//
//  Created by Alex Votry on 2/19/17.
//  Copyright © 2017 Alex Votry. All rights reserved.

import UIKit
import Alamofire


class TableController: UITableViewController {
    
    var TableData:Array< String > = Array < String >()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get_data_from_url("http://www.kaleidosblog.com/tutorial/tutorial.json")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = TableData[indexPath.row]
        
        return cell
    }
    
    func get_data_from_url(_ link:String)
    {
        let url:URL = URL(string: link)!
        let session = URLSession.shared
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            ( data, response, error) in
            guard
                let _:Data = data,
                let _:URLResponse = response,
                error == nil
                else {
                    print("data is messed up")
                    return
            }
            self.extract_json(data!)
        })
        task.resume()
    }
    
    
    func extract_json(_ data: Data)
    {
        let json: Any?
        
        do {
            json = try JSONSerialization.jsonObject(with: data, options: [])
        } catch {
            print("json could not be read")
            return
        }
        
        guard let data_list = json as? NSArray else
        {
            return
        }
        
        if let countries_list = json as? NSArray
        {
            for i in 0 ..< data_list.count
            {
                
                if let country_obj = countries_list[i] as? NSDictionary
                {
                    if let country_name = country_obj["country"] as? String
                    {
                        if let country_code = country_obj["code"] as? String
                        {
                            TableData.append(country_name + " [" + country_code + "]")
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


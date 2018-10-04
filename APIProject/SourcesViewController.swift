//
//  ViewController.swift
//  APIProject
//
//  Created by Aamina Munzir on 9/28/18.
//  Copyright © 2018 Aamina Munzir. All rights reserved.
//

import UIKit

class SourcesViewController: UITableViewController {

    var amiibo = [[String:String]]()
    let apiKey = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Amiibo Series"
        let query = "http://www.amiiboapi.com/api/amiiboseries/"
        
        print("something's happening")
        
        if let url = URL(string: query)
        {
            print("passed url bit")
            if let data = try? Data(contentsOf: url)
            {
                print("passed data bit")
                let json = try! JSON(data: data)
                /*if json["status"] == "ok"
                {
                    print("passed status bit")
                    parse(json: json)
                    return
                }*/
                
                parse(json: json)
                return
            }
        }
        loadError()
        
    }


    func parse(json: JSON)
    {
        for result in json["amiibo"].arrayValue
        {
            let name = result["name"].stringValue
            let key = result["key"].stringValue
            
            let amiiboo = ["name":name, "key": key]
            amiibo.append(amiiboo)
        }
        tableView.reloadData()
    }
    
    
    func loadError() {
        let alert = UIAlertController(title: "Loading Error", message: "There was a problem loading the news feed", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return amiibo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let source = amiibo[indexPath.row]
        cell.textLabel?.text = source["name"]
        cell.detailTextLabel?.text = source["key"]
        
        return cell
    }
    
    
    
    
    
    
}


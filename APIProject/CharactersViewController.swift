//
//  ViewController.swift
//  APIProject
//
//  Created by Aamina Munzir on 9/28/18.
//  Copyright © 2018 Aamina Munzir. All rights reserved.
//

import UIKit

class CharactersViewController: UITableViewController {
    
    var chars = [[String:String]]()
    var apiKey = ""
    var amiiboType = [String: String]()
    
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Characters in \(amiiboType["name"]!)"
        let query = "http://www.amiiboapi.com/api/amiibo/?amiiboSeries=\(amiiboType["key"]!)"
        
        //print("something's happening")
        
        DispatchQueue.global(qos: .userInitiated).async {
            [unowned self] in
            if let url = URL(string: query)
            {
                //print("passed url bit")
                if let data = try? Data(contentsOf: url)
                {
                    //print("passed data bit")
                    let json = try! JSON(data: data)
                    
                    
                    self.parse(json: json)
                    return
                }
            }
            self.loadError()
        }
    }
    
    
    func parse(json: JSON)
    {
        for result in json["amiibo"].arrayValue
        {
            let name = result["name"].stringValue
            let gameSeries = result["gameSeries"].stringValue
            let series = result["amiiboSeries"].stringValue
            let type = result["type"].stringValue
            let imageURL = result["image"].stringValue
            let character = result["character"].stringValue
            
            let amiiboo = ["name": name, "gameSeries": gameSeries, "amiiboSeries": series,"type": type, "imageURL": imageURL, "character": character]
            
            if type == "Figure"
            {chars.append(amiiboo)}
            
            //print("\(name), \(gameSeries), \(series),,,")
        }
        
        DispatchQueue.main.async {
            [unowned self] in
            self.tableView.reloadData()
        }
        
    }
    
    
    func loadError() {
        
        DispatchQueue.main.async {
            [unowned self] in
            
            let alert = UIAlertController(title: "Loading Error", message: "There was a problem loading the news feed", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return chars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let char = chars[indexPath.row]
        cell.textLabel?.text = char["name"]
        cell.detailTextLabel?.text = char["gameSeries"]
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! InfoViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.char = chars[index!]
        //dvc.apiKey = apiKey
    }
    
    
    
    
}


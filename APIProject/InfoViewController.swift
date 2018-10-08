//
//  InfoViewController.swift
//  APIProject
//
//  Created by Aamina Munzir on 10/8/18.
//  Copyright © 2018 Aamina Munzir. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var charImageView: UIImageView!
    @IBOutlet weak var charNameLabel: UILabel!
    @IBOutlet weak var itsCharNameLabel: UILabel!
    @IBOutlet weak var itsAmiiboSeriesLabel: UILabel!
    @IBOutlet weak var itsGameSeriesLabel: UILabel!
    
    var charName = ""
    var itsAmiiboSeries = ""
    var itsGameSeries = ""
    var itsCharName = ""
    var itsURL = ""
    
    var char = [String: String]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        charNameLabel.text =  char["name"]!
        itsCharNameLabel.text = "Charcter: " + char["character"]!
        itsAmiiboSeriesLabel.text = "Amiibo Series: " + char["amiiboSeries"]!
        itsGameSeriesLabel.text = "Game Series: " + char["gameSeries"]!
        
        charName = char["name"]!
        itsCharName = char["character"]!
        itsAmiiboSeries = char["amiiboSeries"]!
        itsGameSeries = char["gameSeries"]!
        itsURL = char["imageURL"]!
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

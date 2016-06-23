//
//  ViewController.swift
//  JsonPractive
//
//  Created by Prasad Shirvandkar on 23/06/16.
//  Copyright © 2016 Prasad Shirvandkar. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UITableViewController {

    var noofrows = 0
    
    @IBOutlet weak var namelabel: NSLayoutConstraint!
    var namearray = [String]()
    var agearray = [String]()
    var imagearray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parseJSON()
    }
    
    func parseJSON(){
        
        let path : String = NSBundle.mainBundle().pathForResource("jsonfile", ofType: "json") as String!
        let jsonData = NSData.init(contentsOfFile: path) as NSData!
        let readableJSOn = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        let nameja = readableJSOn["People","Person1","Name"]
        
        noofrows = readableJSOn["People"].count

        for i in 1...noofrows {
            var person = "Person"
            person+="\(i)"
            let namej = readableJSOn["People"]["Person1"]["Name"].string as String!
            let age = readableJSOn["People"]["Person1"]["Age"].string as String!
            let imagej = readableJSOn["People"]["Person1"]["Image"].string as String!
            namearray.append(namej)
            agearray.append(age)
            imagearray.append(imagej)
            
        }        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noofrows
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        if namearray.count != 0 {
            let nameLabel = cell.viewWithTag(1) as! UILabel
            nameLabel.text = namearray[indexPath.row]
            
            let ageLabel = cell.viewWithTag(2) as! UILabel
            ageLabel.text = agearray[indexPath.row]
            
            let imageView = cell.viewWithTag(3) as! UIImageView
            imageView.image = UIImage(named: imagearray[indexPath.row])

            //cell.textLabel?.text = namearray[indexPath.row]
            //cell.detailTextLabel?.text = agearray[indexPath.row]
            
        }
        
        return cell
    }

}


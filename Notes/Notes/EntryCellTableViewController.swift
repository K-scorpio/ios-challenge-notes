//
//  EntryCellTableViewController.swift
//  Notes
//
//  Created by Kevin Hartley on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryCellTableViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.sharedInstance.entriesArray.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryTextView", forIndexPath: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = EntryController.sharedInstance.entriesArray[indexPath.row].bodyText
        

        return cell
        
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let entry = EntryController.sharedInstance.entriesArray[indexPath.row]
            EntryController.sharedInstance.removeEntry(entry)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    // MARK: - Navigation
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "toDetailView" {
                if let entryDetailVC = segue.destinationViewController as? EntryDetailViewController {
                    if let entryCell = sender as? UITableViewCell {
                        if let indexPath = tableView.indexPathForCell(entryCell) {
                            entryDetailVC.entry = EntryController.sharedInstance.entriesArray[indexPath.row]
                        }
                    }
                }
            }
        }
    }


























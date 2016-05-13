//
//  EntryDetailViewController.swift
//  Notes
//
//  Created by Kevin Hartley on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    @IBOutlet weak var bodyTextField: UITextView!
    
    @IBAction func saveButton(sender: AnyObject) {
        if let entry = entry {
            guard let bodyText = bodyTextField.text else {
                return
            }
            entry.bodyText = bodyText
            self.bodyTextField.resignFirstResponder()
            EntryController.sharedInstance.saveToPersistentStore()
        } else {
            guard let bodyText = bodyTextField.text else {
                return
            }
            let entry = Entry(bodyText: bodyText)
            EntryController.sharedInstance.addEntry(entry)
            self.entry = entry
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let entry = entry {
            updateEntryWith(entry)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateEntryWith(entry: Entry) {
        self.bodyTextField.text = entry.bodyText
        
        self.resignFirstResponder()
        
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

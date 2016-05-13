//
//  EntryController.swift
//  Notes
//
//  Created by Kevin Hartley on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    private let kEntry = "entry"
    
    static let sharedInstance = EntryController()
    
    var entriesArray = [Entry]()
    
    init() {
        loadFromPersistentStore()
    }
        
    func addEntry(entry: Entry) {
        entriesArray.append(entry)
        saveToPersistentStore()
    }

    func removeEntry(entry: Entry) {
        if let index = entriesArray.indexOf(entry) {
        entriesArray.removeAtIndex(index)
        saveToPersistentStore()
        }
    
    }
    
    func saveToPersistentStore() {
        NSUserDefaults.standardUserDefaults().setObject(entriesArray.map{($0.dictionaryCopy)}, forKey: kEntry)
    }
    
    func loadFromPersistentStore() {
        guard let entryDictionary = NSUserDefaults.standardUserDefaults().objectForKey(kEntry) as? [[String: AnyObject]] else {
            return
        }
        entriesArray = entryDictionary.flatMap({Entry(dictionary: $0)})
    }
}
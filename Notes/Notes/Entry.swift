//
//  Entry.swift
//  Notes
//
//  Created by Kevin Hartley on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let kBodyText = "bodyText"
    
    var bodyText: String
    
    var dictionaryCopy: [String: AnyObject] {
        return [kBodyText: bodyText]
    }
    
    init(bodyText: String) {
        self.bodyText = bodyText
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let bodyTextDictionaries = dictionary[kBodyText] as? String else {
            return nil
        }
        self.bodyText = bodyTextDictionaries
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.bodyText == rhs.bodyText
}
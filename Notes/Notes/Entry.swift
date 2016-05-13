//
//  Entry.swift
//  Notes
//
//  Created by Kevin Hartley on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    var bodyText: String
    
    init(bodyText: String) {
        self.bodyText = bodyText
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.bodyText == rhs.bodyText
}
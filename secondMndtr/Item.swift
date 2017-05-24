//
//  Item.swift
//  secondMndtr
//
//  Created by Richard Oros on 24/05/2017.
//  Copyright © 2017 Richard, Casian, Niraj. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Item {
    
    var ref: DatabaseReference?
    var title: String?
    
    init (snapshot: DataSnapshot) {
        ref = snapshot.ref
        
        let data = snapshot.value as! Dictionary<String, String>
        title = data["title"]! as String
    }
    
}

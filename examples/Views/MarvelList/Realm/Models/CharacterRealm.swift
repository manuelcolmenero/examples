//
//  CharacterRealm.swift
//  examples
//
//  Created by Manuel Colmenero Navarro on 4/11/18.
//  Copyright © 2018 mcolmenero. All rights reserved.
//

import Foundation
import RealmSwift

public class CharacterRealm: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""
    
    public convenience init(id: Int,
                            name: String,
                            image: String) {
        self.init()
        
        self.id = id
        self.name = name
        self.image = image
    }
    
    override public static func primaryKey() -> String{
        return "id"
    }
}

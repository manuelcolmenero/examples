//
//  Character.swift
//  examples
//
//  Created by Manuel Colmenero Navarro on 4/11/18.
//  Copyright © 2018 mcolmenero. All rights reserved.
//

import Foundation

class Character {
    private var id: Int = 0
    private var name: String = ""
    private var image: String = ""
    
    convenience public init(id: Int,
                            name: String,
                            image: String) {
        self.init()
        self.id = id
        self.name = name
        self.image = image
    }
    
    func getId() -> Int {
        return self.id
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getImage() -> String {
        return self.image
    }
}

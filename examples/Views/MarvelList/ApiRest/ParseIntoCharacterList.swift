//
//  ParseIntoCharacterList.swift
//  examples
//
//  Created by Manuel Colmenero Navarro on 4/11/18.
//  Copyright © 2018 mcolmenero. All rights reserved.
//

import Foundation

func ParseIntoCharacterList(data: Data, onError: (String) -> Void) -> CharacterList {
    var characterList: Array<Character> = []
    
    do {
        let jsonDataMain = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
        let status = jsonDataMain["status"]
        
        if (status != nil) {
            let jsonDataData = jsonDataMain["data"] as! [String:Any]
            let jsonResults = jsonDataData["results"] as! [Dictionary<String, Any>]
            
            for jsonCharacter in jsonResults {
                
                let thumbail = jsonCharacter["thumbail"] as! [String: Any]
                let imagePath = thumbail["path"] as! String
                let imageExt = thumbail["extension"] as! String
                
                let character: Character = Character.init(id: jsonCharacter["id"] as! Int,
                                                          name: jsonCharacter["name"] as! String,
                                                          image: "\(imagePath).\(imageExt)")
                
                characterList.append(character)
            }
            
        } else {
            onError("Error: Status incorrect")
        }
        
    } catch  {
        onError("Error: JSONSerialization")
    }
    
    return CharacterList(characterList: characterList)
}

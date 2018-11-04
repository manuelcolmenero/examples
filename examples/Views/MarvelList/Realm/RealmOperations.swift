//
//  RealmOperations.swift
//  examples
//
//  Created by Manuel Colmenero Navarro on 4/11/18.
//  Copyright © 2018 mcolmenero. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmOperations {
    func saveCharacterList(_ characterList: CharacterList,
                           onSuccess: () -> Void,
                           onError: (String) ->Void) {
        for index in 0..<characterList.count()-1 {
            let character = characterList.getCharacter(index: index)
            let characterRealm = CharacterRealm.init(id: character.getId(),
                                                     name: character.getName(),
                                                     image: character.getImage())
            
            self.saveCharacter(characterRealm,
                               onError: {(error) in
                onError(error)
            })
        }
        onSuccess()
    }
    
    func saveCharacter(_ characterRealm: CharacterRealm, onError: (String) -> Void) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(characterRealm, update: true)
            }
        } catch {
            onError("Can't save character")
        }
    }
}

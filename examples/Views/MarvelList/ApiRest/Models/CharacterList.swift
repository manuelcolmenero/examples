//
//  CharacterList.swift
//  examples
//
//  Created by Manuel Colmenero Navarro on 4/11/18.
//  Copyright © 2018 mcolmenero. All rights reserved.
//

import Foundation

class CharacterList {
    private var characterList: Array<Character> = []
    
    public init(characterList: Array<Character>) {
        self.characterList = characterList
    }

    // Getter
    public func getCharacterList() -> Array<Character> {
        return characterList
    }
    
    public func getCharacter(index: Int) -> Character {
        return characterList[index]
    }
    
    public func count() -> Int {
        return characterList.count
    }
    
    public func add(character: Character) {
        self.characterList.append(character)
    }
    
    
}

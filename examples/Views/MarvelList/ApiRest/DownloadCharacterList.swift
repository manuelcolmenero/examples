//
//  DownloadCharacterList.swift
//  examples
//
//  Created by Manuel Colmenero Navarro on 4/11/18.
//  Copyright © 2018 mcolmenero. All rights reserved.
//

import Foundation
import SwiftHash

class DownloadCharacterList {
    func execute(onSuccess: @escaping () -> Void,
                 onError: @escaping (String) -> Void) {
        
        // Make URL
        let characterListUrl = makeURL()
        
        guard (URL(string: characterListUrl) != nil) else {
            onError("Direction url incorrect.")
            return
        }
        
        // Make request
        let request = makeRequestWith(url: characterListUrl)
        
        // Make call
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { (data: Data?,
                                                                         response: URLResponse?,
                                                                         error: Error?) in
            
            // Validate Status
            var status: Int = 0
            
            if (response != nil) {
                status = (response as! HTTPURLResponse).statusCode
            }
            
            switch status {
            case 401:
                onError(apiError401)
                return
            case 403:
                onError(apiError403)
                return
            case 405:
                onError(apiError405)
                return
            case 409:
                onError(apiError409)
                return
            case 500:
                onError(apiError500)
                return
            default:
                break
            }
            
            // Validate error
            if error != nil {
                onError(error.debugDescription)
            } else {
                if data != nil {
                    // Convert jsonData from API in realmData
                    let characterList: CharacterList = ParseIntoCharacterList(data: data!, onError: { (error) in onError(error) })
                    
                    self.saveInRealm(characterList: characterList, onSuccess: {
                        onSuccess()
                    }, onError: { (error) in
                        onError(error)
                    })
                    
                } else {
                    onError("Can't download data from server.")
                }
            }
        })
        
        // Execute task
        task.resume()
    }
    
    fileprivate func makeURL() -> String {
        let ts = Int(NSDate().timeIntervalSince1970.rounded())
        let hash = MD5("\(ts)\(GLOBAL_API_KEY)").lowercased()
        
        let url = GLOBAL_BASEURL_MARVEL_GATEWAY + FETCH_URL_CHARACTERS_LIST + FETCH_URL_APIKEY + GLOBAL_API_KEY + FETCH_URL_HASH + hash
        
        return url
    }
    
    fileprivate func makeRequestWith(url: String) -> URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        
        // Configure
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(GLOBAL_APPURL_REFERER, forHTTPHeaderField: "Referer")
        
        return request
    }
    
    fileprivate func saveInRealm(characterList: CharacterList,
                                 onSuccess: () -> Void,
                                 onError: (String) -> Void) {
        onSuccess()
    }
}

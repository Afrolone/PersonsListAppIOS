//
//  DataLoader.swift
//  PersonsListApp
//
//  Created by Ant Colony on 26. 11. 2021..
//

import Foundation

public class DataLoader {
    var personsData = [Person]()
    
    init() {
        load()
    }
    
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "PersonsData", withExtension: "json") {
            do {
                var data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                let object = json as? [String: Any]
                
                let arr1 = object!["people"] as! NSArray

                let objCArray = NSMutableArray(array: arr1)
                
                data = try JSONSerialization.data(withJSONObject: objCArray)
                let dataFromJson = try jsonDecoder.decode([Person].self, from: data)
                
                self.personsData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}

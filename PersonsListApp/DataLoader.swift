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
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                if let json = try? jsonDecoder.decode(People.self, from: data) {
                       let object = json.people
                    self.personsData = object
                   }
            } catch {
                print(error)
            }
        }
    }
}

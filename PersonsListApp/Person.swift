//
//  Person.swift
//  PersonsListApp
//
//  Created by Ant Colony on 26. 11. 2021..
//

import Foundation

struct Person: Codable {
    var firstName: String?
    var lastName: String?
    var gender: String?
    var age: Int?
    var number: String?
    var avatar: URL?
}

struct People: Codable {
    var people: [Person]
}

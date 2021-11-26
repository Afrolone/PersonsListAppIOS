//
//  Person.swift
//  PersonsListApp
//
//  Created by Ant Colony on 26. 11. 2021..
//

import Foundation

//{
//   "firstName": "Joe",
//   "lastName": "Jackson",
//   "gender": "male",
//   "age": 28,
//   "number": "7349282382",
//   "avatar": "https://robohash.org/person1.png"
//}

class Person: Codable {
    var firstName: String
    var lastName: String
    var gender: String
    var age: Int
    var number: String
    var avatar: URL
}

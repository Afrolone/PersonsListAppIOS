//
//  ViewController.swift
//  PersonsListApp
//
//  Created by Ant Colony on 26. 11. 2021..
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data = DataLoader().personsData
        
        print("something!")
        for person in data {
            print(person.firstName)
        }
    }


}


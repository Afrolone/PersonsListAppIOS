//
//  ViewController.swift
//  PersonsListApp
//
//  Created by Ant Colony on 26. 11. 2021..
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = [Person]()
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        data = DataLoader().personsData
        
        
        let nib = UINib(nibName: "PersonTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PersonTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        print("something!")
        for person in data {
            print(person.firstName)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as? PersonTableViewCell
        else { fatalError("Could not create PersonCell") }
        let person = data[indexPath.row]
        cell.setTheCell(_person: person, navCont: navigationController)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = data[indexPath.row]
    }

}


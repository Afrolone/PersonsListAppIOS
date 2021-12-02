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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as? PersonTableViewCell
        else { fatalError("Could not create PersonCell") }
        let person = data[indexPath.row]
        cell.setTheCell(person: person)
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.customCellButtonTapped))
        
        cell.avatar.addGestureRecognizer(tapGR)
        cell.avatar.isUserInteractionEnabled = true
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = data[indexPath.row]
    }
    
    @objc func customCellButtonTapped(_ sender: UITapGestureRecognizer) {
        
        if sender.state == .ended {
            let touch = sender.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touch) {
                
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                vc.person = data[indexPath.row]
                navigationController?.present(vc, animated: true)
            }
            
        }
        
    }

}


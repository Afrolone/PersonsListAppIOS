//
//  DetailViewController.swift
//  PersonsListApp
//
//  Created by Ant Colony on 27. 11. 2021..
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var person: Person?
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!

    
    override func viewDidLoad() {
        avatar.kf.setImage(with: person?.avatar)
        nameLabel.text = person?.firstName
        surnameLabel.text = person?.lastName
        if let age = person?.age {
            ageLabel.text = "Age: \(age)"
        }
        super.viewDidLoad()
    }
    
    @IBAction func onBackTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

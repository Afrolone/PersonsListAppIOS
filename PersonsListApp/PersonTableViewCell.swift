//
//  PersonTableViewCell.swift
//  PersonsListApp
//
//  Created by Ant Colony on 27. 11. 2021..
//

import UIKit
import Kingfisher

class PersonTableViewCell: UITableViewCell {
    
    var person: Person?
    var navigationController: UINavigationController?


    @IBOutlet weak var mainCellView: UIView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setMainCellView()
        setAvatarListener()
    }
    
    fileprivate func setMainCellView() {
        // Initialization code
        mainCellView.layer.borderColor = UIColor.black.cgColor
        mainCellView.layer.borderWidth = 1.0
        mainCellView.layer.cornerRadius = 10
    }
    
    fileprivate func setAvatarListener() {
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        avatar.isUserInteractionEnabled = true
        avatar.addGestureRecognizer(singleTap)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func tapDetected() {
        print("Imageview Clicked")
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.person = person
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setTheCell(_person: Person, navCont: UINavigationController?) {
        person = _person
        
        navigationController = navCont
        nameLabel.text = person?.firstName
        surnameLabel.text = person?.lastName
        if let age = person?.age {
            ageLabel.text = "Age: \(age)"
        }
        genderLabel.text = person?.gender
        numberLabel.text = person?.number
    
        avatar.kf.setImage(with: person?.avatar)
        avatar.layer.masksToBounds = false
        avatar.layer.cornerRadius = avatar.frame.width/2
        avatar.layer.borderWidth = 1
        avatar.layer.borderColor = UIColor.clear.cgColor
        avatar.clipsToBounds = true
    }

}

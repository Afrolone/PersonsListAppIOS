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

    @IBOutlet weak var mainCellView: UIView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var buttonView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setMainCellView()
        setTheButton()
    }
    
    private func setTheButton() {
        button.layer.cornerRadius = button.bounds.size.width/2
        button.clipsToBounds = true
        buttonView.layer.cornerRadius = buttonView.bounds.size.width/2
        buttonView.clipsToBounds = true
    }
    
    func setMainCellView() {
        // Initialization code
        mainCellView.layer.borderColor = UIColor.black.cgColor
        mainCellView.layer.borderWidth = 1.0
        mainCellView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    func setTheCell(person: Person) {
        self.person = person
        
        nameLabel.text = person.firstName
        surnameLabel.text = person.lastName
        if let age = person.age {
            ageLabel.text = "Age: \(age)"
        }
        genderLabel.text = person.gender
        numberLabel.text = person.number
    
        avatar.kf.setImage(with: person.avatar)
        avatar.layer.masksToBounds = false
        avatar.layer.cornerRadius = avatar.frame.width/2
        avatar.layer.borderWidth = 1
        avatar.layer.borderColor = UIColor.clear.cgColor
        avatar.clipsToBounds = true
    }
}

extension UIButton {
    private var touchPath: UIBezierPath {return UIBezierPath(ovalIn: self.bounds)}
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return touchPath.contains(point)
    }
}

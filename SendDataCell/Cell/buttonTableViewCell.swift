//
//  buttonTableViewCell.swift
//  SendDataCell
//
//  Created by Abdurrahman Karaoluk on 19.05.2024.
//

import UIKit

protocol buttonTableViewCellDelegate: AnyObject {
    func buttonAClicked(data: Int)
    func buttonBClicked(data: Int)
}

class buttonTableViewCell: UITableViewCell {

    public static var identifier: String {
        get {
            return "buttonTableViewCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "buttonTableViewCell", bundle: nil)
    }
    
    // IBOutlets:
    @IBOutlet weak var buttonA: UIButton!
    @IBAction func buttonAAction(_ sender: Any) {
        self.delegate?.buttonAClicked(data: index)
    }
    
    
    @IBOutlet weak var buttonB: UIButton!
    @IBAction func buttonBAction(_ sender: Any) {
        self.delegate?.buttonBClicked(data: index)
    }
    
    // Variables:
    weak var delegate: buttonTableViewCellDelegate?
    var index: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

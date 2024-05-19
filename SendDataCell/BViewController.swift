//
//  BViewController.swift
//  SendDataCell
//
//  Created by Abdurrahman Karaoluk on 19.05.2024.
//

import UIKit

class BViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var index: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    
    func configView() {
        self.textLabel.text = "B \(index)"
    }


}

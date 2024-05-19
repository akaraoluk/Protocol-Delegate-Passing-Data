//
//  ViewController.swift
//  SendDataCell
//
//  Created by Abdurrahman Karaoluk on 19.05.2024.
//

import UIKit

class ViewController: UIViewController {

    // IBOutlets:
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    func configView() {
        self.title = "Main View"
        self.view.backgroundColor = .systemBackground
        
        self.setupTableView()
        
        self.reloadTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.reloadTableView()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        self.registerCells()
    }
    
    func registerCells() {
        tableView.register(buttonTableViewCell.register(), forCellReuseIdentifier: buttonTableViewCell.identifier)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: buttonTableViewCell.identifier, for: indexPath) as? buttonTableViewCell else {
            return UITableViewCell()
        }
        cell.index = indexPath.row
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: buttonTableViewCellDelegate {
    func buttonAClicked(data: Int) {
        DispatchQueue.main.async {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "AViewController") as! AViewController
            controller.index = data
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func buttonBClicked(data: Int) {
        DispatchQueue.main.async {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "BViewController") as! BViewController
            controller.index = data
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

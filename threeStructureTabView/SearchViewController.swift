//
//  SearchViewController.swift
//  threeStructureTabView
//
//  Created by OHYERINA on 15/04/2019.
//  Copyright © 2019 OHYERINA. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var searchTableView: UITableView!
    var items : [String] = ["mar", "vel", "test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(items[indexPath.row])
    }
}

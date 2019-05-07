//
//  WebsitesTableViewController.swift
//  Project4
//
//  Created by Emma on 2019/5/7.
//  Copyright © 2019 Emma. All rights reserved.
//

import UIKit

class WebsitesTableViewController: UITableViewController {

    var websites = ["baidu.com", "apple.com", "hackingwithswift.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)

        cell.textLabel?.text = websites[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()
        vc.websites = websites
        vc.website = websites[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}

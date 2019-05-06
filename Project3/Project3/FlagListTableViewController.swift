//
//  FlagListTableViewController.swift
//  Project3
//
//  Created by Emma on 2019/5/6.
//  Copyright © 2019 Emma. All rights reserved.
//

import UIKit

class FlagListTableViewController: UITableViewController {
    
    var countries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath) as! FlagTableViewCell
        cell.imgvFlag?.image = UIImage(named: countries[indexPath.row])
        cell.imgvFlag.layer.borderWidth = 1
        cell.imgvFlag.layer.borderColor = UIColor.lightGray.cgColor
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = countries[indexPath.row]
            vc.title = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

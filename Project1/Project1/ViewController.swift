//
//  ViewController.swift
//  Project1
//
//  Created by Emma on 2019/5/5.
//  Copyright © 2019 Emma. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //work with the filesystem, here we'll be using it to look for files
        let fm = FileManager.default
        //resoure path of our app's bundle, find all those images I added to my app
        let path = Bundle.main.resourcePath!
        //an array of strings containing filenames
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        
        pictures = pictures.sorted(by: {$0 < $1})
        
        print(pictures)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            //2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            vc.title = "Picture \(indexPath.row+1) of \(pictures.count)"
            
            //3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


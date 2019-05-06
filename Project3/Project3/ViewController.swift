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

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
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
    
    @objc func shareTapped(){
        guard let currentApp = NSURL(string: "https://itunes.apple.com/cn/app/%E6%80%80%E5%8C%96%E4%B8%8D%E5%8A%A8%E4%BA%A7%E7%AE%A1%E7%90%86%E7%AB%AF/id1438483996?mt=8") else{
            print("There is no such App")
            return
        }
        let vc = UIActivityViewController(activityItems: [currentApp], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
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


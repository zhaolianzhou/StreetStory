//
//  ViewController.swift
//  StreetStory
//
//  Created by Zhaolian Zhou on 13/11/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var models : [(title: String, story: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        table?.delegate = self
        table?.dataSource = self
        title = "Street Story"
    }
    
    @IBAction func addNewStory() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "new") as? EntryViewController
        else {
            return
        }
        vc.title = "New Story"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = {storyTitle, story in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((title: storyTitle, story: story))
            self.label.isHidden = true
            self.table.isHidden = false
            
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].story
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        //show note controller
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "streetstory") as? StreetStoryViewController
        else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Street Story"
        vc.storyTitle = model.title
        vc.storyContent = model.story
        navigationController?.pushViewController(vc, animated: true)
    }
}


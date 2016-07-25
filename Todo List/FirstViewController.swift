//
//  FirstViewController.swift
//  Todo List
//
//  Created by Gabriele on 7/24/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit


// Make a tableview that will show all the todos

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var todoItems = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let todoItemObject = UserDefaults.standard.object(forKey: "items") as? NSArray {
            todoItems = todoItemObject as! [String]
        } else {
            UserDefaults.standard.set(todoItems, forKey: "items")
            todoItems = UserDefaults.standard.object(forKey: "items") as! [String]
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Reload table data
        UserDefaults.standard.synchronize()
        table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = todoItems[indexPath.row]
        return cell
    }


    // Add ability to delete item upon swipe, from both table and the appdata itself
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoItems.remove(at: indexPath.row)
            table.deleteRows(at: [indexPath], with: .fade)
        }
    }
}


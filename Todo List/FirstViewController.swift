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
    
    let testarray = ["1", "2", "3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = testarray[indexPath.row]
        return cell
    }


}


//
//  TableViewController.swift
//  PassDataNotificationCenter1
//
//  Created by Cuong on 7/5/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let key = Notification.Name("12345")
}

class MasterTableViewController: UITableViewController {
    
    var array = ["1", "e"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(setData(notification:)), name: .key, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String(array[indexPath.row])
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let detailVC = segue.destination as? DetailViewController {
//            if let index = tableView.indexPathForSelectedRow {
//                detailVC.receivedText = String(array[index.row])
//                detailVC.indexPath = index
//            }
//        }
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVCID") as? DetailViewController
        detailVC?.receivedText = array[indexPath.row]
        present(detailVC!, animated: true, completion: nil)
    }
    
    @objc func setData(notification: NSNotification) {
        if let indexpart = tableView.indexPathForSelectedRow {
            array[indexpart.row] = (notification.object as? String)!
            tableView.reloadData()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

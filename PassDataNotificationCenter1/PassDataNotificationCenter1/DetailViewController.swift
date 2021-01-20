//
//  DetailViewController.swift
//  PassDataNotificationCenter1
//
//  Created by Cuong on 7/5/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTextField: UITextField!
    
    var receivedText: String?
    
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if receivedText != nil {
            detailTextField.text = receivedText
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonDetail(_ sender: Any) {
        NotificationCenter.default.post(name: .key2, object: detailTextField.text)
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
}

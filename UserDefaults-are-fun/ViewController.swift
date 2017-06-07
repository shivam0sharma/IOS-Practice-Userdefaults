//
//  ViewController.swift
//  UserDefaults-are-fun
//
//  Created by Shivam Sharma on 6/6/17.
//  Copyright © 2017 ShivamSharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var favLable: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let color = UserDefaults.standard.value(forKey: "color") as? String {
            favLable.text = "Favorite Color: \(color)"
        } else {
            favLable.text = "Pick a Favorite Color"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func red(_ sender: UIButton) {
        favLable.text = "Favorite Color: Red"
        UserDefaults.standard.set("Red", forKey: "color")
        UserDefaults.standard.synchronize()
    }

    @IBAction func yellow(_ sender: UIButton) {
        favLable.text = "Favorite Color: Yellow"
        UserDefaults.standard.set("Yellow", forKey: "color")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func blue(_ sender: UIButton) {
        favLable.text = "Favorite Color: Blue"
        UserDefaults.standard.set("Blue", forKey: "color")
        UserDefaults.standard.synchronize()
    }
    
    
}


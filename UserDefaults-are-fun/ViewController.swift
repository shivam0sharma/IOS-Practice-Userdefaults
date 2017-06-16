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
    
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let color = UserDefaults.standard.value(forKey: "color") as? String {
            favLable.text = "Favorite Color: \(color)"
        } else {
            favLable.text = "Pick a Favorite Color"
        }
        
        let personA = Person(first: "Shivam", last: "Sharma")
        let personB = Person(first: "Sanya", last: "Sharma")
        let personC = Person(first: "Ishaan", last: "Sharma")
        
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        let peopleData = NSKeyedArchiver.archivedData(withRootObject: people)
        
        UserDefaults.standard.set(peopleData, forKey: "people")
        UserDefaults.standard.synchronize()
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
        
        if let loadedPeople = UserDefaults.standard.object(forKey: "people") as? Data {
            if let peopleArray = NSKeyedUnarchiver.unarchiveObject(with: loadedPeople) as? [Person] {
                for person in peopleArray {
                    print(person.firstName)
                }
            }
        }
    }
    
    
}


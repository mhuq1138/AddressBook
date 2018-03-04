//
//  EditViewController.swift
//  UsingFetchedResultsControllerDelegateMethods
//
//  Created by Mazharul Huq on 4/13/17.
//  Copyright © 2017 Mazharul Huq. All rights reserved.
//

import UIKit
import CoreData

class EditViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var streetField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    
    var managedContext:NSManagedObjectContext!
    var address:Address?

    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.text = address?.name
        streetField.text = address?.street
        cityField.text = address?.city
        stateField.text = address?.state
    }

    
    @IBAction func saveTapped(_ sender: Any) {
        if self.address == nil{
            self.address = Address(context: self.managedContext)
        }
        address?.name = nameField.text
        address?.street = streetField.text
        address?.city = cityField.text
        address?.state = stateField.text
        
        do {
            try self.managedContext.save()
            
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
}

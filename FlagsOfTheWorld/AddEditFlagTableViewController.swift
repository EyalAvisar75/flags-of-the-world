//
//  AddEditFlagTableViewController.swift
//  FlagsOfTheWorld
//
//  Created by eyal avisar on 15/05/2020.
//  Copyright © 2020 David McMeekin. All rights reserved.
//

import UIKit

class AddEditFlagTableViewController: UITableViewController {
    
    @IBOutlet weak var flagTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var regionTextField: UITextField!
    
    @IBOutlet weak var populationTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var flag:Flag?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let flag = flag {
            flagTextField.text = flag.flag
            countryTextField.text = flag.country
            regionTextField.text = flag.region
            populationTextField.text = flag.population
        }
        updateSaveButtonState()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func updateSaveButtonState() {
        let flagText = flagTextField.text ?? ""
        let countryText = countryTextField.text ?? ""
        let regionText = regionTextField.text ?? ""
        let populationText = populationTextField.text ?? ""
        
        saveButton.isEnabled = !flagText.isEmpty &&
            !countryText.isEmpty && !regionText.isEmpty &&
            !populationText.isEmpty

    }
    
    @IBAction func textEditingChanged(_ sender:UITextField){
        updateSaveButtonState()
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "saveUnwind" {
            let theFlag = flagTextField.text ?? ""
            let country = countryTextField.text ?? ""
            let region = regionTextField.text ?? ""
            let population = populationTextField.text ?? ""
            
            flag = Flag(flag:theFlag, country: country, region: region, population: population)
        }
        else {
            return
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

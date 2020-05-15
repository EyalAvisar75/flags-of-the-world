import UIKit

class FlagTableViewController: UITableViewController {
    
    // Step One: Add the flags array.
    var flags: [Flag] = [
        Flag(flag: "🇦🇺", country: "Australia", region: "Oceania", population: "24.13m"),
        Flag(flag: "🇳🇿", country: "New Zealand", region: "Oceania", population: "4.69m"),
        Flag(flag: "🇨🇦", country: "Canada", region: "North America", population: "36.3m"),
        Flag(flag: "🇳🇴", country: "Norway", region: "Scandinavia", population: "3.8m"),
        Flag(flag: "🇸🇧", country: "Solomon Islands", region: "Micronesia", population: "611k"),
        Flag(flag: "🇮🇳", country: "India", region: "South Asia", population: "1.324b"),
        Flag(flag: "🇨🇳", country: "China", region: "East Asia", population: "1.379b"),
        Flag(flag: "🇬🇲", country: "Gambia", region: "West Africa", population: "2.039m"),
        Flag(flag: "🇨🇱", country: "Chile", region: "South America", population: "17.91m"),
        Flag(flag: "🇨🇴", country: "Colombia", region: "South America", population: "48.65m"),
        Flag(flag: "🇩🇪", country: "Germany", region: "Europe", population: "82.67m"),
        Flag(flag: "🇬🇹", country: "Guatemala", region: "Central America", population: "16.58m"),
        Flag(flag: "🇬🇾", country: "Guyana", region: "South America", population: "773k"),
        Flag(flag: "🇦🇪", country: "United Arab Emirates", region: "Western Asia", population: "9.4m"),
        Flag(flag: "🇦🇱", country: "Albania", region: "Balkan Peninsula", population: "2.873m"),
        Flag(flag: "🇪🇹", country: "Ethiopia", region: "Horn of Africa", population: "105m"),
        Flag(flag: "🇦🇪", country: "Greece", region: "South Eastern Europe", population: "10.77m"),
        Flag(flag: "🇰🇬", country: "Kyrgyzstan", region: "Central Asia", population: "6.2m")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Step Two.
        // FlagsOfTheWorld will have one section
        // Set this to return one.
        // This entire function could be removed as we have only one
        // section and by default one is assumed.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Step Three
        // This is for how many rows to be placed in the section.
        // We know which is the requested section through the section
        // parameter.
        
        if section == 0 {
            return flags.count
        }
        else {
            return 0
        }
        
        // The count for our flags array is returned here for section 0
        // Remeber, we start counting from 0.
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Step Four
        // Our table view knows how many rows to display
        // therefore this method is called.
        //
        // Step Four A:
        // We actually dequeue a cell with the identifier we set:
        // "FlagCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath) as! FlagTableViewCell
        
        // Step Four B
        // Get our model object to display on the cell
        // We use the parameter indexPath to get the correct Flag
        // from the flags array
        let flag = flags[indexPath.row]
        
        // Step Four C
        // Configure the cell with the information from our flag
        
        cell.update(with: flag)

        // =============== While in Step Four, ignore the next 5 lines
        // Step Six
        // Add this line of code to allow the showsReorderControl
        // to be set to be displayed.
        cell.showsReorderControl = true
        // ===============
        
        
        // This return statement is part of Step Four.
        return cell
    }
    
    // Step Five
    // Implementing the Delegate
    // Because we use the TableViewController to manage the data
    // it is also our delegate, just like with the data source
    // Add the following function to simply print the flag we have selected
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let flag = flags[indexPath.row]
//        print("\(flag.flag) \(indexPath)")
//    }

    // Step Seven
    //Step Seven A
    // Was to add the Bar Button Item to the Storyboard and select Edit
    // in the System Item Property for it in the Atribtures inspector
    // Step Seven B
    // Create an IBAction from the Bar Button Item to here
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        
        // Step Seven C
        // Add this code to put the table view in to editing mode and it will
        // toggle the the editing move on and off
        
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            flags.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    // Step Eight
    // Allow the moving of rows within the table view
    // We remove the data and then add it back into the table view
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        // Removes the flag
        let movedFlag = flags.remove(at: fromIndexPath.row)
        // Inserts the flag in its new location
        flags.insert(movedFlag, at: to.row)
        // Reloads the data so we can see the flag in its new place
        tableView.reloadData()
    }
    
    // Step Nine
    // Although we don't do it here, there will be times when data is added
    // from anotehr view controller. Hence, we will need to reload the data
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    @IBAction func unwindToFlagTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind",
            let sourceViewController = segue.source as? AddEditFlagTableViewController,
            let flag = sourceViewController.flag else {return}
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            flags[selectedIndexPath.row] = flag
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        }
        else {
            let newIndexPath = IndexPath(row:flags.count, section:0)
            flags.append(flag)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "EditFlag" {
            let indexPath = tableView.indexPathForSelectedRow!
            let flag = flags[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let addEditFlagTableViewController = navController.topViewController as! AddEditFlagTableViewController
            addEditFlagTableViewController.flag =  flag
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

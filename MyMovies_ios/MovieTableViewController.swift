/*
* Copyright 2016 Tianyan Wu,
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*
* The Instuctor: Tim Lindquist and Arizona State University has right to build and evaluate the software
* Package for the purpose of determining my grade and program assessment.
*
* Purpose: This project is a multiple view iOS app for managing MovieDescriptions. It uses more complex controls and multiple views to display and manage a collection of MovieDescription objects. It provide a list of all movie titles contained in the collection and allow the user to select one title and see all of the information about that title, and it provide the ability to add or remove movie description entries. New descriptions can be added to the collection by the user manually entering the appropriate information needed to create a MovieDescription object
*
* Ser423 Mobile Applications
* see http://pooh.poly.asu.edu/Mobile
* @author Tianyan Wu mailto: Tianyanw@asu.edu
*
* @version February 2016
*/

// this is view controller class for the movie table

import UIKit

class MovieTableViewController: UITableViewController {

    
    let myLibrary:MovieLibrary = MovieLibrary()
    
    @IBOutlet var myTable: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
        
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Movie"
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "AddMovie")
        self.navigationItem.rightBarButtonItem = addButton
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    

    
    func AddMovie(){
        
        performSegueWithIdentifier("AddMovie", sender: self)
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return self.myLibrary.getSize()
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath)as! MovieTableViewCell
        cell.name.text = myLibrary.getMovie(indexPath.row).title
        cell.plot.text = myLibrary.getMovie(indexPath.row).plot
        return cell
    }
   
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            myLibrary.remove(indexPath.row)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
    }
   

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMovie" {
            
            let selectedIndex: NSIndexPath = self.myTable.indexPathForCell(sender as! UITableViewCell)!
           
            if let movieViewController:MovieViewController = segue.destinationViewController as? MovieViewController{
            
                movieViewController.movie = myLibrary.getMovie(selectedIndex.row)
            }
        }
        
        if segue.identifier == "AddMovie"{
            
            if let AddViewController: AddViewController = segue.destinationViewController as? AddViewController {
                
                AddViewController.myLibrary = myLibrary
            }
            
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
   

}

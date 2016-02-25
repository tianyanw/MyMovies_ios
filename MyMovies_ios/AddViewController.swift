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


// this is an view controller class for adding a new movie
import UIKit

class AddViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var myLibrary:MovieLibrary = MovieLibrary()
    
    @IBOutlet weak var titTxe: UITextField!
    @IBOutlet weak var yearTxt: UITextField!
    @IBOutlet weak var releTxt: UITextField!
    @IBOutlet weak var runTxt: UITextField!
    @IBOutlet weak var rateTxt: UITextField!
    @IBOutlet weak var actTxt: UITextField!
    @IBOutlet weak var ploTxt: UITextField!
    
    
    @IBOutlet weak var genrepicker: UIPickerView!

    
    var pickerData: [String] = [String]()
    var selectedValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genrepicker.delegate = self
        genrepicker.dataSource = self
        
        pickerData = ["Action","Comdey","Drama","Animation","Biojraphy","Adventure"]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
         selectedValue = pickerData[row]
        
        // use the row to get the selected row from the picker view
        // using the row extract the value from your datasource (array[row])
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView (pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    

    
    @IBAction func saveButton(sender: AnyObject) {
        
        let aNewMovie = MovieDescription(title: titTxe.text!, year:yearTxt.text!, rated:rateTxt.text!, released:releTxt.text!,
            runtime:runTxt.text!, genre:selectedValue, actors:actTxt.text!, plot:ploTxt.text!)
        
        let sss: String = aNewMovie.generateJSON()
        
        myLibrary.add(sss)
        
        navigationController?.popViewControllerAnimated(true)
                
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

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


import UIKit

// MovieDescription class to create json string

class MovieDescription {
    
    var title: String
    var year: String
    var rated: String
    var released: String
    var runtime: String
    var genre: String
    var actors: String
    var plot: String
    
    // init the class
    
    init(jsonStr:String){
        self.title = ""
        self.year = ""
        self.rated = ""
        self.released = ""
        self.runtime = ""
        self.genre = ""
        self.actors = ""
        self.plot = ""
        if let data: NSData = jsonStr.dataUsingEncoding(NSUTF8StringEncoding){
            do{
                let dict = try NSJSONSerialization.JSONObjectWithData(data,options:.MutableContainers) as?[String:AnyObject]
                self.title = (dict!["Title"] as? String)!
                self.year = (dict!["Year"] as? String)!
                self.rated = (dict!["Rated"] as? String)!
                self.released = (dict!["Released"] as? String)!
                self.runtime = (dict!["Runtime"] as? String)!
                self.genre = (dict!["Genre"] as? String)!
                self.actors = (dict!["Actors"] as? String)!
                self.plot = (dict!["Plot"] as? String)!
                
            } catch {
                print("unable to convert to dictionary")
                
            }
        }
    }
    
    init(title:String, year:String, rated:String, released:String, runtime:String, genre:String, actors:String, plot:String){
       
        self.title = title
        self.year = year
        self.rated = rated
        self.released = released
        self.runtime = runtime
        self.genre = genre
        self.actors = actors
        self.plot = plot
        
        generateJSON()
    }
    
    func generateJSON() -> String {
        let json =
            "{" +
            "\"Title\":\"" + self.title + "\"," +
            "\"Year\":\"" + self.year + "\"," +
            "\"Rated\":\"" + self.rated + "\"," +
            "\"Released\":\"" + self.released + "\"," +
            "\"Runtime\":\"" + self.runtime + "\"," +
            "\"Genre\":\"" + self.genre + "\"," +
            "\"Actors\":\"" + self.actors + "\"," +
            "\"Plot\":\"" + self.plot + "\"" +
        "}";
        return json
    }
    
    // tostring
    
    func toJsonString() ->String{
        
        var jsonStr = "";
        let dict = ["Title": title, "Year": year, "Rated":rated, "Released": released, "Runtime": runtime, "Genre": genre, "Actor": actors, "Plot": plot]
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.PrettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            jsonStr = NSString(data: jsonData, encoding: NSUTF8StringEncoding)! as String
        } catch let error as NSError {
            print(error)
        }
        return jsonStr
        
        
    }
    
}
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

// this class store all the movies in an array

import Foundation

class MovieLibrary{
    
    var movies: [MovieDescription]
    
    init(){
        
        movies = [MovieDescription]()
        
         add("{\"Title\":\"Interstellar\",\"Year\":\"2014\",\"Rated\":\"PG-13\",\"Released\":\"07 Nov 2014\",\"Runtime\":\"169 min\",\"Genre\":\"Adventure\",\"Actors\":\"Ellen Burstyn, Matthew McConaughey, Mackenzie Foy, John Lithgow\",\"Plot\":\"A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.\"}");
        
        add("{\"Title\":\"San Andreas\",\"Year\":\"2015\",\"Rated\":\"PG-13\",\"Released\":\"27 Nov 2015\",\"Runtime\":\"169 min\",\"Genre\":\"Action, Drama, Thriller\",\"Actors\":\"Dwayne Johnson, Carla Gugino, Alexandra Daddario, Ioan Gruffudd\",\"Plot\":\"In the aftermath of a massive earthquake in California, a rescue-chopper pilot makes a dangerous journey with his ex-wife across the state in order to rescue his daughter.\"}")
        
        add("{\"Title\":\"Bless Me, Ultima\",\"Year\":\"2013\",\"Rated\":\"PG-13\",\"Released\":\"27 Nov 2013\",\"Runtime\":\"106 min\",\"Genre\":\"Drama, War\",\"Actors\":\"Luke Ganalon, Miriam Colon, Benito Martinez, Dolores Heredia\",\"Plot\":\"A drama set in New Mexico during WWII, centered on the relationship between a young man and an elderly medicine woman who helps him contend with the battle between good and evil that rages in his village.\"}")
        
        add("{\"Title\":\"The World Is Not Enough\",\"Year\":\"1999\",\"Rated\":\"PG-13\",\"Released\":\"27 Nov 1999\",\"Runtime\":\"128 min\",\"Genre\":\"Action, Adventure, Thriller\",\"Actors\":\"Pierce Brosnan, Sophie Marceau, Robert Carlyle, Denise Richards\",\"Plot\":\"James Bond uncovers a nuclear plot when he protects an oil heiress from her former kidnapper, an international terrorist who can't feel pain.\"}")

    }
    

    
    func add(item:String){
        
        let movie = MovieDescription(jsonStr: item);
        
        movies.append(movie);
        
    }
    
    func getMovie(index: Int) -> MovieDescription {
        
        return movies[index]
    }
    
    func getAllMovie()-> [MovieDescription]{
        
        return movies
    }
    
    func remove(index:Int){
        
        movies.removeAtIndex(index);
    }
    
    func getSize() -> Int{
        
        return movies.count;
    }
    
}

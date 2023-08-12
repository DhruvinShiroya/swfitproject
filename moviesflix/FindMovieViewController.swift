//
//  FindMovieViewController.swift
//  moviesflix
//
//  Created by dhruvin on 2023-08-09.
//

import UIKit

class FindMovieViewController: UIViewController {

    @IBOutlet weak var keyword: UITextField!
   
    @IBOutlet weak var errLabel: UILabel!
    
    var username = ""
    var result : [Result]? = []	
    @IBAction func findMovies(_ sender: Any) {
        errLabel.text = ""
        
        if keyword.text != nil {
            // Url
            let replaceKeyword = keyword.text?.replacingOccurrences(of: " ", with: "%20")
            
            print(replaceKeyword!)
            let url = URL(string: "https://moviesdatabase.p.rapidapi.com/titles/search/akas/\(String(describing: replaceKeyword!))")
            
            
            
            guard url != nil else {
                print("Error creating url request")
                return errLabel.text = "Please provie valid name"
            }
            
            //  URL Request
            
            var request = URLRequest(url: url! , cachePolicy: .useProtocolCachePolicy , timeoutInterval: 10)
        
            // url request
            
            
            // set header for the url request
            let header = [
                "X-RapidAPI-Key": "8caf6b4979msh5d74d6adb564432p1047bfjsnc3b7d3792b64",
                "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
            ]
            
            // add header to the request field
            request.allHTTPHeaderFields = header
            
            request.httpMethod = "GET"

            // create a seesion
            let session = URLSession.shared
            
            // make request and handle the result
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error == nil && data != nil) {
                    let decoder = JSONDecoder()
                   do {
                    // Parse JSON
                    let searchResult = try decoder.decode(SearchResult.self, from : data!)
                    
                    self.result = searchResult.results
                    
                    
                   }catch {
                    print("there were no movies")
                   }
                
                }else {
                    print("there was no results")
                }
            })
            
            dataTask.resume()
            self.performSegue(withIdentifier: "showResult", sender: self)
            
        }else {
            errLabel.text = "Please provide valid input"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

     
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            if let movieResultTableViewController = segue.destination as? MovieResultTableViewController{
                movieResultTableViewController.username = username
                movieResultTableViewController.result = result!
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    

}

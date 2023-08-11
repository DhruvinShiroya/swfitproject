//
//  FindMovieViewController.swift
//  moviesflix
//
//  Created by dhruvin on 2023-08-11.
//

import UIKit

class FindMovieViewController: UIViewController {

    @IBOutlet weak var keyword: UITextField!
   
    @IBOutlet weak var errLabel: UILabel!
    
    
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
                if (error != nil) {
                    print(error as Any)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    do {
                        let dict = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : Any ]
                        print(dict)
                    } catch {
                        print("there were no movies")
                    }
                }
            })

            dataTask.resume()
            
            
        }else {
            errLabel.text = "Please provide valid input"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

     
        
        // Do any additional setup after loading the view.
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

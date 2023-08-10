//
//  ViewController.swift
//  moviesflix
//
//  Created by dhruvin on 2023-08-09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchInput: UITextField!
    
    @IBAction func submit(_ sender: Any) {
        if (searchInput.text != nil){
            
            print(searchInput.text!)
            
            
            let headers = [
                "X-RapidAPI-Key": "",
                "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
            ]

            let request = NSMutableURLRequest(url: NSURL(string: "https://moviesdatabase.p.rapidapi.com/titles/search/keyword/%7Bkeyword%7D")! as URL,
                                                    cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers

            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error as Any)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse)
                }
            })

            dataTask.resume()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


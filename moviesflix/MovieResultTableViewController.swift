//
//  MovieResultTableViewController.swift
//  moviesflix
//
//  Created by dhruvin on 2023-08-08.
//

import UIKit
import CoreData

class MovieResultTableViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!

    var username = ""
    var result: [Result] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let tempCell:ResultTableViewCell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! ResultTableViewCell
        
        tempCell.lblYear?.text =  String((result[indexPath.row].releaseDate?.year)!)
        
        tempCell.lblMovieName?.text = result[indexPath.row].originalTitleText?.Text
        
        tempCell.imgUrl?.text = result[indexPath.row].primaryImage?.url
        
        
        
        // load the image async
        
        if let url = URL(string: (result[indexPath.row].primaryImage?.url)!){
            URLSession.shared.dataTask(with: url) {
                (data, _ , error) -> Void in
                if (error == nil && data != nil) {
                    
                    tempCell.imageView?.image = UIImage(data: data!)
                    
                }else {
                    print(error!)
                    return
                }
            }.resume()
            
        }
        
        // when the button is tapped take action to add them in the data source
//        tempCell.watchButtonTapped =  {
//            [weak self] in self?.watchButtonTap(movieName: tempCell.lblMovieName , year : tempCell.lblYear , imgUrl : tempCell.imgUrl  )
//        }
        
        
        return tempCell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func watchButtonTap(movieName movieName: String , year year : String , imgUrl : String ){
        
        var watchMovie: MovieList = NSEntityDescription.insertNewObject(forEntityName: "MovieList", into: DatabaseController.getContext()) as! MovieList
        
        watchMovie.title = movieName
        watchMovie.image = imgUrl
        watchMovie.releaseDate = year
        watchMovie.id = username
        
        
        
        DatabaseController.saveContext()
        
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

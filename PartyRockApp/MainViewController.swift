//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Pragun Sharma on 12/07/17.
//  Copyright © 2017 Pragun Sharma. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //When you download things from the internet then you need to do it on the asynchronous thread
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [baseDataForm] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let data1 = baseDataForm(imageURL: "http://imados.fr/content/2/2/6/612266/A_Head_Full_Of_Dreams_-Promotional-_Cover_s200.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/YykjpeuMNEk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Coldplay - Hymm For The Weekend")
        
        let data2 = baseDataForm(imageURL: "https://edmhunters-563e.kxcdn.com/mediafiles/song/images/157592.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Io0fBr1XBUA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "The Chainsmokers - Don't Let Me Down")
        
        data.append(data1)
        data.append(data2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyTableViewCell {
            
            let dataToSend = data[indexPath.row]
            cell.updateUI(baseForm: dataToSend)
            return cell
            
        } else {
            
           return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataSelected = data[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: dataSelected)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoViewController {
            if let dataToSend = sender as? baseDataForm {
                destination.singleData = dataToSend
            }
        }
    }

}


//
//  PartyTableViewCell.swift
//  PartyRockApp
//
//  Created by Pragun Sharma on 12/07/17.
//  Copyright © 2017 Pragun Sharma. All rights reserved.
//

import UIKit

class PartyTableViewCell: UITableViewCell {

    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(baseForm: baseDataForm) {
        
        videoTitle.text = baseForm.videoTitle
        
        
        let url = URL(string: baseForm.imageURL)
        
        DispatchQueue.main.async(execute: {
            do {
                let data = try Data(contentsOf: url!)
                self.videoPreviewImage.image = UIImage(data: data)
                
            } catch let err as NSError {
                print(err)
            }
        })
    }
}

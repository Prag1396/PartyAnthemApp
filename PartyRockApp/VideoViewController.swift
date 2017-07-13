//
//  VideoViewController.swift
//  PartyRockApp
//
//  Created by Pragun Sharma on 12/07/17.
//  Copyright © 2017 Pragun Sharma. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var _singleData: baseDataForm!
    
    var singleData: baseDataForm {
        
        get {
            return _singleData
        } set {
            _singleData = newValue
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = _singleData.videoTitle
        webView.loadHTMLString(_singleData.videoURL, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: {})
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  RadioViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 22/01/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class RadioViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    let urlValue = "http://www.guaymas.gob.mx"
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        if let url = URL (string: urlValue){
            let requestObj = URLRequest(url: url)
            _ = webView.loadRequest(requestObj)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

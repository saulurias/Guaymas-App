//
//  ViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 17/01/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: - Ciclo de vida de la Vista
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.navigationItem.title = "Guaymas";
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 0, green: 0/255, blue: 205/255, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)]
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    //MARK: - Acciones
    @IBAction func btnPagina(_ sender: Any) {
        UIApplication.shared.open(NSURL(string:"http://www.guaymas.gob.mx") as! URL, options: [:], completionHandler: nil);
    }
    @IBAction func btnFacebook(_ sender: Any) {
        UIApplication.shared.open(NSURL(string:"https://www.facebook.com/AquiEsGuaymas/?pnref=story.unseen-section") as! URL, options: [:], completionHandler: nil);
    }
    @IBAction func btnTwitter(_ sender: Any) {
        UIApplication.shared.open(NSURL(string:"https://twitter.com/Guaymas_2017") as! URL, options: [:], completionHandler: nil);
    }
    @IBAction func btnYoutuber(_ sender: Any) {
        UIApplication.shared.open(NSURL(string:"https://www.youtube.com/channel/UC6LQww1epc_VzH7RYMo8HzQ") as! URL, options: [:], completionHandler: nil);
    }
}
    
    





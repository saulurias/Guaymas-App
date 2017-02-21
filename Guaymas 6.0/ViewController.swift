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
    
    





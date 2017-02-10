//
//  MultimediaViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 03/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class MultimediaViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var webView: UIWebView!
    
    //Constantes
    let urlValue = "http://g6.guaymas.gob.mx/reporteciudadano/media.php?pagina=1&videosxPagina=4";
    
    //MARK: - Ciclo de vida de la Vista
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL (string: urlValue){
            let requestObj = URLRequest(url: url)
            _ = webView.loadRequest(requestObj)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

//
//  NoticiasViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 17/01/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class NoticiasViewController: UIViewController {

    var noticia: Noticia?
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imageNoticia: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var contenidoLabel: UILabel!
    
    
    //MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let noticia = noticia {
            
            //Cargar labels
            tituloLabel.numberOfLines = 0;
            tituloLabel.lineBreakMode = .byWordWrapping;
            fechaLabel.numberOfLines = 0;
            fechaLabel.lineBreakMode = .byWordWrapping;
            contenidoLabel.numberOfLines = 0;
            contenidoLabel.lineBreakMode = .byWordWrapping;
 
            
            //mostrar texto labels
            tituloLabel.text = noticia.titulo
            fechaLabel.text = noticia.fecha
            contenidoLabel.text = noticia.contenido
            
            //Cargar imagen
            let url = URL(string: noticia.url)!
            let session = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                //Si no es nil
                if let data = data {
                    let image = UIImage(data: data)
                    //mostrar imagen
                    self.imageNoticia.image = image
                }
            })//End session
            session.resume()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

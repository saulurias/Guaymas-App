//
//  MensajeReporteViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 22/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class MensajeReporteViewController: UIViewController {

    var folio : Int?;
    var nombre : String?;
    
    //MARK: - IBOutlets
    @IBOutlet weak var saludoUsuarioLabel: UILabel!
    @IBOutlet weak var mensajeLabel: UILabel!
    @IBOutlet weak var folioLabel: UILabel!
    @IBOutlet weak var informeLabel: UILabel!
    
    
    //MARK: - Ciclo de vida de la Aplicacion
    
    override func viewWillAppear(_ animated: Bool) {
        if let folio = folio {
            if let nombre = nombre {
                print("NOMBRE DEL INTERESADO:\(nombre)");
                saludoUsuarioLabel.text = "Hola \(nombre)";
                mensajeLabel.text = "Su petición ha sido dada de alta en el sistema de recepción de reportes ciudadanos";
                folioLabel.text = "\(folio)";
                informeLabel.text = "Personal de la dirección de Atención Ciudadana se comunicará con usted para monitorear el avance de su reporte";
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }

}

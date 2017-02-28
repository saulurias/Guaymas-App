//
//  DirectorioViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 08/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit
import MapKit

class DirectorioViewController: UIViewController, UIGestureRecognizerDelegate {

    //Variables
    var dependencia: Dependencia?;
    
    //MARK: - IBOutlets
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var numeroLabel: UILabel!
    @IBOutlet weak var direccionLabel: UILabel!
    @IBOutlet weak var paginaLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    //MARK: - Ciclo de vida de la Vista
    override func viewWillAppear(_ animated: Bool) {
        if let dependencia = dependencia {
            nombreLabel.text = dependencia.nombre;
            numeroLabel.text = dependencia.telefono;
            direccionLabel.text = dependencia.direccion;
            paginaLabel.text = dependencia.pagina;
            
            //Cargar Ubicación
            let ubicacionDependencia: CLLocationCoordinate2D?;
            let latitud = dependencia.latitud;
            let longitud = dependencia.longitud;
            let center = CLLocationCoordinate2D(latitude: latitud, longitude: longitud);
            
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01));
            
            self.mapView.setRegion(region, animated: true);
            
            ubicacionDependencia = CLLocationCoordinate2D(latitude: latitud, longitude: longitud);
            
            let anotacion = MKPointAnnotation();
            anotacion.coordinate = ubicacionDependencia!;
            anotacion.title = "\(dependencia.nombre)";
            mapView.addAnnotation(anotacion);
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.navigationItem.backBarButtonItem?.title = "Regresar";
        UINavigationBar.appearance().barTintColor = UIColor(red: 0, green: 0/255, blue: 205/255, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)]
        
        
        numeroLabel.isUserInteractionEnabled = true;
        let tapNumero: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapNumeroLabel));
        numeroLabel.addGestureRecognizer(tapNumero);
        tapNumero.delegate = self;
        
        paginaLabel.isUserInteractionEnabled = true;
        let tapPagina: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapPaginaLabel));
        paginaLabel.addGestureRecognizer(tapPagina);
        tapPagina.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    //MARK: - Acciones
    
    func didTapNumeroLabel(sender: UITapGestureRecognizer) {
        let numeroLabel = self.numeroLabel.text!;
        let numero = numeroLabel.replacingOccurrences(of: " ", with: "");
        guard let number = URL(string: "telprompt://622" + numero) else { return };
        UIApplication.shared.open(number, options: [:], completionHandler: nil);
    }
    
    func didTapPaginaLabel(sender: UITapGestureRecognizer){
        let url = paginaLabel.text!;
        UIApplication.shared.open(NSURL(string: url) as! URL, options: [:], completionHandler: nil);
    }
}

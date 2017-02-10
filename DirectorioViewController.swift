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
            let ubicacionDependencia: CLLocationCoordinate2D?
            let pLat = dependencia.latitud
            let pLong = dependencia.longitud
            let center = CLLocationCoordinate2D(latitude: pLat, longitude: pLong)
            
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            
            self.mapView.setRegion(region, animated: true)
            
            ubicacionDependencia = CLLocationCoordinate2D(latitude: pLat, longitude: pLong);
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = ubicacionDependencia!
            annotation.title = "\(dependencia.nombre)"
            mapView.addAnnotation(annotation)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        numeroLabel.isUserInteractionEnabled = true
        let tapNumero: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapNumeroLabel))
        numeroLabel.addGestureRecognizer(tapNumero)
        tapNumero.delegate = self
        
        paginaLabel.isUserInteractionEnabled = true
        let tapPagina: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapPaginaLabel))
        paginaLabel.addGestureRecognizer(tapPagina)
        tapPagina.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    //MARK: - Acciones
    
    func didTapNumeroLabel(sender: UITapGestureRecognizer) {
        let numeroLabel = self.numeroLabel.text!
        let numero = numeroLabel.replacingOccurrences(of: " ", with: "")
        guard let number = URL(string: "telprompt://622" + numero) else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    
    func didTapPaginaLabel(sender: UITapGestureRecognizer){
        let url = paginaLabel.text!;
        print("\(url)")
        UIApplication.shared.open(NSURL(string: url) as! URL, options: [:], completionHandler: nil)
    }
}

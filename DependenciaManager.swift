//
//  DirectorioManager.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 08/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import Foundation

protocol DependenciaManagerDelegate {
    func didLoadDirectorio();
}

class DependenciaManager {
    var directorio = [Dependencia]();
    var delegate : DependenciaManagerDelegate? = nil
    func cargarDependencias(){
            
        let directorio : String = "http://g6.guaymas.gob.mx/reporteciudadano/dependenciasweb.php?q=todos";
        let url = URL(string: directorio)!;
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("data was nil?");
                return
            }
            
            let json = JSON(data: data);
            
            let directorioJSON = json["data"].array!
            
            for dependencia in directorioJSON {
                let nombre = dependencia["nombre"].string;
                var telefono = dependencia["telefono"].string;
                var direccion = dependencia["direccion"].string;
                var pagina = dependencia["web"].string;
                var latitud = dependencia["latitud"].double;
                var longitud = dependencia["longitud"].double;
                
                if (telefono == "" || telefono == nil) {
                    telefono = "Sin telefono";
                }
                if (direccion == "" || direccion == nil) {
                    direccion = "Sin Direccion";
                }
                if (pagina == "#" || pagina == "" || pagina == nil) {
                    pagina = "http://guaymas.gob.mx/";
                }
                if (latitud == 0 || latitud == nil) {
                    latitud = 27.923371;
                }
                if (longitud == 0 || longitud == nil) {
                    longitud = -110.889612;
                }
                
                let dependencia = Dependencia(nombre: nombre!, telefono: telefono!, direccion: direccion!, pagina: pagina!, latitud: latitud!, longitud: longitud!)
                self.directorio.append(dependencia);
            } //End for
            
            if let delegate = self.delegate {
                DispatchQueue.main.async {
                    delegate.didLoadDirectorio();
                }
            }
        }
        session.resume()
    }
    
}

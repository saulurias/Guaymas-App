//
//  ReporteManager.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 20/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import Foundation

class ReporteManager{
    func postJSON(reporte : Reporte){
        var request = URLRequest(url: URL(string: "http://g6.guaymas.gob.mx/reporteciudadano/enviar_reporte.php")!)
        
        request.httpMethod = "POST"
        
        
        
        
        let boundary = "Boundary-\(NSUUID().uuidString)"
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        
        
        //let postString = "nombre=Prueba&correo=prueba@swift.com&telefono=6221181006&edad=21"
        let postString = "\("nombre=\(reporte.interesado)&medio=\(reporte.medio)&dir=\(reporte.direccion)&colonia=\(reporte.colonia)&tel=\(reporte.telefono)&email=\(reporte.correo)&asunto=\(reporte.asunto)&long=\(reporte.longitud)&lat=\(reporte.latitud)&tipo=OTRO)&foto=\(reporte.foto)"))";
        
        
        request.httpBody = postString.data(using: .utf8)
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else{
                print("error\(error)")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("Status code should be 200, but is \(httpStatus.statusCode)")
                print("Response: \(response!)")
            }
            
            let responseString = String(data: data, encoding: .utf8);
            print("responseString\(responseString)");
            
            
            print(postString);
            
            
            
            let json = JSON(data: data);
            print("NÚMERO DE FOLIO \(json["folio"].int!)");
            
        
        }
    
        task.resume();
    }

}

//
//  ReporteManager.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 20/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import Foundation

protocol ReporteManagerDelegate {
    func folioObtenido();
}


class ReporteManager{
    
    var folio = Int();
    var delegate : ReporteManagerDelegate? = nil
    
    func enviarReporte(reporte : Reporte){
        var request = URLRequest(url: URL(string: "http://g6.guaymas.gob.mx/reporteciudadano/enviar_reporte.php")!)
        
        
        
        request.httpMethod = "POST"
        
        let boundary = "Boundary-\(NSUUID().uuidString)"
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let postString = "\("nombre=\(reporte.interesado)&medio=\(reporte.medio)&dir=\(reporte.direccion)&colonia=\(reporte.colonia)&tel=\(reporte.telefono)&email=\(reporte.correo)&asunto=\(reporte.asunto)&long=\(reporte.longitud)&lat=\(reporte.latitud)&tipo=\(reporte.tipo))&foto=\(reporte.foto)"))";
        
        
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
            
            
            
            let json = JSON(data: data);
            self.folio = json["folio"].int!
            
            if let delegate = self.delegate {
                DispatchQueue.main.async {
                    delegate.folioObtenido();
                }
            }
            
            
            
        }
        
        task.resume();
    }
    
}

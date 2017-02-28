//
//  EventoManager.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 06/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import Foundation
import UIKit

protocol EventoManagerDelegate {
    func eventosCargados();
}

class EventoManager{
    
    var eventos = [Evento]();
    var delegate : EventoManagerDelegate? = nil
    
    func cargarEventos(estado : String){
        let eventos : String = "http://g6.guaymas.gob.mx/eventos/peticiones.php?calendario=\(estado)";
        let url = URL(string: eventos)!;
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("data was nil?");
                return
            }
            
            let json = JSON(data: data);
            
            let eventosJSON = json[].array!
            
            if(eventosJSON[0] != false){
                for evento in eventosJSON {
                    let titulo = evento["nombre_evento"].string;
                    let descripcion = evento["desc"].string;
                    let organiza = evento["organiza"].string;
                    let lugar = evento["lugar"].string;
                    let fecha = evento["fecha"].string;
                    let hora = evento["hora"].string;
                    let contacto = evento["contacto"].string;
                    
                    
                    let imagen = evento["imagen"].string;
                    var url = String();
                    
                    url = "http://eventos.guaymas.gob.mx/images/eventos/\(imagen!)";
                    
                    let evento = Evento(titulo: titulo!,
                                        descripcion: descripcion!,
                                        organiza: organiza!,
                                        lugar: lugar!,
                                        fecha: fecha!,
                                        hora: hora!,
                                        contacto: contacto!,
                                        url: url);
                    
                    self.eventos.append(evento);
                    
                }//End for
                
                
            }
            if let delegate = self.delegate {
                DispatchQueue.main.async {
                    delegate.eventosCargados();
                }
            }
            
        }//End Session
        session.resume();
    }//End cargarEventos()
}

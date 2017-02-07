//
//  EventoManager.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 06/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import Foundation
protocol EventoManagerDelegate {
    func didLoadEventos();
}

class EventoManager{
    
    var eventos = [Evento]();
    var delegate : EventoManagerDelegate? = nil
    
    func cargarEventos(){
        let eventos : String = "http://g6.guaymas.gob.mx/eventos/peticiones.php?noticias=true&pagina=1&cantidad=5";
        let url = URL(string: eventos)!;
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("data was nil?");
                return
            }
            
            let json = JSON(data: data);
            
            for index in 0...4 {
                
                let titulo = json["posts"]["\(index)"]["titulo"].string;
                let descripcion = json["posts"]["\(index)"]["titulo"].string;
                let organiza = json["posts"]["\(index)"]["categoria"].string;
                let lugar = json["posts"]["\(index)"]["estado"].string;
                let fecha = json["posts"]["\(index)"]["fecha"].string;
                let hora = json["posts"]["\(index)"]["fecha"].string;
                let contacto = json["posts"]["\(index)"]["categoria"].string;
                let url = json["posts"]["\(index)"]["imagen"].string;
                
                let evento = Evento(titulo: titulo!, descripcion: descripcion!, organiza: organiza!, lugar: lugar!, fecha: fecha!, hora: hora!, contacto: contacto!, url: url!);
                self.eventos.append(evento);
            } //End for
            
            if let delegate = self.delegate {
                DispatchQueue.main.async {
                    delegate.didLoadEventos()
                }
            }
            
            print(self.eventos.count)
            
        }
        session.resume()
    }
}

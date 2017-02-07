//
//  NoticiaManager.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 03/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import Foundation


protocol NoticiaManagerDelegate {
    func didLoadNoticias();
}

class NoticiaManager{
    
    var noticias = [Noticia]();
    var delegate : NoticiaManagerDelegate? = nil
    
    func cargarNoticias(){
        let noticias : String = "http://g6.guaymas.gob.mx/eventos/peticiones.php?noticias=true&pagina=1&cantidad=5";
        let url = URL(string: noticias)!;
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("data was nil?");
                return
            }
            
            let json = JSON(data: data);
            
            print("El número de json son: \(json.count)");
            
            for index in 0...4 {

                let titulo = json["posts"]["\(index)"]["titulo"].string;
                let fecha = json["posts"]["\(index)"]["fecha"].string;
                let contenido = json["posts"]["\(index)"]["contenido"].string;
                let url = json["posts"]["\(index)"]["imagen"].string;
                
                let noticia = Noticia(titulo: titulo!,
                                      fecha: fecha!,
                                      contenido: contenido!,
                                      url: url!);
                self.noticias.append(noticia);
            } //End for
            
            if let delegate = self.delegate {
                DispatchQueue.main.async {
                    delegate.didLoadNoticias()
                }
            }
            
            print(self.noticias.count)
            
        }
        session.resume()
    }
}

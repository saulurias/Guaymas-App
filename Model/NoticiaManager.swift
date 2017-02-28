//
//  NoticiaManager.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 03/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import Foundation


protocol NoticiaManagerDelegate {
    func noticiasCargadas();
}

class NoticiaManager{
    
    var noticias = [Noticia]();
    var delegate : NoticiaManagerDelegate? = nil;
    
    func cargarNoticias(pagina: Int){
        let noticias : String = "http://g6.guaymas.gob.mx/eventos/peticiones.php?noticias_ios=true&pagina=\(pagina)&cantidad=5";
        let url = URL(string: noticias)!;
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("data was nil?");
                return
            }
            
            let json = JSON(data: data);
            
            let noticiasJSON = json["posts"].array!
            
            for noticia in noticiasJSON {
                let titulo = noticia["titulo"].string;
                let fecha = noticia["fecha"].string;
                let contenido = noticia["contenido"].string;
                let url = noticia["imagen"].string;
                
                let noticia = Noticia(titulo: titulo!,
                                      fecha: fecha!,
                                      contenido: contenido!,
                                      url: url!);
                
                self.noticias.append(noticia);
                
            } //End for
            
            if let delegate = self.delegate {
                DispatchQueue.main.async {
                    delegate.noticiasCargadas();
                }
            }
        }//End Session
        session.resume();
    }//End cargarNoticias()
}

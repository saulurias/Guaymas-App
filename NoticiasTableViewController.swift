//
//  NoticiasTableViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 17/01/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit




class NoticiasTableViewController: UITableViewController, NoticiaManagerDelegate {

    
    let noticiaManager = NoticiaManager();
        
    
    //MARK: - Noticia Manager Delegate
    func didLoadNoticias() {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noticiaManager.delegate = self;
        noticiaManager.cargarNoticias();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }

    
    
    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return noticiaManager.noticias.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaNoticia") as! NoticiaTableViewCell;

        let noticia = noticiaManager.noticias[indexPath.row];
        cell.tituloLabel.text = noticia.titulo;
        
        //Cargar imagen
        let url = URL(string: noticia.url)!
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                let image = UIImage(data: data!);
                cell.imagenNoticia.image = image;
                cell.setNeedsLayout();
            }
            
        }//End session
        session.resume()
        
        return cell;
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detallesNoticia" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let noticiasViewController = segue.destination as! NoticiasViewController
                noticiasViewController.noticia = noticiaManager.noticias[indexPath.row]
            }
        }
    }

}

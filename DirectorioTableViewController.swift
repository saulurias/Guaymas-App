//
//  DirectorioTableViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 08/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class DirectorioTableViewController: UITableViewController, DependenciaManagerDelegate {

    
    let directorioManager = DependenciaManager();
    
  
    
    //MARK: - Dependencia Manager Delegate
    func didLoadDirectorio() {
        tableView.reloadData();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        directorioManager.delegate = self;
        directorioManager.cargarDependencias();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return directorioManager.directorio.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaDirectorio") as! DirectorioTableViewCell

        let dependencia = directorioManager.directorio[indexPath.row];
        
        cell.nombreLabel.text = dependencia.nombre;
        cell.telefonoLabel.text = dependencia.telefono;
        cell.direccionLabel.text = dependencia.direccion;
        cell.linkLabel.text = dependencia.pagina; 
        
        
        return cell
    }
    
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}

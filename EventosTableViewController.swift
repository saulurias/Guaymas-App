//
//  EventosTableViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 06/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class EventosTableViewController: UITableViewController, EventoManagerDelegate {
    
    //Variables
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView();
    
    //Constantes
    let eventoManager = EventoManager();
    
    //MARK: - IBOutlets
    @IBOutlet weak var botonEstado: UIButton!
    
    //MARK: - Evento Manager Delegate
    func eventosCargados() {
        tableView.refreshControl?.endRefreshing();
        tableView.reloadData();
        activityIndicator.stopAnimating();
        botonEstado.isHidden = false;
    }
    
    func animacionCargando(){
        activityIndicator.center = self.view.center;
        activityIndicator.hidesWhenStopped = true;
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray;
        view.addSubview(activityIndicator);
    }
    
    //MARK: - Ciclo de vida de la Vista
    override func viewDidLoad() {
        super.viewDidLoad();
        animacionCargando();
        activityIndicator.startAnimating();
        eventoManager.delegate = self;
        eventoManager.cargarEventos(estado: "proximos");
        botonEstado.isHidden = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventoManager.eventos.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaEvento") as! EventosTableViewCell
        
        let evento = eventoManager.eventos[indexPath.row];
        
        cell.tituloLabel.text = evento.titulo;
        cell.fechaLabel.text = evento.fecha;
        cell.lugarLabel.text = evento.lugar;
        
        let url = URL(string: evento.url)
        if url != nil{
            //Cargar imagen
            let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                DispatchQueue.main.async {
                    let image = UIImage(data: data!);
                    cell.imagenEvento.image = image;
                    cell.setNeedsLayout();
                }
            }//End session
            session.resume()
        }
        return cell
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detallesEvento" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let eventosViewController = segue.destination as! EventoViewController
                eventosViewController.evento = eventoManager.eventos[indexPath.row]
            }
        }
    }
    
    //MARK: - Acciones
    @IBAction func botonEstadoPrecionado(_ sender: Any) {
            eventoManager.eventos.removeAll();
            tableView.refreshControl?.beginRefreshing();
            eventoManager.cargarEventos(estado: "anteriores");
            botonEstado.isHidden = true;
    }
    
}

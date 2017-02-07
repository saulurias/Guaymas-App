//
//  NoticiasTableViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 17/01/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit




class NoticiasTableViewController: UITableViewController, NoticiaManagerDelegate {

    //MARK: - IBOutlets
    
    @IBOutlet weak var botonAnterior: UIButton!
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView();
    let noticiaManager = NoticiaManager();
    var pagina = 1;
    
    //MARK: - Noticia Manager Delegate
    func didLoadNoticias() {
        activityIndicator.stopAnimating();
        UIApplication.shared.endIgnoringInteractionEvents();
        tableView.reloadData();
    }
    
    func animacionCargando(){
        activityIndicator.center = self.view.center;
        activityIndicator.hidesWhenStopped = true;
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray;
        view.addSubview(activityIndicator);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        animacionCargando();
        activityIndicator.startAnimating();
        UIApplication.shared.beginIgnoringInteractionEvents();
        noticiaManager.delegate = self;
        noticiaManager.cargarNoticias(pagina: pagina);
        botonAnterior.isHidden = true;
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
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detallesNoticia" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let noticiasViewController = segue.destination as! NoticiasViewController
                noticiasViewController.noticia = noticiaManager.noticias[indexPath.row]
            }
        }
    }
    
    //MARK: - Aciones Boton
    
    @IBAction func botonSiguientePrecionado(_ sender: Any) {
        pagina+=1;
        noticiaManager.noticias.removeAll();
        noticiaManager.cargarNoticias(pagina: pagina);
        activityIndicator.startAnimating();
        UIApplication.shared.beginIgnoringInteractionEvents();
        botonAnterior.isHidden = false;
    }
    
    @IBAction func botonAnteriorPrecionado(_ sender: Any) {
        pagina-=1;
        activityIndicator.startAnimating();
        UIApplication.shared.beginIgnoringInteractionEvents();
        if pagina <= 1 {
            pagina = 1;
            botonAnterior.isHidden = true;
        }else{
            botonAnterior.isHidden = false;
        }
        
        
        noticiaManager.noticias.removeAll();
        noticiaManager.cargarNoticias(pagina: pagina);
    }
    
    

}

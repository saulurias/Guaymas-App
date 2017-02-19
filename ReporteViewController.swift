//
//  ReporteViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 10/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class ReporteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var pickedImaged: UIImageView!
    
    @IBOutlet weak var botonBache: UIButton!
    @IBOutlet weak var botonAlumbrado: UIButton!
    @IBOutlet weak var botonOtro: UIButton!
    
    @IBOutlet weak var botonEnviarReporte: UIButton!
    @IBOutlet weak var botonTomarFoto: UIButton!
    @IBOutlet weak var botonGaleria: UIButton!
    //MARK: - Ciclo de vida de la aplicacion
    
    override func viewDidLoad() {
        super.viewDidLoad();
        diseñarBotones();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    
    //MARK: - Acciones Bache, Alumbrado, Otro..

    @IBAction func botonBacheSeleccionado(_ sender: Any) {
        botonBache.setImage(#imageLiteral(resourceName: "bache"), for: .normal);
        botonAlumbrado.setImage(#imageLiteral(resourceName: "grayscale_alumbrado"), for: .normal);
        botonOtro.setImage(#imageLiteral(resourceName: "grayscale_otro"), for: .normal);
    }
    
    @IBAction func botonAlumbradoSeleccionado(_ sender: Any) {
        botonBache.setImage(#imageLiteral(resourceName: "grayscale_bache"), for: .normal);
        botonAlumbrado.setImage(#imageLiteral(resourceName: "alumbrado"), for: .normal);
        botonOtro.setImage(#imageLiteral(resourceName: "grayscale_otro"), for: .normal);
    }
  
    @IBAction func botonOtroSeleccionado(_ sender: Any) {
        botonBache.setImage(#imageLiteral(resourceName: "grayscale_bache"), for: .normal);
        botonAlumbrado.setImage(#imageLiteral(resourceName: "grayscale_alumbrado"), for: .normal);
        botonOtro.setImage(#imageLiteral(resourceName: "otro"), for: .normal);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - Acciones Foto
    @IBAction func cameraBtnAction(_ sender: UIButton) {
        if(  UIImagePickerController.isSourceTypeAvailable(.camera)){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .camera
            self.present(myPickerController, animated: true, completion: nil)
        }else{
            let actionController: UIAlertController = UIAlertController(title: "Camara no disponible",message: "", preferredStyle: .alert)
            let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void     in
            }
            
            actionController.addAction(cancelAction)
            self.present(actionController, animated: true, completion: nil)
            
        }
    }
    
    
    @IBAction func photoGalleryAction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
 
    @IBAction func saveBtn(_ sender: UIButton) {
        let imageData = UIImageJPEGRepresentation(pickedImaged.image!, 0.6)
        let compressedJPEGImage = UIImage(data:imageData!)
        
        UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil)
        
    }
     
    
    // funcion
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject: AnyObject]) {
        pickedImaged.image = image
        self.dismiss(animated: true, completion: nil);
    }
    
    func saveNotice(){
        let alertController = UIAlertController(title: "Image saved", message: "Your picture was successfully save", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func diseñarBotones(){
        botonTomarFoto.layer.cornerRadius = 4;
        botonGaleria.layer.cornerRadius = 4;
        botonEnviarReporte.layer.cornerRadius = 4;
    }
}


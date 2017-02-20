//
//  ReporteViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 10/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class ReporteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var pickedImaged: UIImageView!
    
    @IBOutlet weak var botonBache: UIButton!
    @IBOutlet weak var botonAlumbrado: UIButton!
    @IBOutlet weak var botonOtro: UIButton!
    
    @IBOutlet weak var botonEnviarReporte: UIButton!
    @IBOutlet weak var botonTomarFoto: UIButton!
    @IBOutlet weak var botonGaleria: UIButton!
    
    @IBOutlet weak var descripcionTextField: UITextField!
    @IBOutlet weak var interesadoTextField: UITextField!
    @IBOutlet weak var telefonoTextField: UITextField!
    @IBOutlet weak var correoTextField: UITextField!
    @IBOutlet weak var direccionTextField: UITextField!
    @IBOutlet weak var coloniaTextField: UITextField!
    @IBOutlet weak var direccionReporteTextField: UITextField!
    
    
    

    
    
    //MARK: - Ciclo de vida de la aplicacion
    
    override func viewDidLoad() {
        super.viewDidLoad();
        diseñarBotones();
        textFieldsDelegates();
        self.hideKeyboard();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    
    //MARK: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstReponders(); 
        return true;
    }
    
    func firstReponders(){
        descripcionTextField.resignFirstResponder();
        interesadoTextField.resignFirstResponder();
        telefonoTextField.resignFirstResponder();
        correoTextField.resignFirstResponder();
        direccionTextField.resignFirstResponder();
        direccionReporteTextField.resignFirstResponder();
        coloniaTextField.resignFirstResponder();
    }
    
    func textFieldsDelegates(){
        descripcionTextField.delegate = self;
        interesadoTextField.delegate = self;
        telefonoTextField.delegate = self;
        correoTextField.delegate = self;
        direccionTextField.delegate = self;
        direccionReporteTextField.delegate = self;
        coloniaTextField.delegate = self;
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
    
    
    
    
    //MARK: - Acciones Enviar Reporte
    
    @IBAction func enviarReporte(_ sender: Any) {
        validarTexto();
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
     
    
    //MARK: - Funciones
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject: AnyObject]) {
        pickedImaged.image = image
        self.dismiss(animated: true, completion: nil);
    }
    

    
    func diseñarBotones(){
        botonTomarFoto.layer.cornerRadius = 4;
        botonGaleria.layer.cornerRadius = 4;
        botonEnviarReporte.layer.cornerRadius = 4;
    }
    
    
    func validarTexto(){
        var validacion = true;
        if (descripcionTextField.text?.isEmpty)! {
            descripcionTextField.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1);
            validacion = false;
        }
        if (interesadoTextField.text?.isEmpty)! {
            interesadoTextField.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1);
            validacion = false;
        }
        if (telefonoTextField.text?.isEmpty)! {
            telefonoTextField.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1);
            validacion = false;
        }
        if (direccionTextField.text?.isEmpty)! {
            direccionTextField.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1);
            validacion = false;
        }
        if (coloniaTextField.text?.isEmpty)! {
            coloniaTextField.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1);
            validacion = false;
        }
        if (direccionReporteTextField.text?.isEmpty)! {
            direccionReporteTextField.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1);
            validacion = false;
        }
        
        if validacion == false {
            mostrarAdvertencia();
            validacion = true;
        }
        
    }
    
    func mostrarAdvertencia(){
        let alertController = UIAlertController(title: "Campos Requeridos", message: "Favor de llenar todos los campos", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}


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
    
    //Image
    @IBOutlet weak var pickedImaged: UIImageView!
    
    //Buttons
    @IBOutlet weak var botonBache: UIButton!
    @IBOutlet weak var botonAlumbrado: UIButton!
    @IBOutlet weak var botonOtro: UIButton!
    @IBOutlet weak var botonEnviarReporte: UIButton!
    @IBOutlet weak var botonTomarFoto: UIButton!
    @IBOutlet weak var botonGaleria: UIButton!
    
    //TextFields
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
        if(validarTexto()){
            
            let imageData = UIImageJPEGRepresentation(pickedImaged.image!, 1)
            
            if(imageData==nil)  { return; }
            
            
            let reporte = Reporte(medio: "MOVIL", interesado: interesadoTextField.text!, direccion: direccionTextField.text!, colonia: coloniaTextField.text!, telefono: telefonoTextField.text!, correo: correoTextField.text!, asunto: descripcionTextField.text!, longitud: -110.889612, latitud: 27.923371, foto: imageData!);
            
            let reporteCompleo = ReporteManager();
            reporteCompleo.postJSON(reporte: reporte);
            
            let alertController = UIAlertController(title: "Reporte Enviado", message: "Gracias por su colaboración", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                (result : UIAlertAction) -> Void in
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        
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
    
    
    func validarTexto() -> Bool{
        var validacion = true;
        let redBorder : UIColor = UIColor.red;
        let whiteBorder : UIColor = UIColor.white;
        
        if (descripcionTextField.text?.isEmpty)! {
            descripcionTextField.layer.borderColor = redBorder.cgColor;
            descripcionTextField.layer.borderWidth = 1.0;
            validacion = false;
        }else {
            descripcionTextField.layer.borderColor = whiteBorder.cgColor;
        }
        if (interesadoTextField.text?.isEmpty)! {
            interesadoTextField.layer.borderColor = redBorder.cgColor;
            interesadoTextField.layer.borderWidth = 1.0;
            validacion = false;
        }else {
            interesadoTextField.layer.borderColor = whiteBorder.cgColor;
        }
        if (telefonoTextField.text?.isEmpty)! {
            telefonoTextField.layer.borderColor = redBorder.cgColor;
            telefonoTextField.layer.borderWidth = 1.0;
            validacion = false;
        }else {
            telefonoTextField.layer.borderColor = whiteBorder.cgColor;
        }
        if (direccionTextField.text?.isEmpty)! {
            direccionTextField.layer.borderColor = redBorder.cgColor;
            direccionTextField.layer.borderWidth = 1.0;
            validacion = false;
        }else {
            direccionTextField.layer.borderColor = whiteBorder.cgColor;
        }
        if (coloniaTextField.text?.isEmpty)! {
            coloniaTextField.layer.borderColor = redBorder.cgColor;
            coloniaTextField.layer.borderWidth = 1.0;
            validacion = false;
        }else {
            coloniaTextField.layer.borderColor = whiteBorder.cgColor;
        }
        if (direccionReporteTextField.text?.isEmpty)! {
            direccionReporteTextField.layer.borderColor = redBorder.cgColor;
            direccionReporteTextField.layer.borderWidth = 1.0;
            validacion = false;
        }else {
            direccionTextField.layer.borderColor = whiteBorder.cgColor;
        }
        
        if validacion == false {
            mostrarAdvertencia();
            return false;
        }else {
            return true;
        }
    }
    
    func mostrarAdvertencia(){
        let alertController = UIAlertController(title: "Campos Requeridos", message: "Favor de llenar todos los campos", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil);
    }
    
}


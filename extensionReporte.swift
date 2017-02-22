//
//  extensionReporte.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 19/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//


import UIKit

extension ReporteViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(ReporteViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
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
        if (direccionReporteTextField.text?.isEmpty)! {
            direccionReporteTextField.layer.borderColor = redBorder.cgColor;
            direccionReporteTextField.layer.borderWidth = 1.0;
            validacion = false;
        }else {
            direccionTextField.layer.borderColor = whiteBorder.cgColor;
        }
        
        if(coloniaSeleccionada == 0){
            coloniaPicker.layer.borderColor = redBorder.cgColor;
            coloniaPicker.layer.borderWidth = 1.0;
            validacion = false;
        }else {
            coloniaPicker.layer.borderColor = whiteBorder.cgColor;
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
        alertController.addAction(okAction);
        self.present(alertController, animated: true, completion: nil);
    }
}

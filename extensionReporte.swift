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
}

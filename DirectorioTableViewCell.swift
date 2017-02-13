//
//  DirectorioTableViewCell.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 08/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class DirectorioTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var telefonoLabel: UILabel!
    @IBOutlet weak var direccionLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib();
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);
    }

    //MARK: - Acciones
    @IBAction func botonLlamarPresionado(_ sender: Any) {
        let numeroLabel = telefonoLabel.text!;
        let numero = numeroLabel.replacingOccurrences(of: " ", with: "");
        
        guard let number = URL(string: "telprompt://622" + numero) else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil);
    }
}

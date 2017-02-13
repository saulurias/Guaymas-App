//
//  NoticiaTableViewCell.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 03/02/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class NoticiaTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imagenNoticia: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib();
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);

    }

}

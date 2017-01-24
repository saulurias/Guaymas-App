//
//  Noticias.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 17/01/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import Foundation

class Noticias {
    let title : String;
    let date : String;
    let content : String;
    let url : String;
    
    init (
        title: String,
        date: String,
        content: String,
        url: String
        ){
        self.title = title
        self.date = date
        self.content = content
        self.url = url
    }
}

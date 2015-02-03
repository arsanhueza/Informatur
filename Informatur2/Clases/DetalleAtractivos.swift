//
//  DetalleAtractivos.swift
//  Informatur
//
//  Created by Arturo Sanhueza on 20-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

import UIKit

class DetalleAtractivos: UIViewController,UIScrollViewDelegate {

    var scroll = UIScrollView()
    var ancho = CGFloat()
    var alto = CGFloat()

    var imagen = UIImageView()
    var titulo = UILabel()
    var contenido = UITextView()
    
    var stringTitulo :NSString!
    var stringContenido :NSString!
    var stringImagen :NSString!

override func viewDidLoad() {
    
    self.ancho = self.view.frame.width
    self.alto = self.view.frame.height
    self.scroll.delegate = self
    self.scroll.frame = self.view.frame
    self.scroll.contentSize = CGSizeMake(self.view.frame.width,0)
    self.view.addSubview(self.scroll)
    
    self.ponFotito()
    self.ponTitulengue()
    self.ponContenio()

    }
    
    func ponFotito(){
    
        var screenAltura = self.view.frame.height/568
        self.imagen.frame = CGRectMake(0, 0, self.view.frame.width, 220 * screenAltura)
        self.imagen.contentMode = .ScaleAspectFill
        self.imagen.image = UIImage(named:self.stringImagen)
        self.scroll.addSubview(self.imagen)

    }
    
    func ponTitulengue(){
    
        self.titulo.frame = CGRectMake(0, self.imagen.frame.height, self.view.frame.width, 60)
        self.titulo.text = self.stringTitulo
        self.titulo.numberOfLines = 2
        self.titulo.textAlignment = NSTextAlignment.Center
        self.titulo.font = UIFont(name: "Helvetica", size: 15)
//Revise
//        self.titulo.sizeToFit()
//        self.titulo.layoutIfNeeded()
        
        self.scroll.addSubview(self.titulo)
    }
    func ponContenio(){
        
        self.contenido.frame = CGRectMake(15,self.imagen.frame.height+40, self.view.frame.width-30, 0)
        self.contenido.text = self.stringContenido
        self.contenido.editable = false
        self.contenido.scrollEnabled = false
        self.contenido.textAlignment = NSTextAlignment.Left
        self.contenido.font = UIFont(name: "Helvetica", size: 13)
        self.contenido.sizeToFit()
        self.contenido.layoutIfNeeded()
        self.scroll.contentSize = CGSizeMake(self.view.frame.width,self.imagen.frame.height+40 + self.contenido.bounds.height)

        self.scroll.addSubview(self.contenido)
    }

}


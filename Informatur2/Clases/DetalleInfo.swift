//
//  FirstViewController.swift
//  Informatur
//
//  Created by Arturo Sanhueza on 20-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

import UIKit

class DetalleInfo: UIViewController,UIScrollViewDelegate {
    var ancho = CGFloat()
    var alto = CGFloat()
    
    var textoTitulo :NSString!
    var stringImagen :NSString!
    var imagen = UIImageView()
    var scroll = UIScrollView()
    var titulo = UILabel()
    var texto = UITextView()
    var descripcion :NSString!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ancho = self.view.frame.width
        self.alto = self.view.frame.height
        self.scroll.delegate = self
        self.scroll.frame = self.view.frame
        scroll.contentSize = CGSizeMake(self.view.frame.width,0)
        self.view.addSubview(self.scroll)

        self.ponFotito()
        self.titulengue()
        self.primerContenio()
           }
    
    func ponFotito(){
        
        var screenAltura = self.view.frame.height/568
        var imagenValos = screenAltura*220
        self.imagen.frame = CGRectMake(0, 0, self.view.frame.width, imagenValos)
        self.imagen.image = UIImage(named:self.stringImagen)
        self.scroll.addSubview(self.imagen)
        
    }

    func titulengue(){
        self.titulo.frame = CGRectMake(0, self.imagen.frame.height, self.view.frame.width, 35)
        self.titulo.text = self.textoTitulo
        self.titulo.textAlignment = NSTextAlignment.Center
        self.texto.font = UIFont(name: "Helvetica", size: 15)
        self.scroll.addSubview(self.titulo)
    }
    
    func primerContenio() {
        var porte = self.imagen.frame.height + self.titulo.frame.height
        self.texto.frame = CGRectMake(15, porte,ancho-30, 0)
        self.texto.scrollEnabled = false
        self.texto.editable = false
        self.texto.textAlignment = NSTextAlignment.Left
        self.texto.font = UIFont(name: "Helvetica", size: 13)
        
        var attributedString = NSMutableAttributedString(string:self.descripcion)
        attributedString.addAttribute(NSKernAttributeName, value:1.4,range:(NSMakeRange(0,500)))
        self.texto.text = attributedString.string
        self.texto.sizeToFit()
        self.texto.layoutIfNeeded()
        
        self.scroll.addSubview(self.texto)
        self.scroll.contentSize = CGSizeMake(self.view.frame.width,porte+self.texto.bounds.height)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


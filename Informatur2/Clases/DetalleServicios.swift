//
//  DetalleAtractivos.swift
//  Informatur
//
//  Created by Arturo Sanhueza on 20-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

import UIKit

class DetalleServicios: UIViewController,UIScrollViewDelegate {

    var ancho = CGFloat()
    var alto = CGFloat()
    var scroll = UIScrollView()

    
    var imagen = UIImageView()
    var imagenFono = UIImageView()
    var imagenMail = UIImageView()
    var imagenWeb = UIImageView()

    var titulo = UILabel()
    var web = UITextView()
    var mail = UITextView()
    var fono = UITextView()
    
    var contenido = UITextView()

    var stringTitulo :NSString!
    var stringWeb :NSString!
    var stringMail :NSString!
    var stringFono :NSString!
    var stringContenido :NSString!
    var stringImagen :NSString!

override func viewDidLoad() {
    
    self.ancho = self.view.frame.width
    self.alto = self.view.frame.height
    self.scroll.delegate = self
    self.scroll.frame = self.view.frame
    scroll.contentSize = CGSizeMake(self.view.frame.width,0)
    self.view.addSubview(self.scroll)

    
    self.ponFotito()
    self.ponTitulengue()
    self.ponWeb()
    self.ponMail()
    self.ponFono()
    self.ponContenio()
}
    
    func ponFotito(){
    
        var screenAltura = self.view.frame.height/568
        var imagenValos = screenAltura*220
        self.imagen.frame = CGRectMake(0, 0, self.view.frame.width, imagenValos)
        self.imagen.contentMode = .ScaleAspectFill
        self.imagen.image = UIImage(named:self.stringImagen)
        self.scroll.addSubview(self.imagen)

    }
    
    func ponTitulengue(){
    
        
        self.titulo.frame = CGRectMake(40, self.imagen.frame.height, self.view.frame.width, 60)
        self.titulo.text = self.stringTitulo
        self.titulo.numberOfLines = 2
        self.titulo.textAlignment = NSTextAlignment.Left
        self.titulo.font = UIFont(name: "Helvetica", size: 15)

        self.scroll.addSubview(self.titulo)
}
    
    
    func ponWeb(){
        
         var altura = self.imagen.bounds.size.height + self.titulo.bounds.size.height
        
        self.web.frame = CGRectMake(40, altura, self.scroll.frame.width, 0)
        self.web.text = self.stringWeb
        self.web.textAlignment = NSTextAlignment.Left
        self.web.font = UIFont(name: "Helvetica", size: 13)
        self.web.sizeToFit()
        self.web.layoutIfNeeded()
        self.web.editable = false
        self.web.scrollEnabled = false
        self.web.dataDetectorTypes = .Link
        
        self.imagenWeb.frame = CGRectMake(5, self.web.frame.origin.y, 30, 30)
        self.imagenWeb.image = UIImage(named: "web.png")
        
        self.scroll.addSubview(self.imagenWeb)
        self.scroll.addSubview(self.web)
    }

    func ponMail(){
        
        var altura = self.imagen.bounds.size.height + self.titulo.bounds.size.height + self.web.bounds.height

        
        self.mail.frame = CGRectMake(40, altura, self.scroll.frame.width, 0)
        self.mail.text = self.stringMail
        self.mail.textAlignment = NSTextAlignment.Left
        self.mail.font = UIFont(name: "Helvetica", size: 13)
        self.mail.sizeToFit()
        self.mail.layoutIfNeeded()
        self.mail.editable = false
        self.mail.scrollEnabled = false
        self.mail.dataDetectorTypes = .All
        self.imagenMail.frame = CGRectMake(5, self.mail.frame.origin.y, 30, 30)
        self.imagenMail.image = UIImage(named: "mail.png")
        self.scroll.addSubview(self.imagenMail)
        self.scroll.addSubview(self.mail)
    }
//
    func ponFono(){
        
        var altura = self.imagen.bounds.size.height + self.titulo.bounds.size.height + self.web.bounds.height + self.mail.bounds.height

        self.fono.frame = CGRectMake(40,altura, 0, 0)
        self.fono.text = self.stringFono
        self.fono.textAlignment = NSTextAlignment.Left
        self.fono.font = UIFont(name: "Helvetica", size: 13)
        self.fono.sizeToFit()
        self.fono.layoutIfNeeded()
        self.fono.scrollEnabled = false
        self.fono.editable = false
        
        self.imagenFono.frame = CGRectMake(5, self.fono.frame.origin.y, 30, 30)
        self.imagenFono.image = UIImage(named: "contacto.png")

        self.scroll.addSubview(self.imagenFono)
        self.scroll.addSubview(self.fono)
    }

    
    func ponContenio(){
        
        var altura = self.imagen.bounds.size.height + self.titulo.bounds.size.height + self.web.bounds.height + self.mail.bounds.height + self.fono.bounds.height + self.contenido.bounds.height
        
        self.contenido.frame = CGRectMake(20,altura, self.view.frame.width-20, 0)
        self.contenido.text = self.stringContenido
        self.contenido.editable = false
        self.contenido.scrollEnabled = false
        self.contenido.textAlignment = NSTextAlignment.Left
        self.contenido.font = UIFont(name: "Helvetica", size: 13)
        self.contenido.sizeToFit()
        self.contenido.layoutIfNeeded()

        self.scroll.addSubview(self.contenido)
        scroll.contentSize = CGSizeMake(self.view.frame.width,self.imagen.bounds.size.height + self.titulo.bounds.size.height + self.web.bounds.height + self.mail.bounds.height + self.fono.bounds.height + self.contenido.bounds.height+20)

    }

}


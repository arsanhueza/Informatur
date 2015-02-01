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
    var web = UILabel()
    var mail = UILabel()
    var fono = UILabel()


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
    scroll.contentSize = CGSizeMake(self.view.frame.width,800)
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
    
        self.titulo.frame = CGRectMake(20, self.imagen.frame.height, self.view.frame.width, 60)
        self.titulo.text = self.stringTitulo
        self.titulo.numberOfLines = 2
        self.titulo.textAlignment = NSTextAlignment.Left
        self.titulo.font = UIFont(name: "Helvetica", size: 15)

        self.scroll.addSubview(self.titulo)
}
    
    
    func ponWeb(){
        
        self.web.frame = CGRectMake(40, self.titulo.center.y+30, self.view.frame.width-40, 30)
        self.web.text = self.stringWeb
        self.web.numberOfLines = 2
        self.web.textAlignment = NSTextAlignment.Left
        self.web.font = UIFont(name: "Helvetica", size: 13)
        
        self.imagenWeb.frame = CGRectMake(5, self.web.frame.origin.y, 30, 30)
        self.imagenWeb.image = UIImage(named: "web.png")
        
        self.scroll.addSubview(self.imagenWeb)
        self.scroll.addSubview(self.web)
    }

    func ponMail(){
        
        self.mail.frame = CGRectMake(40, self.web.center.y+30, self.view.frame.width-40, 30)
        self.mail.text = self.stringMail
        self.mail.numberOfLines = 2
        self.mail.textAlignment = NSTextAlignment.Left
        self.mail.font = UIFont(name: "Helvetica", size: 13)
        self.imagenMail.frame = CGRectMake(5, self.mail.frame.origin.y, 30, 30)
        self.imagenMail.image = UIImage(named: "mail.png")
        self.scroll.addSubview(self.imagenMail)
        self.scroll.addSubview(self.mail)
    }
//
    func ponFono(){
        
        self.fono.frame = CGRectMake(40,self.mail.center.y+30, self.view.frame.width-40, 30)
        self.fono.text = self.stringFono
        self.fono.numberOfLines = 2
        self.fono.textAlignment = NSTextAlignment.Left
        self.fono.font = UIFont(name: "Helvetica", size: 13)
        
        self.imagenFono.frame = CGRectMake(5, self.fono.frame.origin.y, 30, 30)
        self.imagenFono.image = UIImage(named: "contacto.png")

        self.scroll.addSubview(self.imagenFono)
        self.scroll.addSubview(self.fono)
    }

    
    func ponContenio(){
        
        self.contenido.frame = CGRectMake(20,self.fono.center.y+30, self.view.frame.width-20, 300)
        self.contenido.text = self.stringContenido
        self.contenido.editable = false
        self.contenido.textAlignment = NSTextAlignment.Left
        self.contenido.font = UIFont(name: "Helvetica", size: 13)
        
        
        
        self.scroll.addSubview(self.contenido)
    }

}


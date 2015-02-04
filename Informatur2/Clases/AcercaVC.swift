//
//  AcercaVC.swift
//  Informatur2
//
//  Created by Arturo Sanhueza on 03-02-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

import UIKit

class AcercaVC: UIViewController,UIScrollViewDelegate {
    var fotito = UIImageView()
    var scroll = UIScrollView()
    var contenido = UITextView()
    var titulo = UILabel()
    var web = UITextView()
    var mail = UITextView()
    var face = UIButton()
    var guia = UIButton()
    var managedObjectContext: NSManagedObjectContext? = nil
    var arra = NSArray()

    override func viewDidLoad() {
    self.title = NSLocalizedString("About us", comment: "")
    self.scroll.delegate = self
    self.scroll.frame = self.view.frame
    self.scroll.contentSize = CGSizeMake(self.view.frame.width,0)
    self.view.addSubview(self.scroll)
    self.fotito.image = UIImage(named: "info1.jpg")
    self.fotito.frame = CGRectMake(0, 0, 0, 0)
    self.fotito.sizeToFit()
    self.fotito.layoutIfNeeded()
    self.scroll.addSubview(self.fotito)
    
    self.llama()
    self.ponTitulengue()
    self.ponContenio()
    self.ponWeb()
    self.ponMail()

    }
    
    func llama(){
    
        var defolto = NSUserDefaults.standardUserDefaults()
        let idi = defolto.valueForKey("idioma") as NSString
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        self.managedObjectContext = appDelegate.managedObjectContext
        
        var error: NSError? = nil
        var fReq: NSFetchRequest = NSFetchRequest(entityName: "Info")
        fReq.predicate = NSPredicate(format: "facebook = %@", idi)
        var sorter: NSSortDescriptor = NSSortDescriptor(key: "facebook" , ascending: false)
        fReq.sortDescriptors = [sorter]
        fReq.returnsObjectsAsFaults = false
        self.arra  = self.managedObjectContext!.executeFetchRequest(fReq, error:&error)!

    }
    
    func ponTitulengue(){
        
        
        self.titulo.frame = CGRectMake(20, self.fotito.frame.height, self.view.frame.width, 50)
        self.titulo.text = NSLocalizedString("Quiene", comment: "")
        self.titulo.numberOfLines = 2
        self.titulo.textAlignment = NSTextAlignment.Left
        self.titulo.font = UIFont(name: "Helvetica", size: 15)
        
        self.scroll.addSubview(self.titulo)
    }
    
    func ponContenio(){
        
        var info = self.arra.objectAtIndex(0) as Info
        self.contenido.frame = CGRectMake(15,self.fotito.frame.height+40, self.view.frame.width-15, 0)
        var style = NSMutableParagraphStyle()
        style.lineSpacing = 6
        let attributes = [NSParagraphStyleAttributeName : style]
        self.contenido.attributedText = NSAttributedString(string: info.nombre, attributes:attributes)
        
        self.contenido.editable = false
        self.contenido.scrollEnabled = false
        self.contenido.textAlignment = NSTextAlignment.Left
        self.contenido.font = UIFont(name: "Helvetica", size: 13)
        self.contenido.sizeToFit()
        self.contenido.layoutIfNeeded()
        self.scroll.addSubview(self.contenido)
    }
    
    func ponWeb(){
        
        var info = self.arra.objectAtIndex(0) as Info
        self.web.frame = CGRectMake(15,self.fotito.frame.height+40+self.contenido.frame.height, self.view.frame.width-15, 0)
        var style = NSMutableParagraphStyle()
        style.lineSpacing = 6
        let attributes = [NSParagraphStyleAttributeName : style]
        self.web.attributedText = NSAttributedString(string: info.web, attributes:attributes)
        
        self.web.editable = false
        self.web.scrollEnabled = false
        self.web.dataDetectorTypes = .Link
        self.web.textAlignment = NSTextAlignment.Left
        self.web.font = UIFont(name: "Helvetica", size: 13)
        self.web.sizeToFit()
        self.web.layoutIfNeeded()
        self.scroll.addSubview(self.web)
    }
    func ponMail(){
        
        var info = self.arra.objectAtIndex(0) as Info
        self.mail.frame = CGRectMake(15,self.fotito.frame.height+40+self.contenido.frame.height+self.web.bounds.height, self.view.frame.width-15, 0)
        var style = NSMutableParagraphStyle()
        style.lineSpacing = 6
        let attributes = [NSParagraphStyleAttributeName : style]
        self.mail.attributedText = NSAttributedString(string: info.mail, attributes:attributes)
        
        self.mail.editable = false
        self.mail.scrollEnabled = false
        self.mail.dataDetectorTypes = .Link
        self.mail.textAlignment = NSTextAlignment.Left
        self.mail.font = UIFont(name: "Helvetica", size: 13)
        self.mail.sizeToFit()
        self.mail.layoutIfNeeded()
        self.scroll.contentSize = CGSizeMake(self.view.frame.width,self.fotito.frame.height+40 + self.contenido.bounds.height + self.web.bounds.height + self.mail.bounds.height)
        self.scroll.addSubview(self.mail)
    }

    

}

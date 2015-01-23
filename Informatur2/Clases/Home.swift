//
//  Home.swift
//  Informatur
//
//  Created by Arturo Sanhueza on 20-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

import UIKit
import Foundation

class Home: UIViewController,UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate {
    
    var imagen = UIImageView()
    var texto = UILabel()
    var arraya = NSArray()
    var tabla = UITableView()
    var managedObjectContext: NSManagedObjectContext? = nil
    var _fetchedResultsController: NSFetchedResultsController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.foto()
        self.title = "Home"
        self.tabla.delegate = self
        self.tabla.dataSource = self
        self.tabla.frame = CGRectMake(0, 286, self.view.frame.width, 144)
        self.tabla.layer.cornerRadius = 3.0
        self.tabla.scrollEnabled = false
        self.view.addSubview(self.tabla)
    }
    
    
    var fetchedResultsController: NSFetchedResultsController {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        let fetchRequest = NSFetchRequest()
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        self.managedObjectContext = appDelegate.managedObjectContext

        let entity = NSEntityDescription.entityForName("Bienvenida", inManagedObjectContext: self.managedObjectContext!)
        fetchRequest.entity = entity
        let sortDescriptor = NSSortDescriptor(key: "titulo", ascending: true)
        let sortDescriptors = [sortDescriptor]
        let predica = NSPredicate(format: "idioma = %@", "es")
        fetchRequest.predicate = predica

        fetchRequest.sortDescriptors = [sortDescriptor]
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        var error: NSError? = nil
        if !_fetchedResultsController!.performFetch(&error) {
            abort()
        }
        return _fetchedResultsController!
    }
    
  
    func foto(){
    
        self.imagen.frame = CGRectMake(0,64, self.view.frame.width, 221)
        self.imagen.image = UIImage(named:"bienvenida.jpg")
        self.view.addSubview(self.imagen)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 48.0
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sectionInfo = self.fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
        return sectionInfo.numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
        }
        let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as Bienvenida
        cell?.textLabel?.font = UIFont(name: "Helvetica", size: 15)
        cell?.textLabel?.text = object.titulo
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let info = self.storyboard?.instantiateViewControllerWithIdentifier("DetalleInfo") as DetalleInfo
        let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as Bienvenida
        info.textoTitulo = object.titulo
        info.descripcion = object.descripcion
        info.stringImagen = object.foto
        self.navigationController?.pushViewController(info, animated: true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

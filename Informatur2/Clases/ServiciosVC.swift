//
//  Servicios.swift
//  Informatur
//
//  Created by Arturo Sanhueza on 21-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

import UIKit

class ServiciosVC: UIViewController,UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate {
    
    var managedObjectContext: NSManagedObjectContext? = nil
    var _fetchedResultsController: NSFetchedResultsController? = nil

    
    var tabla = UITableView()

    override func viewDidLoad() {
        
    self.title = "Servicios"
    
    self.tabla.delegate = self
    self.tabla.dataSource = self
    self.tabla.frame = self.view.frame
    self.view.addSubview(self.tabla)
        
    }
    
    var fetchedResultsController: NSFetchedResultsController {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        let fetchRequest = NSFetchRequest()
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        self.managedObjectContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Servicios", inManagedObjectContext: self.managedObjectContext!)
        fetchRequest.entity = entity
        let sortDescriptor = NSSortDescriptor(key: "tipo", ascending: true)
        let sortDescriptors = [sortDescriptor]
        let predica = NSPredicate(format: "idioma = %@", "es")
        fetchRequest.predicate = predica
        fetchRequest.sortDescriptors = [sortDescriptor]
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath:"tipo", cacheName: nil)
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        var error: NSError? = nil
        if !_fetchedResultsController!.performFetch(&error) {
            abort()
        }
        return _fetchedResultsController!
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.fetchedResultsController.sections?.count ?? 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sectionInfo = self.fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
        return sectionInfo.numberOfObjects
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let sectionInfo = self.fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
        
        return sectionInfo.name
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
        let servicio = self.fetchedResultsController.objectAtIndexPath(indexPath) as Servicios

        cell!.textLabel!.text = servicio.nombre
        
        if(indexPath.section == 0){
            cell?.imageView?.image = UIImage(named: "hostal.png")

        
        }
      else if(indexPath.section == 1){
            
            cell?.imageView?.image = UIImage(named: "otros.png")
            
            
        }
        else{
        
        cell?.imageView?.image = UIImage(named: "comida.png")
        }
        return cell!
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let info = self.storyboard?.instantiateViewControllerWithIdentifier("DetalleServicios") as DetalleServicios
        let servicio = self.fetchedResultsController.objectAtIndexPath(indexPath) as Servicios

        info.stringImagen = servicio.foto

        info.stringTitulo = servicio.nombre
        info.stringWeb = servicio.web
        info.stringMail = servicio.mail
        info.stringFono = servicio.fono
        info.stringContenido = servicio.direccion

    
        self.navigationController?.pushViewController(info, animated: true)
    }
}


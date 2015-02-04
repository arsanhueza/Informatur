//
//  AtractivosVC.swift
//  Informatur
//
//  Created by Arturo Sanhueza on 20-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

import UIKit

class AtractivosVC: UIViewController,UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate {
    var tabla = UITableView()
    var imagen = UIImageView()
    var managedObjectContext: NSManagedObjectContext? = nil
    var _fetchedResultsController: NSFetchedResultsController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fotitoYtabla()

           }
    var fetchedResultsController: NSFetchedResultsController {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        var defolto = NSUserDefaults.standardUserDefaults()
        let idi = defolto.valueForKey("idioma") as NSString
        let fetchRequest = NSFetchRequest()
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        self.managedObjectContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Atractivos", inManagedObjectContext: self.managedObjectContext!)
        fetchRequest.entity = entity
        let sortDescriptor = NSSortDescriptor(key: "tipo", ascending: true)
        let sortDescriptors = [sortDescriptor]
        let predica = NSPredicate(format: "idioma = %@", idi)
        fetchRequest.predicate = predica
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: "tipo", cacheName: nil)
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        var error: NSError? = nil
        if !_fetchedResultsController!.performFetch(&error) {
            abort()
        }
        return _fetchedResultsController!
    }
  
    func fotitoYtabla(){
        
        var screenAltura = self.view.frame.height/568
        var imagenValos = screenAltura*220
        
        self.imagen.frame = CGRectMake(0, 64, self.view.frame.width, imagenValos)
        self.imagen.contentMode = .ScaleAspectFill
        self.imagen.image = UIImage(named: "atractivos.jpg")
        self.view.addSubview(self.imagen)
        
        self.title = NSLocalizedString("Atractivos", comment: "")
        self.tabla.delegate = self
        self.tabla.dataSource = self
        self.tabla.frame = CGRectMake(0, imagenValos+64, self.view.frame.width,self.view.frame.height - (imagenValos + 120))
        self.view.addSubview(self.tabla)

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 48.0
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
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        }
        
        let atractivo = self.fetchedResultsController.objectAtIndexPath(indexPath) as Atractivos
        cell?.textLabel?.font = UIFont(name: "Helvetica", size: 15)
        cell?.textLabel?.text = atractivo.nombre

        return cell!
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let info = self.storyboard?.instantiateViewControllerWithIdentifier("DetalleAtractivos") as DetalleAtractivos
        let atractivo = self.fetchedResultsController.objectAtIndexPath(indexPath) as Atractivos

            info.stringImagen = atractivo.imagen
            info.stringTitulo = atractivo.nombre
            info.stringContenido = atractivo.detalle
            self.navigationController?.pushViewController(info, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

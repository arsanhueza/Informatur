//
//  Servicios.swift
//  Informatur
//
//  Created by Arturo Sanhueza on 21-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

import UIKit

class Servicios: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var arrayaAlojamiento = NSArray()
    var arrayaComida = NSArray()
    var arrayaOtros = NSArray()
    
    
    var tabla = UITableView()

    override func viewDidLoad() {
        
    self.title = "Servicios"
        
    self.tabla.delegate = self
    self.tabla.dataSource = self
    self.tabla.frame = self.view.frame
    self.view.addSubview(self.tabla)
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        if(section == 0){
        
            return self.arrayaAlojamiento.count
        }
       else if(section == 1){
            
            return self.arrayaComida.count
        }
        else{
            return self.arrayaOtros.count
        }
    
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if(section == 0){
            
            return "Servicios de Hospedaje"
        }
        else if(section == 1){
            
          return  "Servicios Gastronómicos"
        }
        else{
            return "Otros Servicios"
        }

    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
        
        cell!.textLabel!.text = arrayaAlojamiento.objectAtIndex(indexPath.row) as NSString
        cell?.imageView?.image = UIImage(named: "hostal.png")
        
        return cell!
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let info = self.storyboard?.instantiateViewControllerWithIdentifier("DetalleServicios") as DetalleServicios
       
        
        self.navigationController?.pushViewController(info, animated: true)
    }
    

    
    
}


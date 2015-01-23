//
//  Servicios.h
//  Informatur2
//
//  Created by Arturo Sanhueza on 22-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Servicios : NSManagedObject

@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * foto;
@property (nonatomic, retain) NSString * web;
@property (nonatomic, retain) NSString * fono;
@property (nonatomic, retain) NSString * mail;
@property (nonatomic, retain) NSString * direccion;
//@property (nonatomic, retain) NSString * descripcion;
@property (nonatomic, retain) NSString * idioma;
@property (nonatomic, retain) NSManagedObject *mapa;

@end

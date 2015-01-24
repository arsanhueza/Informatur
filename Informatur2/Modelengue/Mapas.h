//
//  Mapas.h
//  Informatur2
//
//  Created by Arturo Sanhueza on 23-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Atractivos, Servicios;

@interface Mapas : NSManagedObject

@property (nonatomic, retain) NSString * detalle;
@property (nonatomic, retain) NSString * idioma;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSNumber * x;
@property (nonatomic, retain) NSNumber * y;
@property (nonatomic, retain) Atractivos *atractivo;
@property (nonatomic, retain) Servicios *servicio;

@end

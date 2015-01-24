//
//  Atractivos.h
//  Informatur2
//
//  Created by Arturo Sanhueza on 23-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Mapas;

@interface Atractivos : NSManagedObject

@property (nonatomic, retain) NSString * detalle;
@property (nonatomic, retain) NSString * idioma;
@property (nonatomic, retain) NSString * imagen;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) Mapas *mapa;

@end

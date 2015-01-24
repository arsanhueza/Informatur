//
//  Bienvenida.h
//  Informatur2
//
//  Created by Arturo Sanhueza on 23-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Bienvenida : NSManagedObject

@property (nonatomic, retain) NSString * descripcion;
@property (nonatomic, retain) NSString * foto;
@property (nonatomic, retain) NSString * idioma;
@property (nonatomic, retain) NSString * titulo;

@end

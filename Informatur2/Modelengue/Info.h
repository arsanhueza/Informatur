//
//  Info.h
//  Informatur2
//
//  Created by Arturo Sanhueza on 22-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Info : NSManagedObject

@property (nonatomic, retain) NSString * contacto;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * web;
@property (nonatomic, retain) NSString * mail;
@property (nonatomic, retain) NSString * facebook;
@property (nonatomic, retain) NSString * imagen;

@end

//
//  Student.h
//  ios-app
//
//  Created by Jimmy Wu on 2/10/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface Student : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSNumber *ID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *gpa;

@end

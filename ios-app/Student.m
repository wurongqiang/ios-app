//
//  Student.m
//  ios-app
//
//  Created by Jimmy Wu on 2/10/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import "Student.h"

@implementation Student

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{ @"ID" : @"id",
              @"name" : @"name",
              @"gpa" : @"gpa"
              };
}

@end

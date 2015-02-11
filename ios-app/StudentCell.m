//
//  StudentCell.m
//  ios-app
//
//  Created by Jimmy Wu on 2/11/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import "StudentCell.h"

@implementation StudentCell

-(void)layoutSubviews {
    [super layoutSubviews];
    self.avatar.layer.cornerRadius = CGRectGetWidth(self.avatar.frame)/2;
    self.avatar.layer.masksToBounds = YES;
}

@end
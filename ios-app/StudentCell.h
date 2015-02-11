//
//  StudentCell.h
//  ios-app
//
//  Created by Jimmy Wu on 2/11/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *GPA;

@end

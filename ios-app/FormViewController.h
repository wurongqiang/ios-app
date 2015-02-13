//
//  FormViewController.h
//  ios-app
//
//  Created by Jimmy Wu on 2/11/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@protocol FormViewDelegate

- (void)studentEdited;

@end

@interface FormViewController : UIViewController

@property (weak) id <FormViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *gpa;


@property (strong, nonatomic) NSNumber *currentID;
@property (strong, nonatomic) NSString *currentName;
@property (strong, nonatomic) NSNumber *currentGPA;


@end

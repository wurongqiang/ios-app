//
//  FormViewController.m
//  ios-app
//
//  Created by Jimmy Wu on 2/11/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import "FormViewController.h"
#import "StudentService.h"
#import "Student.h"

@interface FormViewController()

@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *gpa;

@end

@implementation FormViewController


- (IBAction)SaveStudent:(id)sender {
    Student *student = [[Student alloc]init];
    student.name = self.name.text;
    student.gpa = @([self.gpa.text doubleValue]);
    
    [StudentService saveStudent:student withCompletion:^(NSError *error) {
        if (!error) {
            [self.navigationController popViewControllerAnimated:TRUE];
        }
    }];
}


@end

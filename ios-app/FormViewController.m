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

@implementation FormViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.currentID) {
        self.name.text = self.currentName;
        self.gpa.text = [NSString stringWithFormat:@"%@", self.currentGPA];
    }
}

//- (IBAction)SaveStudent:(id)sender {
//    [self createStudent];
//}

- (IBAction)SaveStudent:(id)sender {
    if (self.currentID) {
        [self updateStudent];
    } else {
        [self createStudent];
    }
}

-(void)createStudent {
    Student *student = [[Student alloc]init];
    student.name = self.name.text;
    student.gpa = @([self.gpa.text doubleValue]);
    
    __weak __typeof(self) weakSelf = self;
    [StudentService createStudent:student withCompletion:^(NSError *error) {
        if (!error) {
            [weakSelf.navigationController popViewControllerAnimated:TRUE];
        }
    }];
}

-(void)updateStudent {
    Student *student = [[Student alloc]init];
    student.ID = self.currentID;
    student.name = self.name.text;
    student.gpa = @([self.gpa.text doubleValue]);
    
    __weak __typeof(self) weakSelf = self;
    [StudentService updateStudent:student withCompletion:^(NSError *error) {
        if (!error) {
            [weakSelf.navigationController popViewControllerAnimated:TRUE];
        }
    }];
}

@end

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
#import "SVProgressHUD.h"

@implementation FormViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.currentID) {
        self.name.text = self.currentName;
        self.gpa.text = [NSString stringWithFormat:@"%@", self.currentGPA];
    }
}

- (IBAction)saveStudent:(id)sender {
    if (self.currentID) {
        [self updateStudent];
    } else {
        [self createStudent];
    }
}

//- (IBAction)saveStudent:(id)sender {
//    [self createStudent];
//}

-(void)createStudent {
    Student *student = [[Student alloc]init];
    student.name = self.name.text;
    student.gpa = @([self.gpa.text doubleValue]);
    
    __weak __typeof(self) weakSelf = self;
    [SVProgressHUD show];
    [StudentService createStudent:student withCompletion:^(NSError *error) {
        if (!error) {
            [SVProgressHUD dismiss];
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
    [SVProgressHUD show];
    [StudentService updateStudent:student withCompletion:^(NSError *error) {
        if (!error) {
            [self.delegate studentEdited];
            [SVProgressHUD dismiss];
            [weakSelf.navigationController popViewControllerAnimated:TRUE];
        }
    }];
}

@end

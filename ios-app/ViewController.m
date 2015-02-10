//
//  ViewController.m
//  ios-app
//
//  Created by Jimmy Wu on 2/10/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "StudentService.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *students;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self prepareStudents];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:true];
    [self reloadStudents];
}

//- (void)prepareStudents {
//    Student *student1 = [[Student alloc]init];
//    [student1 setName:@"student1"];
//    
//    Student *student2 = [[Student alloc]init];
//    [student2 setName:@"student2"];
//    
//    Student *student3 = [[Student alloc]init];
//    [student3 setName:@"student3"];
//    
//    self.students = [[NSMutableArray alloc]initWithObjects:student1, student2, student3, nil];
//}

- (void)reloadStudents {
    __weak __typeof(self) weakSelf = self;
    [StudentService getAllStudentsWithCompletion:^(NSArray *students, NSError *error) {
        weakSelf.students = [[NSMutableArray alloc]initWithArray:students];
        [weakSelf.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data Source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.students.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Student *student = [self.students objectAtIndex:indexPath.row];
    cell.textLabel.text = student.name;
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Student *student = [self.students objectAtIndex:indexPath.row];
        [StudentService deleteStudent:student.ID withCompletion:^(NSError *error) {
            if (!error) {
                [self reloadStudents];
            }
        }];
    }
}

@end

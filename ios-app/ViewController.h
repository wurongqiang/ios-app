//
//  ViewController.h
//  ios-app
//
//  Created by Jimmy Wu on 2/10/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, FormViewDelegate>

@property (strong, nonatomic) NSMutableArray *students;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
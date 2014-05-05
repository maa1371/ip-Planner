//
//  NetworkListViewController.h
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/28/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Project.h"



@interface NetworkListViewController : UITableViewController


@property (strong,nonatomic) NSMutableArray * ProjectList;

@property (nonatomic, strong) NSString *selectedNation;



@end

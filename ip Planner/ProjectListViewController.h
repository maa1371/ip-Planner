//
//  ProjectViewController.h
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/25/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "App.h"

@interface ProjectListViewController : UICollectionViewController


@property NSMutableArray * ProjectList;

-(IBAction) AddNewProject:(UIStoryboardSegue*) segue;
-(IBAction) returnFromNetworkDetail:(UIStoryboardSegue*) segue;

@end

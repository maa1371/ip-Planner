//
//  ProjectViewController.h
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/25/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Project.h"


@interface ProjectListViewController : UICollectionViewController

@property (strong,nonatomic) NSMutableArray * ProjectList;
@property   (strong,nonatomic) NSIndexPath * currentIndex;


- (IBAction)editAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *ToDelete;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *plusHidden;


@end

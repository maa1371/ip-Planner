//
//  ipViewController.h
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/28/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Project.h"

@interface ipViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property NSMutableArray * ProjectList;
@property Project * currentProject;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end

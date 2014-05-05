//
//  ipViewController.m
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/28/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import "ipViewController.h"
#import "Project.h"
@interface ipViewController () <UITabBarControllerDelegate>

@end

@implementation ipViewController

@synthesize ProjectList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@":-( %d",ProjectList.count);
    
    //myApp =[[App alloc]init];
    
    
  ///  Project *new=[[Project alloc]init];
   // [ProjectList addObject:new];
//	[ProjectList addObject:new];
//	[ProjectList addObject:new];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

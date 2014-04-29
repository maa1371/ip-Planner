//
//  customtabViewController.m
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/28/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import "customtabViewController.h"
#import "ipNavigationViewController.h"
@interface customtabViewController () <UITabBarControllerDelegate>

@end

@implementation customtabViewController

@synthesize ProjectList;

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
//    self. = (YourSecondViewController*) viewController;
//    self.secondViewController.aLabel.text = self.stringFromTableViewController;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    ProjectList=[[NSMutableArray alloc]init];
    self.delegate=self;

    NSLog(@"customVC project list count:: %d",ProjectList.count);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

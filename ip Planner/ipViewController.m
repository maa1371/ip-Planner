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

@synthesize ProjectList ,currentProject;


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 5;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    if (component==4) {
        return 33;

    }
    return 256;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    NSNumber *number =[NSNumber numberWithInt:row];
    NSString *item=[number stringValue];
    return item;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    
}


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

    NSLog(@":-( %d",[[currentProject NetworkList]count]);
    [self.picker selectRow:192 inComponent:0 animated:YES];
    [self.picker selectRow:168 inComponent:1 animated:YES];
    [self.picker selectRow:1 inComponent:2 animated:YES];
    [self.picker selectRow:0 inComponent:3 animated:YES];
    [self.picker selectRow:24 inComponent:4 animated:YES];

   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  addNetworkViewController.m
//  ip Planner
//
//  Created by Amin on 5/13/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import "addNetworkViewController.h"

@interface addNetworkViewController () <UITextFieldDelegate>

@end


@implementation addNetworkViewController

@synthesize saveButton,networkName,clientNumber,serverNumber;

-(void)textFieldDidEndEditing:(UITextField *)textField{
    textField.delegate = self;
    int Enable=0;
    Enable = [[clientNumber text]intValue]+[[serverNumber text]intValue];
    
    if ( Enable==0  ) {
        saveButton.enabled=NO;
        
    }else
    {
        saveButton.enabled=YES;
        
    }
    
    [textField resignFirstResponder];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    textField.delegate = self;
    int Enable=0;
    Enable = [[clientNumber text]intValue]+[[serverNumber text]intValue];
    
    if ( Enable==0  ) {
        saveButton.enabled=NO;
        
    }else
    {
        saveButton.enabled=YES;
        
    }
    
    [textField resignFirstResponder];
    return YES;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    saveButton.enabled=NO;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

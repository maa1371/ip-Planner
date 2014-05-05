//
//  DisplayNetworkViewController.h
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/28/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Netwok.h"

@interface DisplayNetworkViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *NetworkName;
@property (weak, nonatomic) IBOutlet UITextField *clientNumber;
@property (weak, nonatomic) IBOutlet UITextField *serverNumber;

@property (strong,nonatomic) Netwok *currentNetwork;
@end

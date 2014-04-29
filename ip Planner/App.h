//
//  App.h
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/28/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App : NSObject

@property   NSMutableArray * ProjectList;

-(void) Save;
-(void) Load;

@end

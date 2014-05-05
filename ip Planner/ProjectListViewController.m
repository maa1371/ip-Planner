//
//  ProjectViewController.m
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/25/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import "ProjectListViewController.h"
#import "ipViewController.h"
#import "AddProjectViewController.h"
#import "Project.h"
#import "ipViewController.h"
#import "customtabViewController.h"
#import "ipNavigationViewController.h"
#import "Netwok.h"
#import "NetworkListViewController.h"

//#import "Netwok.h"

@interface ProjectListViewController () 

@end

@implementation ProjectListViewController

@synthesize ProjectList ,currentIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    currentIndex=[[NSIndexPath alloc]init];
    ProjectList =[[NSMutableArray alloc]init];
   
    //init project sample
    Project *new=[[Project alloc]init];
    [new setProjectName:@"sample Project"];
    
    //create a network list for project sample
    Netwok *newNetwork =[[Netwok alloc]init];
   
    [newNetwork setClients:[NSNumber numberWithInt:100]];
    [newNetwork setServers:[NSNumber numberWithInt:10]];
    [newNetwork setNetworkName:@"network1"];
    
    ip  *newIP =[[ip alloc]init];
    [newIP setIP:[NSNumber numberWithInteger:192] next2:[NSNumber numberWithInteger:168]  next3:[NSNumber numberWithInteger:1]  next4:[NSNumber numberWithInteger:0]  subnet:[NSNumber numberWithInteger:24] ];
    
    //set sample network list for sample project
    [new.NetworkList addObject:newNetwork];
    [new.NetworkList addObject:newNetwork];
    [new.NetworkList addObject:newNetwork];
    [new setNetworkIp:newIP];
    
    
    
    [ProjectList addObject:new];
    
    
   // Do any additional setup after loading the view.
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"NetworkDetails"]) {
        
        customtabViewController *cvc=[segue destinationViewController];
        cvc.selectedIndex=0;
        
        ipNavigationViewController *IPNVC=[cvc.viewControllers objectAtIndex:0];
        
        
        NetworkListViewController  *NLVC=[[IPNVC viewControllers]objectAtIndex:0];
       
        IPNVC=[cvc.viewControllers objectAtIndex:1];
        
        ipViewController *IPVC=[[IPNVC viewControllers]objectAtIndex:0];
        
        
        currentIndex =[[self.collectionView indexPathsForSelectedItems]objectAtIndex:0];
       
        NLVC.ProjectList=ProjectList;
        NLVC.currentProject=[ProjectList objectAtIndex:[currentIndex row]];
        
        IPVC.ProjectList=ProjectList;
        IPVC.currentProject=[ProjectList objectAtIndex:[currentIndex row]];
        
        
        
    }

}

-(IBAction) AddNewProject:(UIStoryboardSegue*) segue{
    
   
    AddProjectViewController * APVC =[segue sourceViewController];
    
    
    Project *newProject =[[Project alloc]init];
    
    if ([[[APVC InputProjectName ]text ]isEqualToString:@""]) {
     
        [newProject setProjectName:@"unnamed Project"];
        [ProjectList addObject:newProject];
    }
    else{
        [newProject setProjectName:[[APVC InputProjectName ]text]];
        [ProjectList addObject:newProject];
    }
    
    
   
    
    
    [self.collectionView  reloadData ]   ;
    
    
}

-(IBAction) returnFromipViewController:(UIStoryboardSegue*) segue{
    
    
    ipViewController    * TVC =[segue sourceViewController];
    
    ProjectList=TVC.ProjectList;
    
    
    
    [self.collectionView  reloadData ]   ;
    
    
    
}
-(IBAction) returnFromNetworkListViewController:(UIStoryboardSegue*) segue{
    
    
    NetworkListViewController    * NLVC =[segue sourceViewController];
    
    ProjectList=NLVC.projectList;
    
    
    
    [self.collectionView  reloadData ]   ;
    
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [ProjectList count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    //that is icon image that show in first page
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:@"projectIcon.ico"];
    
    //show the project name under project icon in collection
    UITextView *label =(UITextView *)[cell viewWithTag:200];
    
    
    Project *currentProject=[[Project alloc]init];
    
    //just set the name of a project
    [currentProject setProjectName:[[ProjectList objectAtIndex:indexPath.row] ProjectName]];
    label.text =[currentProject ProjectName];
    
    return cell;
}


@end

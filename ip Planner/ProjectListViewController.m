//
//  ProjectViewController.m
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/25/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import "ProjectListViewController.h"
//#import "App.h"
#import "ipViewController.h"
#import "AddProjectViewController.h"
#import "Project.h"
#import "ipViewController.h"
#import "customtabViewController.h"
#import "ipNavigationViewController.h"
//#import "Netwok.h"

@interface ProjectListViewController () <UITabBarControllerDelegate>

@end

@implementation ProjectListViewController

@synthesize ProjectList;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBarController.delegate=self;
   // self.tabBarItem.dataSource=self;
    
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
    ProjectList =[[NSMutableArray alloc]init];
    
    
    //myApp =[[App alloc]init];
    
    
    Project *new=[[Project alloc]init];
    [ProjectList addObject:new];
    
    
    //[[myApp ProjectList]initWithObjects:@"salam",@"ok",@"okok", nil];
    //[ProjectList addObject:@"end"];
    //[ProjectList addObject:@"yellow"];
    ///[ProjectList addObject:@"red"];
    ///[ProjectList addObject:@"green"];
    
    //NSLog(@"%i",[ProjectList count]);
    
    //Project *newProject =[[Project alloc]init];
    //Netwok *newNetwork =[[Netwok alloc]init];
    //NSNumber *newNumber =[[NSNumber alloc]initWithInt:100];
    
    
    //[newProject setProjectName:@"name"];
    
    // [newNetwork setNetworkName:@"Newnetwork"];
    // [newNetwork setClients:newNumber];
    // [newNetwork setServers:newNumber];
    
    //  [[newProject NetworkList]addObject:newNetwork];
    
    //  NSLog(@"a %d", [[newProject NetworkList]count]);
    
    
    
    // [myApp.ProjectList addObject:newProject];
    
    
    // NSLog(@"a %i", [[myApp  ProjectList]count]);
    
    
    //Photos = [NSArray arrayWithObjects:@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg", @"full_breakfast.jpg", @"green_tea.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"starbucks_coffee.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg", @"white_chocolate_donut.jpg", nil];
    
	// Do any additional setup after loading the view.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"NetworkDetails"]) {
        
  //  TabBarViewController   *TVC =[segue destinationViewController];
       /* customtabViewController *TVC =[segue destinationViewController];
        TVC.ProjectList=ProjectList;
        ipNavigationViewController *ipNC= [TVC.viewControllers objectAtIndex:1];
        ipNC.ProjectList=ProjectList;
        
        ipViewController *ipVC= [TVC.viewControllers objectAtIndex:1];
        ipVC.ProjectList=ProjectList;
        
        // [TVC.ProjectList addObject:[ ProjectList objectAtIndex:0]];
        //[[TVC ProjectList] addObject:[ProjectList objectAtIndex:0] ];
        //[TVC.ProjectList addObject:[self.ProjectList objectAtIndex:0]];
        //[TVC.ProjectList addObject:[self.ProjectList objectAtIndex:0]];
       // TVC.ProjectList=ProjectList;
        NSLog(@"segue %d",[TVC ProjectList].count   );
        NSLog(@"segue %d",[ipNC ProjectList].count   );
        NSLog(@"segue %d",[ipVC ProjectList].count   );

         // TVC.ProjectList=self.ProjectList;
        */
        customtabViewController * customVC = [segue destinationViewController];
        
        ipNavigationViewController * ipNVC=[customVC.viewControllers objectAtIndex:1] ;
        
        ipViewController *ipVC=[ipNVC.viewControllers objectAtIndex:0];
    
        
        
        ipVC.ProjectList=ProjectList;
        customVC.ProjectList=ProjectList;
        
        customVC.ProjectList=ProjectList;
        NSLog(@"ipVC project list count in projectlistviewcontroller:: segue %d",[ipVC ProjectList].count   );
        NSLog(@"Project List count in projectviewcontroller ::%d",ProjectList.count   );
        
        
    }

}

-(IBAction) AddNewProject:(UIStoryboardSegue*) segue{
    
    AddProjectViewController * APVC =[segue sourceViewController];
    
    
    Project *newProject =[[Project alloc]init];
    
    [newProject setProjectName:[[APVC InputProjectName ]text]];
    
    [ProjectList addObject:newProject];
    
    
    // [[myApp  ProjectList]addObject:newProject];
    
    // NSLog(@"a %d", [[myApp  ProjectList]count]);
    
    //[[myApp ProjectList]initWithObjects:@"salam",@"ok",@"okok", nil];
    NSLog(@"return from add new project counter %d",ProjectList.count);

    
    
    [self.collectionView  reloadData ]   ;
    
    
    // [newProject setProjectName:
    //[[myApp ProjectList] addObject: ]
    
}

-(IBAction) returnFromNetworkDetail:(UIStoryboardSegue*) segue{
    
    ipViewController    * TVC =[segue sourceViewController];
    
    ProjectList=TVC.ProjectList;
    NSLog(@"return from network detail %d",ProjectList.count);
    //Project *newProject =[[Project alloc]init];
    
   // [newProject setProjectName:[[IVC ProjectList ]text]];
    
    ///[ProjectList addObject:newProject];
    
    
    // [[myApp  ProjectList]addObject:newProject];
    
    // NSLog(@"a %d", [[myApp  ProjectList]count]);
    
    //[[myApp ProjectList]initWithObjects:@"salam",@"ok",@"okok", nil];
    
    
    
    [self.collectionView  reloadData ]   ;
    
    
    // [newProject setProjectName:
    //[[myApp ProjectList] addObject: ]
    
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

    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:@"projectIcon.ico"];
    
   UITextView *label =(UITextView *)[cell viewWithTag:200];
    Project *currentProject=[[Project alloc]init];

   // [currentProject setProjectName:[[[ProjectList objectAtIndex:indexPath.row] ProjectName] ] ];
    [currentProject setProjectName:[[ProjectList objectAtIndex:indexPath.row] ProjectName]];
 //   NSLog(@"%@",currentProject.ProjectName);
    
    label.text =[currentProject ProjectName];
   // [label setText:[currentProject ProjectName]];
   // label.text=[ProjectList objectAtIndex:indexPath.row];
    
    
   // [[ProjectList objectAtIndex:indexPath.row] setProjectIndex:indexPath.row];
    
    
    
    
    
  //  cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame.png"]];
    
    return cell;
}

@end

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

bool    replace;
bool edithEnable;
bool clickProper;
NSMutableArray *cellSelected;
UIBarButtonItem *deleteButton,*renameButton,*editButton,*addButton;
int  myindex;


-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return YES;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(edithEnable)
        {
            [[collectionView cellForItemAtIndexPath:indexPath]viewWithTag:100].hidden=YES;

            [cellSelected addObject:[ProjectList objectAtIndex:indexPath.row]];
            NSLog(@"counter1::%lu",(unsigned long)[cellSelected count]);
            if ([cellSelected count]==0) {
                deleteButton.enabled=NO;
            }else{
                deleteButton.enabled=YES;
            }
           
            if ([cellSelected count]==1) {
                
                
                renameButton.enabled=YES;
            } else{
                renameButton.enabled=NO;
            }
            
        }
    
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{

    if(edithEnable)
    {
        [[collectionView cellForItemAtIndexPath:indexPath]viewWithTag:100].hidden=NO;

        [cellSelected removeObject:[ProjectList objectAtIndex:indexPath.row]];
        NSLog(@"counter2::%lu",(unsigned long)[cellSelected count]);

        if ([cellSelected count]==1) {
         //   myindex=indexPath.row;
            renameButton.enabled=YES;
        } else{
            renameButton.enabled=NO;
            }
        
        if ([cellSelected count]==0) {
            deleteButton.enabled=NO;
        }else{
            deleteButton.enabled=YES;
        }
        
    }
    
    
}

-(void)addAction:(id)sender
{
    [self performSegueWithIdentifier:@"add" sender:sender];
}
-(void)deleteAction:(id)sender{
    
    for (int i=0; i<cellSelected.count; i++) {
        [ProjectList removeObject:[cellSelected objectAtIndex:i]];
        
    }
    deleteButton.enabled=NO;
    renameButton.enabled=NO;
    [cellSelected removeAllObjects];
    [self.collectionView reloadData];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==1) {
        UITextField * alertTextField = [alertView textFieldAtIndex:0];
        [[ProjectList objectAtIndex:myindex]setProjectName:alertTextField.text];
        [self.collectionView reloadData];

    }else{
        [self.collectionView reloadData];

    }
    
    // do whatever you want to do with this UITextField.
}

-(void)renameAction:(id)sender{
    NSLog(@"index::%d",myindex);
    
    for (int i=0; i<[ProjectList count]; i++) {
        if ([ProjectList objectAtIndex:i]==[cellSelected objectAtIndex:0]) {
            myindex=i;
            NSLog(@"%d",myindex);
        }
    }

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Edit Project Name" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil] ;
   
    alertView.tag = 2;
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [[alertView textFieldAtIndex:0]setText:[[ProjectList objectAtIndex:myindex]ProjectName]];
    [alertView show];
    
   // [[ProjectList objectAtIndex:myindex]setProjectName:@"rename"];
    [cellSelected removeAllObjects];
    deleteButton.enabled=NO;
    renameButton.enabled=NO;
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   // self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    self.navigationController.navigationBar.barTintColor=[UIColor blackColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor whiteColor],NSForegroundColorAttributeName,
                                    [UIColor whiteColor],NSBackgroundColorAttributeName,nil];
    
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;

    

    
    
    
    
    /////
    deleteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteAction:)];
    
    
    renameButton = [[UIBarButtonItem alloc] initWithTitle:(@"rename") style:UIBarButtonItemStyleBordered target:self action:@selector(renameAction:)];
    
    addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)];
    
    
    editButton = [[UIBarButtonItem alloc] initWithTitle:(@"edit") style:UIBarButtonItemStyleBordered target:self action:@selector(editAction:)];

    
    
//    UIImage *image = [UIImage imageNamed:@"edit.png"];
//    CGRect buttonFrame = CGRectMake(0, 0, image.size.width, image.size.height);
//    
//    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
//    [button addTarget:self action:@selector(editAction:) forControlEvents:UIControlEventTouchUpInside];
//    [button setImage:image forState:UIControlStateNormal];
//    
//    editButton= [[UIBarButtonItem alloc] initWithCustomView:button];
//    self.navigationItem.rightBarButtonItems=@[editButton];
//    
//    
//    
//    self.navigationItem.leftBarButtonItems = @[addButton];
    
    /////
    
    
    
    deleteButton.enabled=NO;
    renameButton.enabled=NO;
   
    currentIndex=[[NSIndexPath alloc]init];
    ProjectList =[[NSMutableArray alloc]init];
    edithEnable=NO;
    cellSelected=[[NSMutableArray alloc]init];
    //init project sample
    Project *new=[[Project alloc]init];
    [new setProjectName:@"sample Project"];
    
    //create a network list for project sample
    Netwok *newNetwork =[[Netwok alloc]init];
   
    [newNetwork setClients:[NSNumber numberWithInt:100]];
    [newNetwork setServers:[NSNumber numberWithInt:10]];
    [newNetwork setNetworkName:@"Sample Network"];
    
    ip  *newIP =[[ip alloc]init];
    [newIP setIP:[NSNumber numberWithInteger:192] next2:[NSNumber numberWithInteger:168]  next3:[NSNumber numberWithInteger:1]  next4:[NSNumber numberWithInteger:0]  subnet:[NSNumber numberWithInteger:24] ];
    
    //set sample network list for sample project
    [new.NetworkList addObject:newNetwork];
    //[new.NetworkList addObject:newNetwork];
    //[new.NetworkList addObject:newNetwork];
    [new setNetworkIp:newIP];
    
    
    
    [ProjectList addObject:new];
    
    
   // Do any additional setup after loading the view.
}

- (IBAction)editAction:(id)sender {
    
    if (edithEnable) {
        
        self.navigationItem.leftBarButtonItems = @[addButton];

        // Deselect all selected items
        for(NSIndexPath *indexPath in self.collectionView.indexPathsForSelectedItems) {
            [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
        }
        
        // Remove all items from selectedRecipes array
        [cellSelected removeAllObjects];
        
        // Change the sharing mode to NO
        self.collectionView.allowsMultipleSelection = NO;
       
        self.editButton.title = @"Edit";
        
        self.plusHidden.enabled=YES;
        edithEnable = NO;
        
      //  [self.editButton setStyle:UIBarButtonItemStyleDone];
        [self.collectionView reloadData];

    } else {
        
        // Change shareEnabled to YES and change the button text to DONE
        [cellSelected removeAllObjects];
        deleteButton.enabled=NO;
        renameButton.enabled=NO;
        self.navigationItem.leftBarButtonItems = @[deleteButton,renameButton];
        
        
        replace=YES;
        edithEnable = YES;
        self.collectionView.allowsMultipleSelection = YES;
        self.plusHidden.enabled=NO;
        self.editButton.title = @"Done";

        [self.collectionView reloadData];
      //  [self.editButton setStyle:UIBarButtonItemStylePlain];
        
    }
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (edithEnable) {
        return NO;
    } else {
        return YES;
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  
    if ([[segue identifier] isEqualToString:@"add"])
    {
    }
    
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

    
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"back.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    
    
    //that is icon image that show in first page
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:@"proj-icon.png"];

    UIImageView *hoverImage = (UIImageView *)[cell viewWithTag:110];
    hoverImage.image=[UIImage imageNamed:@"delete.png"];
    
    //show the project name under project icon in collection
    Project *currentProject=[[Project alloc]init];
   
    UITextField *label300=(UITextField *)[cell viewWithTag:300];
    UITextView *label200=(UITextView *)[cell viewWithTag:200];

    label300.hidden=YES;
    [currentProject setProjectName:[[ProjectList objectAtIndex:indexPath.row] ProjectName]];
    label200.text =[currentProject ProjectName];
    if (edithEnable) {
//        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"delete.png"]];
       
        if (cell.selected==YES) {
            recipeImageView.hidden=YES;
        }else{
            recipeImageView.hidden=NO;
        }
        
        
          }
    
  //


    return cell;
}




@end

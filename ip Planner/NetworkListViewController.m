//
//  NetworkListViewController.m
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/28/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import "NetworkListViewController.h"
#import "Netwok.h"
#import "Project.h"
#import "ProjectListViewController.h"
#import "AddToNetworkListViewController.h"
#import "DisplayNetworkViewController.h"
@interface NetworkListViewController ()
@end

@implementation NetworkListViewController

@synthesize currentProject,projectList;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"EditNetwork"]) {
  
        DisplayNetworkViewController *DVC=[segue destinationViewController];
       
        NSIndexPath *index =[self.tableView indexPathForSelectedRow];
      
        DVC.currentNetwork=[[currentProject NetworkList] objectAtIndex:index.row];
        
        // DVC.clientNumber.text=[[[currentProject NetworkList] objectAtIndex:index.row]clients];
       // [DVC.serverNumber.text]=[[[currentProject NetworkList] objectAtIndex:index.row]clients];
        
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"currnt project Network list count::%d ",[[currentProject NetworkList]count]);

    //Project *initProject=[[Project alloc]init];
    //[ProjectList addObject:initProject];
    
  //  NSLog(@"%D",[ProjectList objectAtIndex:0].count);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
  //  NSLog(@"currnt project Network list count::%d ",[[currentProject NetworkList]count]);

    return [[currentProject NetworkList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Netwrokid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
   // Project *currentProject=[ProjectList objectAtIndex:0];
    
    
    [cell.textLabel setText:[[[currentProject NetworkList] objectAtIndex:indexPath.row]NetworkName]];
  //  NSLog(@"name %@" ,[[[currentProject NetworkList] objectAtIndex:indexPath.row]NetworkName]);
    
    //[cell.textLabel setText:@"amin"];
    
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */
-(IBAction) SaveNewNetwork:(UIStoryboardSegue*) segue{
    
    AddToNetworkListViewController *ATNLVC=[segue sourceViewController];
    Netwok *newNetwork=[[Netwok alloc]init];
    
    newNetwork.NetworkName=[[ATNLVC networkName]text];
    
    
    NSString *newcliens=[[ATNLVC clientNumber]text];
    int clientNumber=[newcliens intValue];
    
    NSString *newservers=[[ATNLVC serverNumber]text];
    int serverNumber=[newservers intValue];
    
    newNetwork.clients=[NSNumber numberWithInteger:clientNumber];
    newNetwork.Servers=[NSNumber numberWithInteger:serverNumber];
    
    
    
    
    
    [[currentProject NetworkList]addObject:newNetwork];
    
    
    
    [ self.tableView reloadData];
    
    int index;
    index=[projectList indexOfObject:currentProject];
    [projectList replaceObjectAtIndex:index withObject:currentProject];
    [ATNLVC dismissViewControllerAnimated:YES completion: nil];
    
    
}

-(IBAction) EditNewNetwork:(UIStoryboardSegue*) segue{
    
    DisplayNetworkViewController *DNVC=[segue sourceViewController];
    
    
    [DNVC currentNetwork].NetworkName=[DNVC NetworkName].text;
    [DNVC currentNetwork].clients=[NSNumber numberWithInt:[DNVC clientNumber].text.intValue];
    [DNVC currentNetwork].Servers=[NSNumber numberWithInt:[DNVC serverNumber].text.intValue];
    
     Netwok *newNetwork=[[Netwok alloc]init];
    newNetwork= DNVC.currentNetwork;
//    newNetwork.NetworkName=[[DNVC NetworkName]text];
//    
//    
//    NSString *newcliens=[[DNVC clientNumber]text];
//    int clientNumber=[newcliens intValue];
//    
//    NSString *newservers=[[DNVC serverNumber]text];
//    int serverNumber=[newservers intValue];
//    
//    newNetwork.clients=[NSNumber numberWithInteger:clientNumber];
//    newNetwork.Servers=[NSNumber numberWithInteger:serverNumber];
//    
    
    
    int path;
    path=[[currentProject NetworkList]indexOfObject:newNetwork];

    [[currentProject NetworkList] replaceObjectAtIndex:path withObject:newNetwork];
    
    
    
    
    [self.tableView reloadData];
    
    int index;
    index=[projectList indexOfObject:currentProject];
    [projectList replaceObjectAtIndex:index withObject:currentProject];
    NSLog(@"IP:: %@",[[currentProject NetworkIp ]ip1]);
    
    [[self navigationController] popViewControllerAnimated:YES];
    [self performSelector:@selector(delayedPresent:) withObject:DNVC afterDelay:0.6];
    

}

- (void)delayedPresent:(UIViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion: nil];
}
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [[currentProject NetworkList] removeObjectAtIndex:indexPath.row];

        [projectList replaceObjectAtIndex:[projectList indexOfObject:currentProject] withObject:currentProject];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

@end

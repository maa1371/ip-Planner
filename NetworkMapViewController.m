//
//  NetworkMapViewController.m
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/28/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import "NetworkMapViewController.h"
#import "Project.h"
#import "Netwok.h"

@interface NetworkMapViewController ()

@end

@implementation NetworkMapViewController

@synthesize currentProject,IPaval;

NSMutableArray *ipAvalCopy;
NSMutableArray *clientIPrange;//=[[NSMutableArray alloc]init];
NSMutableArray *subList;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSNumber * ) convertIntToSubnet:(int)sub{
    int counter=0;
    for (int index=1; index!=0; ) {
        
        sub=sub/2;
        if (sub==1) {
            index=0;
            counter++;
        }
        counter++;
    }
   
    counter=32-counter;
    
    NSNumber *returnCount=[NSNumber numberWithInt:counter];
    
    return returnCount;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    clientIPrange=[[NSMutableArray alloc]init];
    ipAvalCopy=[[NSMutableArray alloc]init];
    subList=[[NSMutableArray alloc]init];
    
    for (int i=0; i<[[currentProject NetworkList]  count]; i++) {
        int subnum=0;
        
        subnum = [[[[currentProject NetworkList]objectAtIndex:i ]clients]intValue];
        subnum +=[[[[currentProject NetworkList]objectAtIndex:i ]Servers] intValue];
        
        NSNumber *subnet1=[self convertIntToSubnet:subnum];
        [subList addObject:subnet1];
        
        
       // [[[[currentProject NetworkList]objectAtIndex:i]eachNetworkIP]setSubnetMask:subnet1 ];
        //[[[[currentProject NetworkList]objectAtIndex:i]eachNetworkIP]setSub:subnet1];
      //  NSLog(@"subnet %d ",[[subList objectAtIndex:i]intValue]);
 
        
 //[[[[[currentProject NetworkList]objectAtIndex:i]eachNetworkIP]SubnetMask]intValue]);
        
        
    }
    
    
    for (int i=0; i<[IPaval count]; i++) {
        [ipAvalCopy addObject:[IPaval objectAtIndex:i]];
    }
    
    
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
    return [currentProject NetworkList].count;
}
-(NSString *)ip1:(NSNumber * )part1 ip2:(NSNumber * )part2 ip3:(NSNumber * )part3 ip4:(NSNumber * )part4 subnet:(NSNumber * )subNetMask{
    NSString *part1String=[part1 stringValue];
    NSString *part2String=[part2 stringValue];
    NSString *part3String=[part3 stringValue];
    NSString *part4String=[part4 stringValue];
    NSString *partSubnet=[subNetMask stringValue];

    
    NSString * returnVAlue=[[NSString alloc]init];
    returnVAlue=[returnVAlue stringByAppendingString:part1String];
    returnVAlue=[returnVAlue stringByAppendingString:@":"];
    returnVAlue=[returnVAlue stringByAppendingString:part2String];
    returnVAlue=[returnVAlue stringByAppendingString:@":"];
    returnVAlue=[returnVAlue stringByAppendingString:part3String];
    returnVAlue=[returnVAlue stringByAppendingString:@":"];
    returnVAlue=[returnVAlue stringByAppendingString:part4String];
    returnVAlue=[returnVAlue stringByAppendingString:@"/"];
    returnVAlue=[returnVAlue stringByAppendingString:partSubnet];
    
    return returnVAlue;
    
    
}

-(NSMutableArray *)NetworkIpRange :(NSMutableArray*)IP1 projectlist:(Project *)projectList index:(NSIndexPath *)indexPath{
    NSMutableArray *IP=[[NSMutableArray alloc]init];
  
    IP=IP1;
    
    NSString *value1=[[NSString alloc]init];
    NSString *value2=[[NSString alloc]init];
   
    value1=[self ip1:[IP objectAtIndex:3] ip2:[IP objectAtIndex:2] ip3:[IP objectAtIndex:1] ip4:[IP objectAtIndex:0] subnet:[IP objectAtIndex:4]];

    int from=0;int to=0;
    
    for (int i=0; i<indexPath.row; i++) {
        from= [[[[projectList NetworkList]objectAtIndex:i] clients]intValue];
    }
    for (int i=0; i<indexPath.row+1; i++) {
        to= [[[[projectList NetworkList]objectAtIndex:i] clients]intValue];
    }
    
    int index1=0,index2=0,index3=0,index4=0;
    int clientNumber=0;
    
    clientNumber =[[[[currentProject NetworkList] objectAtIndex:indexPath.row] clients ]intValue]+[[[[currentProject NetworkList] objectAtIndex:indexPath.row] Servers ]intValue];
    
    index1=clientNumber%255;
    
    index2=clientNumber/255;
    
    index3=clientNumber/(255*255);
   
    index4=clientNumber/(255*255*255);
    
    index1=[[IP objectAtIndex:0]intValue]+index1+from;
   
    if (index1>256) {
        index1=index1-255;
        index2++;
    }
    
    index2=[[IP objectAtIndex:1]intValue]+index2;
   
    if (index2>256) {
        index2=index2-255;
        index3++;
    }
    
    index3=[[IP objectAtIndex:2]intValue]+index3;
    
    if (index3>256) {
        index3=index3-255;
        index4++;
    }
    
    index4=[[IP objectAtIndex:3]intValue]+index4;
    
    
    [IP replaceObjectAtIndex:0 withObject:[NSNumber numberWithInt:index1]];
    [IP replaceObjectAtIndex:1 withObject:[NSNumber numberWithInt:index2]];
    [IP replaceObjectAtIndex:2 withObject:[NSNumber numberWithInt:index3]];
    [IP replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:index4]];
    
   
    
    
    value2=[self ip1:[IP objectAtIndex:3] ip2:[IP objectAtIndex:2] ip3:[IP objectAtIndex:1] ip4:[IP objectAtIndex:0] subnet:[IP objectAtIndex:4]];
 //   NSNumber *firstIP=[NSNumber numberWithInt:]
  //  NSNumber *secondIP=[NSNumber numberWithInt:]
  
    NSMutableArray * array=[[NSMutableArray alloc]init];
    [array addObject:value1];
    [array addObject:value2];
    
    return array;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"result";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    
    NSString *projectName=[[[currentProject NetworkList]objectAtIndex:indexPath.row] NetworkName];
    [IPaval replaceObjectAtIndex:4 withObject:[subList objectAtIndex:indexPath.row] ];
    
    clientIPrange=[self NetworkIpRange:IPaval projectlist:currentProject index:indexPath];
    
    UILabel *projectNameLable=(UILabel *)[cell viewWithTag:1];
    projectNameLable.text=projectName;
    
    UILabel *projectClientLable1=(UILabel *)[cell viewWithTag:3];
   
    projectClientLable1.text=[@"Network Ip:: " stringByAppendingString:[clientIPrange objectAtIndex:0]];

   
    UILabel *projectClientLable2=(UILabel *)[cell viewWithTag:5];
    projectClientLable2.text=[@"Broad cast Ip :: " stringByAppendingString:[clientIPrange objectAtIndex:1]];
    
    if (indexPath.row==[[currentProject NetworkList]count]-1) {
        
        for (int i=0; i<[IPaval count]; i++) {
            [IPaval replaceObjectAtIndex:i  withObject:[ipAvalCopy objectAtIndex:i]];
        }
        
        
    }
    
    
    NSLog(@"%d,%d,%d,%d",[[IPaval objectAtIndex:0] intValue] ,
                        [[IPaval objectAtIndex:1] intValue],
                        [[IPaval objectAtIndex:2] intValue],
                        [[IPaval objectAtIndex:3] intValue]);

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

@end

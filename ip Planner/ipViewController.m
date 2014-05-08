//
//  ipViewController.m
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/28/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import "ipViewController.h"
#import "Project.h"
#import "NetworkMapViewController.h"
#import "mapNavViewController.h"
@interface ipViewController () <UITabBarControllerDelegate>

@end

@implementation ipViewController

@synthesize ProjectList ,currentProject;

NSMutableArray *binarryIP;
int ip1,ip2,ip3,ip4,subnet1,subnet2,subnet3,subnet4,subnet;


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"NetworkMap"]) {
     //   mapNavViewController *MNVC=[segue destinationViewController];
      //  NetworkMapViewController *NMVC=[MNVC.viewControllers objectAtIndex:0];
        NetworkMapViewController *NMVC=[segue destinationViewController];
        NMVC.currentProject=currentProject;
        NSNumber *ip11=[NSNumber numberWithInt:ip4];
        NSNumber *ip22=[NSNumber numberWithInt:ip3];
        NSNumber *ip33=[NSNumber numberWithInt:ip2];
        NSNumber *ip44=[NSNumber numberWithInt:ip1];
        NSNumber *subnet55=[NSNumber numberWithInt:subnet];
        NSMutableArray *ipAval=[[NSMutableArray alloc]initWithObjects:ip11,ip22,ip33,ip44,subnet55 ,nil];
        
        NMVC.IPaval=ipAval;
        
        
        NSLog(@"%d,%d,%d,%d",[ip11 intValue],[ip22 intValue],[ip33 intValue],[ip44 intValue]);
        
    }
   
    
}

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

    
//    NSLog(@":-( %d",[[currentProject NetworkList]count]);
//    NSLog(@":-( %ld",(long)row);
//
    
    switch (component) {
        case 0:
            [[currentProject NetworkIp]setIp1:[NSNumber numberWithInt:row]];
            break;
        case 1:
            [[currentProject NetworkIp]setIp2:[NSNumber numberWithInt:row]];
            break;
        case 2:
            [[currentProject NetworkIp]setIp3:[NSNumber numberWithInt:row]];
            break;
        case 3:
            [[currentProject NetworkIp]setIp4:[NSNumber numberWithInt:row]];
            break;
        case 4:
            [[currentProject NetworkIp]setSubnetMask:[NSNumber numberWithInt:row]];
            break;
            
    }
    
//    NSLog(@"IP ::%@.%@.%@.%@/%@",[[currentProject NetworkIp]ip1],[[currentProject NetworkIp]ip2],[[currentProject NetworkIp]ip3],[[currentProject NetworkIp]ip4],[[currentProject NetworkIp]SubnetMask]);
//    NSDecimalNumber * newNumber=[[NSDecimalNumber alloc] initWithLongLong:2 ];
//    newNumber= [newNumber decimalNumberByRaisingToPower:(32-[[ [currentProject NetworkIp]SubnetMask]longValue])];
//    
//    NSLog(@"IP %lld",[newNumber longLongValue]);
//
   
//    
//    Boolean item[32];
//    item[0]=1;
    
    
    
//    NSMutableArray  *item=[[NSMutableArray alloc]init];
//    item=[self ipToBinnary:[[currentProject NetworkIp]ip1] item2:[[currentProject NetworkIp]ip2] item3:[[currentProject NetworkIp]ip3] item4:[[currentProject NetworkIp]ip4]];
//    
//    NSMutableArray *sub=[[NSMutableArray alloc]init];
//    sub=[self SubToBinnary:[[currentProject NetworkIp]SubnetMask ]];
//    
    
    
//    Boolean ipBoll[32];
//    Boolean subBoll[32];
//    int indexip=0;
//    int indexsub=0;
//    
//    for(NSString *boolean in [item reverseObjectEnumerator])
//    {
//        indexip++;
//        ipBoll[indexip]=[boolean boolValue];
//    }
//    
//    for(NSString *boolean in [sub reverseObjectEnumerator])
//    {
//        indexip++;
//        subBoll[indexsub]=[boolean boolValue];
//    }
//    
//    Boolean natije[32];
//    
//    for (int i=0; i<32; i++) {
//        natije[i]=ipBoll[i] & subBoll[i];
//    }
//    
//    
//    NSMutableArray *natijeint=[[NSMutableArray alloc]init];
//    
//    natijeint=[self BoolToNSNumber:natije];
//    
//    NSLog(@"%@",[natijeint objectAtIndex:1]);
   
    
    subnet=[[[currentProject NetworkIp] SubnetMask]intValue];
    
    
    
   // 11111111 11111111 11111100 00000000
    
    if (subnet<=32 && 24<subnet) {
        NSLog(@"it is there");
        subnet1=256-[self power:2 to:(1*(32-subnet))];
        subnet2=255;
        subnet3=255;
        subnet4=255;
    }else if (subnet<=24 && 16<subnet){
        subnet1=0;
        subnet2=256-[self power:2 to:(1*(24-subnet))];
        subnet3=255;
        subnet4=255;
    }else if (subnet<=16 && 8<subnet){
        subnet1=0;
        subnet2=0;
        subnet3=256-[self power:2 to:(1*(16-subnet))];
        subnet4=255;
    }else if (subnet<=8 && 0<subnet){
        subnet1=0;
        subnet2=0;
        subnet3=0;
        subnet4=256-[self power:2 to:(8-subnet)];
    }
    else {
        subnet1=0;
        subnet2=0;
        subnet3=0;
        subnet4=0;
    
    }
    ip1=[[[currentProject NetworkIp] ip1]intValue];
    ip2=[[[currentProject NetworkIp] ip2]intValue];
    ip3=[[[currentProject NetworkIp] ip3]intValue];
    ip4=[[[currentProject NetworkIp] ip4]intValue];

    ip1=ip1 & subnet4;
    ip2=ip2 & subnet3;
    ip3=ip3 & subnet2;
    ip4=ip4 & subnet1;
    
    
    NSNumber *clientCounter=[self clientCount:currentProject];
    int ipNumber = [self power:2 to:(32-subnet)];
    
    if( [clientCounter intValue] < ipNumber)
    {
        self.MapButton.enabled = YES;
        
    }else
    {
        self.MapButton.enabled = NO;
        
    }
    NSLog(@"client number::%d",[clientCounter intValue]);
    NSLog(@"ip number::%d",ipNumber);
    NSLog(@"ip aval shabake:: %d/%d/%d/%d",ip1,ip2,ip3,ip4);
    NSLog(@"subnet:: %d/%d/%d/%d",subnet4,subnet3,subnet2,subnet1);
    
    
}

-(int)power:(int)item1 to:(int)item2{
    int value=1;
    for (int index=0; index<item2; index++) {
        value=value*item1;
    }
    return value;
}


-(NSNumber *)clientCount:(Project *)iProject{
    int indexPath=[[iProject NetworkList]count];
    
    int counter=0;
    for (int i=0; i<indexPath; i++) {
       
        counter= counter + [[[[iProject NetworkList]objectAtIndex:i] clients]intValue]+ [[[[iProject NetworkList]objectAtIndex:i] Servers]intValue];
        
    }
    
    
    NSNumber *returnNumber=[NSNumber numberWithInt:counter];
    
    
    return returnNumber ;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    int item1,item2,item3,item4,sub=0;
    item1=200;
    item2=200;
    item3=200;
    item4=0;
    sub=24;
    
    [self.picker selectRow:item1 inComponent:0 animated:YES];
    [self.picker selectRow:item2 inComponent:1 animated:YES];
    [self.picker selectRow:item3 inComponent:2 animated:YES];
    [self.picker selectRow:item4 inComponent:3 animated:YES];
    [self.picker selectRow:sub inComponent:4 animated:YES];

    [[currentProject NetworkIp]setIp1:[NSNumber numberWithInt:item1]];
    [[currentProject NetworkIp]setIp2:[NSNumber numberWithInt:item2]];
    [[currentProject NetworkIp]setIp3:[NSNumber numberWithInt:item3 ]];
    [[currentProject NetworkIp]setIp4:[NSNumber numberWithInt:item4 ]];
    [[currentProject NetworkIp]setSubnetMask:[NSNumber numberWithInt:sub]];

    //binarryIP=[[NSMutableArray alloc]init];
   
    self.MapButton.enabled = NO;
    NSNumber *clientCounter=[self clientCount:currentProject];
    int ipNumber = [self power:2 to:sub];
    
    if( [clientCounter intValue] < ipNumber)
    {
        self.MapButton.enabled = NO;

    }else
    {
        self.MapButton.enabled = YES;

    }

   // [self.MapButton setTitleTextAttributes:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(NSMutableArray *)BoolToNSNumber :(Boolean *)boolean{
//
//    NSMutableArray *natije=[[NSMutableArray alloc]init];
//
//    int index=0;
//
//    for (int i=0; i<8; i++) {
//        index=index+(2^i)*boolean[i];
//    }
//
//    [natije  addObject:[NSNumber numberWithInt:index]];
//
//    index=0;
//    for (int i=8; i<16; i++) {
//        index=index+(2^i)*boolean[i];
//    }
//
//    [natije  addObject:[NSNumber numberWithInt:index]];
//
//    index=0;
//    for (int i=16; i<24; i++) {
//        index=index+(2^i)*boolean[i];
//    }
//
//    [natije  addObject:[NSNumber numberWithInt:index]];
//
//    index=0;
//    for (int i=24; i<32; i++) {
//        index=index+(2^i)*boolean[i];
//    }
//
//    [natije  addObject:[NSNumber numberWithInt:index]];
//
//
//
//
//    return natije;
//}
//
//
//-(NSMutableArray*)SubToBinnary:(NSNumber *)subnet{
//
//    NSMutableArray * item=[[NSMutableArray alloc]init];
//    int subnetmask =0;
//    subnetmask=[subnet intValue];
//
//    for (int i=0; i<32; i++) {
//        [item addObject:[NSNumber numberWithBool:0]];
//    }
//
//    for (int i=31; i>31-subnetmask; i--) {
//
//
//
//        [item setObject:[NSNumber numberWithBool:1] atIndexedSubscript:i];
//    }
//
//    return  item;
//
//}
//
//-(NSMutableArray *)ipToBinnary:(NSNumber *)ip1 item2:(NSNumber *)ip2 item3:(NSNumber *)ip3 item4:(NSNumber *)ip4{
//
//    NSMutableArray * item=[[NSMutableArray alloc]init];
//    for (int i=0; i<32; i++) {
//        [item addObject:[NSNumber numberWithBool:0]];
//    }
//
//    int ip1int =0;
//    ip1int=[ip1 intValue];
//    int ip2int =0;
//    ip2int=[ip2 intValue];
//    int ip3int =0;
//    ip3int=[ip3 intValue];
//    int ip4int =0;
//    ip4int=[ip4 intValue];
//
//
//    for (int i=7; i>=0; i--) {
//        Boolean baghi=0;
//
//        baghi=ip1int%2;
//        ip1int=ip1int/2;
//
//
//        [item setObject:[NSNumber numberWithBool:baghi] atIndexedSubscript:i];
//    }
//
//    for (int i=15; i>7; i--) {
//        Boolean baghi=0;
//
//        baghi=ip2int%2;
//        ip2int=ip2int/2;
//
//
//        [item setObject:[NSNumber numberWithBool:baghi] atIndexedSubscript:i];
//    }
//
//    for (int i=23; i>15; i--) {
//        Boolean baghi=0;
//
//        baghi=ip3int%2;
//        ip3int=ip3int/2;
//
//
//        [item setObject:[NSNumber numberWithBool:baghi] atIndexedSubscript:i];
//    }
//
//    for (int i=31; i>23; i--) {
//        Boolean baghi=0;
//
//        baghi=ip4int%2;
//        ip4int=ip4int/2;
//
//
//        [item setObject:[NSNumber numberWithBool:baghi] atIndexedSubscript:i];
//    }
//
//
//    return item;
//}
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}


@end

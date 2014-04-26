//
//  ProjectViewController.m
//  ip Planner
//
//  Created by Mohammad Amin Ansari on 4/25/14.
//  Copyright (c) 2014 Mohammad Amin Ansari. All rights reserved.
//

#import "ProjectViewController.h"

@interface ProjectViewController ()


@end

@implementation ProjectViewController

NSMutableArray * ProjectList ;


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
    
    
    ProjectList=[[NSMutableArray alloc]init];
    
    Project *NewProject =[[Project alloc ]init];
    
    [NewProject setProjectName:@"Project1"];
    
    [ProjectList addObject:NewProject];
    
    [NewProject setProjectName:@"Project1"];
    
    [ProjectList addObject:NewProject];
    
    [NewProject setProjectName:@"Project1"];
    
    [ProjectList addObject:NewProject];
    
    [NewProject setProjectName:@"Project1"];
    
    [ProjectList addObject:NewProject];
    
    [NewProject setProjectName:@"Project1"];
    
    [ProjectList addObject:NewProject];
    
    [NewProject setProjectName:@"Project1"];
    
    [ProjectList addObject:NewProject];
    
    [NewProject setProjectName:@"Project1"];
    
    [ProjectList addObject:NewProject];
    
    [NewProject setProjectName:@"Project1"];
    
    [ProjectList addObject:NewProject];
    
    [NewProject setProjectName:@"Project1"];
    
    [ProjectList addObject:NewProject];
    
    [NewProject setProjectName:@"Project1"];
    
    [ProjectList addObject:NewProject];
    
    [NewProject setProjectName:@"Project1"];
    
    [ProjectList addObject:NewProject];
    
    [NewProject setProjectName:@"Project1"];
    
    [ProjectList addObject:NewProject];
    
    
    
    //Photos = [NSArray arrayWithObjects:@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg", @"full_breakfast.jpg", @"green_tea.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"starbucks_coffee.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg", @"white_chocolate_donut.jpg", nil];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return ProjectList.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:@"projectIcon.ico"];
    
    UITextView *label =(UITextView *)[cell viewWithTag:200];
    label.text =[[ProjectList objectAtIndex:indexPath.row ] ProjectName];
    
   // [[ProjectList objectAtIndex:indexPath.row] setProjectIndex:indexPath.row];
    
    
    
    
    
  //  cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame.png"]];
    
    return cell;
}

@end

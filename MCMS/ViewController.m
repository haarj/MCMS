//
//  ViewController.m
//  MCMS
//
//  Created by Justin Haar on 3/17/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MagicalCreature *creature1 = [[MagicalCreature alloc]initWithName:@"Iron Man"];
    MagicalCreature *creature2 = [[MagicalCreature alloc]initWithName:@"Captain America"];
    MagicalCreature *creature3 = [[MagicalCreature alloc]initWithName:@"Joker"];
    self.creatures = [NSMutableArray arrayWithObjects:creature1, creature2, creature3, nil];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    MagicalCreature *aCreature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = aCreature.name;
    return cell;
}

- (IBAction)onAddButtonTapped:(UIButton *)sender
{
    MagicalCreature *newCreature = [[MagicalCreature alloc]initWithName:self.textField.text];
    [self.creatures addObject:newCreature];
    self.textField.text = @"";
    [self.textField resignFirstResponder];
    [self.tableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *creatureVC = segue.destinationViewController;
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    MagicalCreature *aCreature = self.creatures[selectedIndexPath.row];
    creatureVC.creature = aCreature;
}


@end

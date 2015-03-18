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
#import "BattleViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property (nonatomic)NSMutableArray *accesories;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.accesories = [NSMutableArray arrayWithObjects:@"Gun", @"Rubber Ducky", @"Perfume bomb", @"XCode", nil];
    MagicalCreature *creature1 = [[MagicalCreature alloc]initWithName:@"Iron Man" andDetail:@"Playboy" andAccessories:self.accesories];
    creature1.creaturePicture = [UIImage imageNamed:@"IronMan"];
    MagicalCreature *creature2 = [[MagicalCreature alloc]initWithName:@"Captain America" andDetail:@"Bossy" andAccessories:self.accesories];
    creature2.creaturePicture = [UIImage imageNamed:@"CaptainAmerica"];
    MagicalCreature *creature3 = [[MagicalCreature alloc]initWithName:@"Joker" andDetail:@"Genius" andAccessories:self.accesories];
    creature3.creaturePicture = [UIImage imageNamed:@"The Joker"];
    self.creatures = [NSMutableArray arrayWithObjects:creature1, creature2, creature3, nil];
    self.tableView.allowsMultipleSelection = YES;

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
    cell.detailTextLabel.text = aCreature.detail;
    return cell;
}

- (IBAction)onAddButtonTapped:(UIButton *)sender
{
    MagicalCreature *newCreature = [[MagicalCreature alloc]initWithName:self.nameTextField.text andDetail:self.detailTextField.text andAccessories:self.accesories];
    [self.creatures addObject:newCreature];
    self.nameTextField.text = @"";
    [self.nameTextField resignFirstResponder];
    [self.tableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqual:@"ShowCreatureSegue"])
    {
        CreatureViewController *creatureVC = segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        MagicalCreature *aCreature = self.creatures[selectedIndexPath.row];
        creatureVC.creature = aCreature;
    } else if ([segue.identifier isEqual:@"ShowWinnerSegue"])
    {

        BattleViewController *battleVC = segue.destinationViewController;
        NSArray *selectedIndexPaths = [self.tableView indexPathsForSelectedRows];
        NSMutableArray *selectedCreatures = [NSMutableArray new];

//        NSLog(@"%@", winner.name);
        for (NSIndexPath *indexPath in selectedIndexPaths) {
            MagicalCreature *creature = self.creatures[indexPath.row];
            [selectedCreatures addObject:creature];
        }
        MagicalCreature *winner = selectedCreatures[arc4random()%selectedCreatures.count];
        battleVC.winner = winner;
        NSLog(@"%@", selectedCreatures);
//        battleVC.contenders = selectedCreatures;
    }
}


@end

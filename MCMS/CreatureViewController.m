//
//  CreatureViewController.m
//  MCMS
//
//  Created by Justin Haar on 3/17/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.creature.name;
    self.detailLabel.text = self.creature.detail;
    self.imageView.image = self.creature.creaturePicture;
    self.tableView.allowsMultipleSelection = YES;
    
    
}

- (IBAction)onEditButtonTapped:(UIButton *)sender {
    
    if ([sender.titleLabel.text isEqualToString:@"Edit"] ) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self.textField becomeFirstResponder];
    } else if ([sender.titleLabel.text isEqualToString:@"Done"]) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self.textField resignFirstResponder];
        
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creature.accessories.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID2"];
    NSString *anAccessory = [self.creature.accessories objectAtIndex:indexPath.row];
    cell.textLabel.text = anAccessory;

    if ([self.tableView indexPathForSelectedRow] == indexPath) {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        [tableView reloadData];
    }
    return cell;
}


//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([self.tableView indexPathForSelectedRow] == indexPath) {
//        <#statements#>
//    }
//    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
//    [tableView reloadData];
//}



@end

//
//  CreatureViewController.m
//  MCMS
//
//  Created by Justin Haar on 3/17/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
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
    self.nameTextField.hidden = YES;
    self.detailTextField.hidden = YES;
    
    
}

- (IBAction)onEditButtonTapped:(UIButton *)sender {
    
    if ([sender.titleLabel.text isEqualToString:@"Edit"] ) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        self.nameTextField.placeholder = @"Enter name";
        self.detailTextField.placeholder = @"Enter detail";
        self.nameTextField.hidden = NO;
        self.detailTextField.hidden = NO;
    } else if ([sender.titleLabel.text isEqualToString:@"Done"]) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.nameTextField.hidden = YES;
        self.detailTextField.hidden = YES;
        if (![self.nameTextField.text isEqualToString:@""]) {
            self.creature.name = self.nameTextField.text;
        }
        if (![self.detailTextField.text isEqualToString:@""]) {
            self.creature.detail = self.detailTextField.text;
        }
    }
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![textField.text isEqualToString:@""]) {
        if (textField == self.nameTextField) {
            self.creature.name = textField.text;
        } else if (![textField.text isEqualToString:@""]) {
            self.creature.detail = textField.text;
        }
    }
    
    [textField resignFirstResponder];
    return YES;
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

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;
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

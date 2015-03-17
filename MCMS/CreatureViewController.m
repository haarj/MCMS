//
//  CreatureViewController.m
//  MCMS
//
//  Created by Justin Haar on 3/17/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.creature.name;
    
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

@end

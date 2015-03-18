//
//  BattleViewController.m
//  MCMS
//
//  Created by Justin Haar on 3/17/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "BattleViewController.h"

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = self.winner.creaturePicture;
}


@end

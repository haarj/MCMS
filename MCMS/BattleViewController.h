//
//  BattleViewController.h
//  MCMS
//
//  Created by Justin Haar on 3/17/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagicalCreature.h"

@interface BattleViewController : UIViewController

@property MagicalCreature *winner;
@property (nonatomic) NSArray *contenders;
//@property (nonatomic) NSMutableArray *contenders;

@end

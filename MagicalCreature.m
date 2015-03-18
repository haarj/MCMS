//
//  MagicalCreature.m
//  MCMS
//
//  Created by Justin Haar on 3/17/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithName:(NSString *)creatureName andDetail:(NSString *)creatureDetail andAccessories:(NSMutableArray *)accessories
{
    self = [super init];
    self.name = creatureName;
    self.detail = creatureDetail;
    self.accessories = accessories;
    return self;

}


@end

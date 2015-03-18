//
//  MagicalCreature.h
//  MCMS
//
//  Created by Justin Haar on 3/17/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MagicalCreature : NSObject

@property (nonatomic)NSString *name;
@property (nonatomic)NSString *detail;
@property (nonatomic)UIImage *creaturePicture;
@property (nonatomic)NSMutableArray *accessories;

-(instancetype)initWithName:(NSString *)name andDetail:(NSString *)creatureDetail andAccessories:(NSMutableArray *)accessories;

@end

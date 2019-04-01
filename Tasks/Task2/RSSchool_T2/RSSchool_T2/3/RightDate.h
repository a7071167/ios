//
//  RightDate.h
//  RSSchool_T2
//
//  Created by user on 4/1/19.
//  Copyright © 2019 Alexander Shalamov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoomsdayMachine.h"

@interface RightDate : NSObject <AssimilationInfo>

@property (nonatomic, readonly) NSInteger years;
@property (nonatomic, readonly) NSInteger months;
@property (nonatomic, readonly) NSInteger days;
@property (nonatomic, readonly) NSInteger hours;
@property (nonatomic, readonly) NSInteger minutes;
@property (nonatomic, readonly) NSInteger seconds;


- (void) componentsToProperties:(NSDateComponents *)components;

@end



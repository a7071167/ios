//
//  RightDate.m
//  RSSchool_T2
//
//  Created by user on 4/1/19.
//  Copyright © 2019 Alexander Shalamov. All rights reserved.
//

#import "RightDate.h"

@interface RightDate ()

@property (nonatomic, readwrite) NSInteger years;
@property (nonatomic, readwrite) NSInteger months;
@property (nonatomic, readwrite) NSInteger days;
@property (nonatomic, readwrite) NSInteger hours;
@property (nonatomic, readwrite) NSInteger minutes;
@property (nonatomic, readwrite) NSInteger seconds;

@end


@implementation RightDate

- (void) componentsToProperties:(NSDateComponents *)components; {
    self.years = components.year;
    self.months = components.month;
    self.days = components.day;
    self.hours = components.hour;
    self.minutes = components.minute;
    self.seconds = components.second;
}



@end

#import "DoomsdayMachine.h"
#import "RightDate.h"

@implementation DoomsdayMachine {
    NSString *str;
}

- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString {

    NSDateFormatter *formatDateString = [[NSDateFormatter alloc] init];
    [formatDateString setDateFormat:@"yyyy:MM:dd@ss\\mm/HH"];
    NSDate *date = [formatDateString dateFromString:dateString];
    
    str = @"14 August 2208 03:13:37";
    NSDateFormatter *formatStr = [[NSDateFormatter alloc] init];
    [formatStr setDateFormat:@"dd MMMM yyyy HH:mm:ss"];
    NSDate *date2 = [formatStr dateFromString:str];
    [formatDateString release];
    [formatStr release];
    
    NSCalendar *iCal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [iCal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:date toDate:date2 options:0];
    
    [iCal release];
    [date release];
    [date2 release];
    RightDate *rightDate = [[RightDate alloc] init];
    [rightDate componentsToProperties:components];
    return [rightDate autorelease];
}

- (NSString *)doomsdayString {
    str = @"14 August 2208 03:13:37";
    NSString *dateOfAssimilation = [NSString stringWithFormat:@"%@", str];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd MMMM yyyy HH:mm:ss"];
    NSDate *date = [dateFormat dateFromString:dateOfAssimilation];
    NSLog(@"%@", date);
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateStyle:NSDateFormatterFullStyle];
    NSString *newFormatString = [dateFormater stringFromDate:date];
    
    [dateFormat release];
    [dateFormater release];
    
    
    NSLog(@"%@", newFormatString);
    return newFormatString;
 
}



@end

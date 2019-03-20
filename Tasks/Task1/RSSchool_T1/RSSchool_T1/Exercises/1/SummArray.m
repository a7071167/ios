#import "SummArray.h"

@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    NSInteger result = 0;
    for (int i = 0; i < array.count; i++) {
        result += [array[i] integerValue];
    }
    return @(result);
}

@end

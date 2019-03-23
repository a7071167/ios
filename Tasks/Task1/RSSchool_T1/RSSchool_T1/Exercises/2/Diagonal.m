#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    NSInteger sumDiagonalOne = 0;
    NSInteger sumDiagonalTwo = 0;
    NSInteger count = 0;
    
    for (NSString *str in array) {
        NSArray *arraysElements = [str componentsSeparatedByString:@" "];
        sumDiagonalTwo += [arraysElements[arraysElements.count - count - 1] integerValue];
        sumDiagonalOne += [arraysElements[count++] integerValue];
    }
    NSNumber *number = @(llabs(sumDiagonalOne - sumDiagonalTwo));
    return number;
}

@end

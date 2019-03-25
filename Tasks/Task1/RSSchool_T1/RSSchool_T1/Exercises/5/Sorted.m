#import "Sorted.h"

@implementation ResultObject
@end

@implementation Sorted

// Complete the sorted function below.
- (ResultObject*)sorted:(NSString*)string {
    ResultObject *value = [ResultObject new];
    
    NSInteger counterNumbers = 1;
    NSInteger counterNum = 1;
    NSInteger balance = 1;
    NSInteger reverseCounter = 0;
    NSString *key = @"OFF";
    NSArray *numbers = [NSArray new];
    numbers = [string componentsSeparatedByString:@" "];
    
    NSMutableArray *num = [[NSMutableArray alloc] initWithArray:numbers];
    
    NSMutableArray *orderedNumbers = [NSMutableArray new];
    NSMutableArray *disOrderedNumbers = [NSMutableArray new];
    
    NSMutableArray *reversingNumbers = [NSMutableArray new];
    NSMutableArray *disReversingNumbers = [NSMutableArray new];
    
    if (numbers.count == 2) {
        balance = 0;
    }
    for (int i = 0; i < numbers.count - balance; i++) {
        if ([numbers[i] integerValue] < [numbers[i + 1] integerValue]) {
            if (reverseCounter != 0) {
                [reversingNumbers addObject:@(i)];
                [disReversingNumbers addObject:numbers[i]];
                reverseCounter++;
            }
            counterNumbers++;
            if (counterNumbers == numbers.count) {
                key = @"YES";
            }
        }
        else {
            if (orderedNumbers.count == 0) {
                [orderedNumbers addObject:@(i)];
                [disOrderedNumbers addObject:numbers[i]];
                [reversingNumbers addObject:@(i)];
                [disReversingNumbers addObject:numbers[i]];
                if (balance == 0) {
                    [orderedNumbers addObject:@(i + 1)];
                    [disOrderedNumbers addObject:numbers[i + 1]];
                    break;
                }
                reverseCounter++;
            } else {
                [orderedNumbers addObject:@(i + 1)];
                [disOrderedNumbers addObject:numbers[i + 1]];
                [reversingNumbers addObject:@(i)];
                [disReversingNumbers addObject:numbers[i]];
                reverseCounter++;
            }
        }
    }
    
    disOrderedNumbers = [[[disOrderedNumbers reverseObjectEnumerator] allObjects] mutableCopy];
    disReversingNumbers = [[[disReversingNumbers reverseObjectEnumerator] allObjects] mutableCopy];
    
    if (orderedNumbers.count == 2) {
        for (NSInteger i = 0; i < orderedNumbers.count; i++) {
            NSInteger abc = [orderedNumbers[i] integerValue];
            num[abc] = disOrderedNumbers[i];
        }
        key = @"SWAP";
    } else if ((disReversingNumbers.count != 0) && (disReversingNumbers.count == reverseCounter)){
        for (NSInteger i = 0; i < reversingNumbers.count; i++) {
            NSInteger abc = [reversingNumbers[i] integerValue];
            num[abc] = disReversingNumbers[i];
        }
        key = @"REVERSE";
    }


    reverseCounter = 0;
    for (NSInteger i = 0; i < num.count - 1; i++) {
        if ([num[i] integerValue] < [num[i + 1] integerValue]) {
            counterNum++;
            reverseCounter++;
        }
    }
    
    
    
    if ((counterNumbers) || (counterNum) == num.count) {
        if ((counterNum) == num.count) {
            if ([key containsString:@"SWAP"]) {
                value.status = YES;
                NSString *detail = [NSString stringWithFormat:@"swap %ld %ld", (long)([orderedNumbers[0] integerValue] + 1), (long)([orderedNumbers[1] integerValue] + 1)];
                value.detail = detail;
            } else if ([key containsString:@"REVERSE"]){
                value.status = YES;
                NSString *detail = [NSString stringWithFormat:@"reverse %ld %ld", (long)([reversingNumbers.firstObject integerValue] + 1), (long)([reversingNumbers.lastObject integerValue] + 1)];
                value.detail = detail;
            } else {
                value.status = YES;
                NSString *detail = @"yes";
                value.detail = detail;
            }
        } else {
            value.status = NO;
            NSString *detail = @"no";
            value.detail = detail;
        }
        
        
    } else {

    }
    
    return value;
}

@end

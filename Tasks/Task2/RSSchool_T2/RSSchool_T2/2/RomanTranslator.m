#import "RomanTranslator.h"

@implementation RomanTranslator

- (NSString *)arabicFromRoman:(NSString *)romanString {
    
    NSDictionary *dictArabicRoman = @{@"I": @(1),
                                      @"V": @(5),
                                      @"X": @(10),
                                      @"L": @(50),
                                      @"C": @(100),
                                      @"D": @(500),
                                      @"M": @(1000)
                                      };
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSInteger summ = 0;
    [romanString retain];
    [romanString enumerateSubstringsInRange:NSMakeRange(0, romanString.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        
        NSInteger delta = 0;
        
        for (NSString *key in dictArabicRoman.allKeys) {
            NSNumber *value = [dictArabicRoman objectForKey:key];
            if ([key isEqualToString:substring]) {
                if (substringRange.location > 0) {
                    NSInteger firstNumber = [[result lastObject] integerValue];
                    NSInteger secondNumber = [value integerValue];
                    for (NSString *sameKey in dictArabicRoman) {
                        if (firstNumber == [[dictArabicRoman objectForKey:sameKey] integerValue]) {
                            if (firstNumber < secondNumber) {
                                delta = labs((firstNumber - secondNumber));
                                [result removeLastObject];
                                [result addObject:@(delta)];
                                break;
                            } else if (firstNumber == secondNumber) {
                                [result addObject:@(firstNumber)];
                                break;
                            }
                        }
                    }
                }
                if (([result.lastObject integerValue] > [value integerValue]) || (result.count == 0)) {
                    [result addObject:value];
                }
                break;
            }
        }
    }];

    for (NSInteger i = 0; i < result.count; i++) {
        summ += [result[i] integerValue];
    }
    
    NSString *resultString = [NSString stringWithFormat:@"%ld", (long)summ];
    
    [romanString release];
    [result release];
    
    return [resultString autorelease];
}


- (NSString *)romanFromArabic:(NSString *)arabicString {
    
    NSDictionary *dictArabicRoman = @{@(1): @"I",
                                      @(5): @"V",
                                      @(10): @"X",
                                      @(50): @"L",
                                      @(100): @"C",
                                      @(500): @"D",
                                      @(1000): @"M"
                                      };
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSMutableArray *resultMax = [[NSMutableArray alloc] init];
    NSMutableArray *converter = [[NSMutableArray alloc] init];
    NSString *resultString = [[NSString alloc] init];
    
    NSInteger multiplier = 1;
    for (NSInteger i = 1; i < arabicString.length; i++) {
        multiplier *= 10;
    }
    [arabicString retain];
    [arabicString enumerateSubstringsInRange:NSMakeRange(0, arabicString.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        
        NSString *strMultiplier = [[[NSString alloc] init] autorelease];
        NSString *strEnd = [[[NSString alloc] init] autorelease];
        strMultiplier = [@(multiplier) stringValue];
        strMultiplier = [strMultiplier substringToIndex:(arabicString.length - enclosingRange.location)];
        
            NSInteger multip = [strMultiplier integerValue];
            NSInteger abc = [substring integerValue] * [strMultiplier integerValue];
            NSInteger max = 0;
            NSInteger min = 0;
            NSInteger maxMin = 0;
            for (NSNumber *roman in dictArabicRoman.allKeys) {
                if ([roman integerValue] <= abc) {
                    [result addObject:roman];
                }
                if ([roman integerValue] > abc) {
                    [resultMax addObject:roman];
                    min = [roman integerValue];
                    maxMin = [roman integerValue];
                }
            }
        
            while (abc > 0) {
                max = 0;
                if (max > abc) {
                    [result removeObject:@(max)];
                }
                for (NSInteger i = 0; i < result.count; i++) {
                    if ([result[i] integerValue] > max) {
                        max = [result[i] integerValue];
                    }
                    if ([result[i] integerValue] < maxMin) {
                        maxMin = [result[i] integerValue];
                    }
                }
                for (NSInteger i = 0; i < resultMax.count; i++) {
                    if ([resultMax[i] integerValue] < min) {
                        min = [resultMax[i] integerValue];
                    }
                }
                if (([substring integerValue] * multip) == (min - maxMin * multip)) {
                    strEnd = [strEnd stringByAppendingString:[dictArabicRoman objectForKey:@((maxMin * multip))]];
                    strEnd = [strEnd stringByAppendingString:[dictArabicRoman objectForKey:@(min)]];
                    abc = abc - (min - maxMin * multip);
                } else {
                    if (result.count == 1) {
                        abc = abc - max;
                        strEnd = [strEnd stringByAppendingString:[dictArabicRoman objectForKey:@(max)]];
                    } else {
                        abc = abc - max;
                        strEnd = [strEnd stringByAppendingString:[dictArabicRoman objectForKey:@(max)]];
                        [result removeObject:@(max)];
                    }
                }
            }
        [result removeAllObjects];
        [resultMax removeAllObjects];
        [converter addObject:strEnd];
        
    }];

    for (NSInteger i = 0; i < converter.count; i++) {
        resultString = [resultString stringByAppendingString:converter[i]];
    }
    
    [converter release];
    [arabicString release];
    return resultString;
}


@end

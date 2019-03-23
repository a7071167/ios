#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
    NSString *pangrams = @"";
    NSString *lineOfCharacters = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *lowercaseString = [lineOfCharacters lowercaseString];

    for (int i = 0; i <= lowercaseString.length; i++) {
        NSString *abc = [lowercaseString substringToIndex:i];
        if (abc.length > 0) {
            abc = [abc substringFromIndex:i - 1];
        }
        if ([pangrams containsString:abc]) {
        } else  {
            pangrams = [pangrams stringByAppendingString:abc];
        }
    }
    if (pangrams.length == 26) {
        return YES;
    } else {
        return NO;
    }
}

@end

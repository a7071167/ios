#import "KidnapperNote.h"

@implementation KidnapperNote

- (BOOL)checkMagazine:(NSString *)magaine note:(NSString *)note {
    NSInteger counter = 0;
    NSArray *magazines = [[magaine lowercaseString] componentsSeparatedByString:@" "];
    NSArray *notes = [[note lowercaseString] componentsSeparatedByString:@" "];
    
    NSMutableArray *magazineArray = [[NSMutableArray alloc] initWithArray:magazines];
    
    for (NSString *strNote in notes) {
        for (NSString *strMagazine in magazineArray) {
            if ([strNote isEqualToString:strMagazine]) {
                [magazineArray removeObject:strMagazine];
                counter++;
                break;
            }
        }
    }
    if (counter == notes.count) {
        return YES;
    } else {
        return NO;
    }
}

@end

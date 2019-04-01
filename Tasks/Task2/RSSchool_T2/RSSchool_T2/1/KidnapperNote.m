#import "KidnapperNote.h"

@implementation KidnapperNote

- (BOOL)checkMagazine:(NSString *)magaine note:(NSString *)note {
    NSInteger counter = 0;
    [note retain];
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
    
    [magazineArray release];
    if (counter == notes.count) {
        [note release];
        return YES;
    } else {
        return NO;
    }
}

@end

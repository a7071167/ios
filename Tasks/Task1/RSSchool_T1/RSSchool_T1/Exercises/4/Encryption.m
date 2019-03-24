#import "Encryption.h"

@implementation Encryption

// Complete the encryption function below.
- (NSString *)encryption:(NSString *)string {
    NSString *stringWithRemovedSpaces = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSInteger stringWithRemovedSpacesLenght = stringWithRemovedSpaces.length;
    NSMutableArray *matrix = [[NSMutableArray alloc] init];
    NSString *addSpaces = @"";
    NSInteger lastRow;
    NSString *code =@"";
    
    NSInteger rows = floor(sqrt(stringWithRemovedSpacesLenght));
    NSInteger columns = ceil(sqrt(stringWithRemovedSpacesLenght));
    NSInteger columnsConst = columns;
   
    if ((rows * columns) < stringWithRemovedSpacesLenght) {
        rows++;
    }
        for (int i = 1; i <= rows; i++) {
                lastRow = stringWithRemovedSpacesLenght - (columns * (i - 1));
            if (lastRow < columns) {
                for (int m = 0; m < (columns - lastRow); m++) {
                    addSpaces = [addSpaces stringByAppendingString:@"_"];
                }
                columns = lastRow;
            }
            NSString *row = [[stringWithRemovedSpaces substringToIndex:columns] stringByAppendingString:addSpaces];
            stringWithRemovedSpaces = [stringWithRemovedSpaces substringFromIndex:columns];
            [matrix addObject:row];
        }

        for (int j = 1; j <= columnsConst; j++) {
            for (int i = 0; i < matrix.count; i++) {
                NSString *chiper = [matrix[i] substringToIndex:j];
                if (chiper.length > 0) {
                    chiper = [chiper substringFromIndex:j - 1];
                }
                code = [code stringByAppendingString:chiper];
            }
            if (code.length > 0) {
                code = [code stringByAppendingString:@" "];
            }
        }
    code = [code substringToIndex:code.length - 1];
    code = [code stringByReplacingOccurrencesOfString:@"_" withString:@""];

    return code;
}

@end

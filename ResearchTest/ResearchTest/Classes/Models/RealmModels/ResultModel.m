//
//  Result.m
//  ResearchTest
//
//  Created by Александр on 11.04.2021.
//

#import "ResultModel.h"

@implementation ResultModel

- (NSString *) printDate {
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:self.timestamp];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd:MM:yyyy hh:mm"];
    return [formatter stringFromDate:date];
}

@end

//
//  Result.h
//  ResearchTest
//
//  Created by Александр on 11.04.2021.
//

//#import "RLMObject.h"
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResultModel : RLMObject

@property NSString *name;
@property NSInteger timestamp;
@property NSString *conclusion;
@property NSString *type;
@property NSString *details;

- (NSString *) printDate;

@end

NS_ASSUME_NONNULL_END

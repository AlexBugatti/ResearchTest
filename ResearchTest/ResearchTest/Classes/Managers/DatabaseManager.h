//
//  DatabaseManager.h
//  ResearchTest
//
//  Created by Александр on 11.04.2021.
//

#import <Foundation/Foundation.h>
#import "ResultModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DatabaseManager : NSObject

+ (instancetype)sharedInstance;

- (void)addResultName:(NSString *)name withType:(NSString *)type andConclusion:(NSString *)conclusion description:(NSString *)description;
- (NSArray*)getResultsWith:(nullable NSString *)type;

@end

NS_ASSUME_NONNULL_END

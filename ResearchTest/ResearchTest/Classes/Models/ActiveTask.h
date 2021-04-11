//
//  ActiveTask.h
//  ResearchTest
//
//  Created by Александр on 11.04.2021.
//

#import <Foundation/Foundation.h>
#import <ResearchKit/ResearchKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ActiveTask : NSObject

+ (ORKOrderedTask *)twoFingerTask;
+ (ORKOrderedTask *)spatialMemory;
+ (ORKOrderedTask *)stroopTest;
+ (ORKOrderedTask *)trailMaking;
+ (ORKOrderedTask *)pavsat;
+ (ORKOrderedTask *)amslerGrid;

@end

NS_ASSUME_NONNULL_END

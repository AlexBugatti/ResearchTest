//
//  ActiveTask.m
//  ResearchTest
//
//  Created by Александр on 11.04.2021.
//

#import "ActiveTask.h"
#import "Constant.h"

@interface ActiveTask ()

@end

@implementation ActiveTask

+ (ORKOrderedTask *)twoFingerTask {
    ORKOrderedTask *task = [ORKOrderedTask twoFingerTappingIntervalTaskWithIdentifier:TWO_FINGER intendedUseDescription:@"Two Finger" duration:7.0 handOptions:ORKPredefinedTaskHandOptionBoth options:ORKPredefinedTaskOptionNone];
    return task;
}

+ (ORKOrderedTask *)spatialMemory {
    ORKOrderedTask *task = [ORKOrderedTask spatialSpanMemoryTaskWithIdentifier:SPATIAL_MEMORY intendedUseDescription:@"Spatial Memory" initialSpan:3 minimumSpan:2 maximumSpan:5 playSpeed:5 maximumTests:5 maximumConsecutiveFailures:2 customTargetImage:nil customTargetPluralName:@"Plural name" requireReversal:YES options:ORKPredefinedTaskOptionNone];
    return task;
}

+ (ORKOrderedTask *)stroopTest {
    ORKOrderedTask *task = [ORKOrderedTask stroopTaskWithIdentifier:STROOP_TEST intendedUseDescription:@"Stroop Test" numberOfAttempts:3 options:ORKPredefinedTaskOptionNone];
    return task;
}

+ (ORKOrderedTask *)trailMaking {
    ORKOrderedTask *task = [ORKOrderedTask trailmakingTaskWithIdentifier:TRAIL_MAKING intendedUseDescription:TRAIL_MAKING trailmakingInstruction:TRAIL_MAKING trailType:ORKTrailMakingTypeIdentifierA options:ORKPredefinedTaskOptionNone];
    
    return task;
}

+ (ORKOrderedTask *)pavsat {
    ORKOrderedTask *task = [ORKOrderedTask PSATTaskWithIdentifier:PAVSAT intendedUseDescription:PAVSAT presentationMode:ORKPSATPresentationModeVisual interStimulusInterval:5 stimulusDuration:3 seriesLength:3 options:ORKPredefinedTaskOptionNone];
    
    return task;
}

+ (ORKOrderedTask *)amslerGrid {
    ORKOrderedTask *task = [ORKOrderedTask amslerGridTaskWithIdentifier:AMSLER_GRID intendedUseDescription:AMSLER_GRID options:ORKPredefinedTaskOptionNone];
    
    return task;
}

@end

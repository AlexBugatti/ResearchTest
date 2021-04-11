//
//  TaskModel.m
//  ResearchTest
//
//  Created by Александр on 11.04.2021.
//

#import "TaskModel.h"
#import "ActiveTask.h"
#import "Constant.h"

@implementation TaskModel

+ (NSArray *)tasks {
    
    TaskModel *fingers = [[TaskModel alloc] init];
    fingers.name = @"Two fingers";
    fingers.type = TWO_FINGER;
    fingers.task = [ActiveTask twoFingerTask];
    
    TaskModel *memory = [[TaskModel alloc] init];
    memory.name = @"Spatial Memory";
    memory.type = SPATIAL_MEMORY;
    memory.task = [ActiveTask spatialMemory];
    
    TaskModel *stroopTest = [[TaskModel alloc] init];
    stroopTest.name = @"Stroop Test";
    stroopTest.type = STROOP_TEST;
    stroopTest.task = [ActiveTask stroopTest];
    
    TaskModel *trailMaking = [[TaskModel alloc] init];
    trailMaking.name = @"Trail Making";
    trailMaking.type = TRAIL_MAKING;
    trailMaking.task = [ActiveTask trailMaking];
    
    TaskModel *pavsat = [[TaskModel alloc] init];
    pavsat.name = @"Pavsat";
    pavsat.type = PAVSAT;
    pavsat.task = [ActiveTask pavsat];
    
    TaskModel *amsler = [[TaskModel alloc] init];
    amsler.name = @"Amsler Grid";
    amsler.type = AMSLER_GRID;
    amsler.task = [ActiveTask amslerGrid];
    
    return @[fingers, memory, stroopTest, trailMaking, pavsat, amsler];
}

@end

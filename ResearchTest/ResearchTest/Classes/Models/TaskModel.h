//
//  TaskModel.h
//  ResearchTest
//
//  Created by Александр on 11.04.2021.
//

#import <Foundation/Foundation.h>
#import <ResearchKit/ResearchKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TaskModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) ORKOrderedTask *task;

+ (NSArray*)tasks;

@end

NS_ASSUME_NONNULL_END

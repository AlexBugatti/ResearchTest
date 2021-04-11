//
//  DatabaseManager.m
//  ResearchTest
//
//  Created by Александр on 11.04.2021.
//

#import "DatabaseManager.h"
#import <Realm/Realm.h>

@interface DatabaseManager ()

@property (strong, nonatomic) RLMRealm *realm;

@end

@implementation DatabaseManager

+ (instancetype)sharedInstance {
    static DatabaseManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (instancetype)init {
  if (self = [super init]) {
      self.realm = [RLMRealm defaultRealm];
  }
  return self;
}

- (void)addResultName:(NSString *)name withType:(NSString *)type andConclusion:(NSString *)conclusion description:(NSString *)description  {
    ResultModel * model = [[ResultModel alloc] init];
    model.name = name;
    model.conclusion = conclusion;
    model.type = type;
    model.timestamp = (NSInteger)[NSDate date].timeIntervalSince1970;
    model.details = description;
    [self.realm transactionWithBlock:^{
        [self.realm addObject:model];
    }];
}

- (NSArray*)getResultsWith:(nullable NSString *)type {
    RLMResults<ResultModel*> *results = [ResultModel allObjects];
    NSMutableArray *array = [NSMutableArray array];
    for (ResultModel *object in results) {
        if (type != nil) {
           if ([object.type isEqualToString:type]) {
               [array addObject:object];
           }
        } else {
            [array addObject:object];
        }
    }
    [array sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:NO]]];

    return array;
}

@end

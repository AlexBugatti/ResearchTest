//
//  ResultCell.h
//  ResearchTest
//
//  Created by Александр on 11.04.2021.
//

#import <UIKit/UIKit.h>
#import "ResultModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ResultCell : UITableViewCell

- (void)configure:(ResultModel *)model;

@end

NS_ASSUME_NONNULL_END

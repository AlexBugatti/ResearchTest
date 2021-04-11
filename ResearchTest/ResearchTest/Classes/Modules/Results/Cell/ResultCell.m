//
//  ResultCell.m
//  ResearchTest
//
//  Created by Александр on 11.04.2021.
//

#import "ResultCell.h"

@interface ResultCell ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation ResultCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.containerView.layer.cornerRadius = 10;
    self.containerView.layer.masksToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configure:(ResultModel *)model {
    self.titleLabel.text = model.name;
    self.resultLabel.text = [NSString stringWithFormat:@"Conclusion: %@", model.conclusion];
    self.dateLabel.text = [model printDate];
}

@end

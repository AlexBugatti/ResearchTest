//
//  DetailTaskController.m
//  ResearchTest
//
//  Created by Александр on 11.04.2021.
//

#import "DetailTaskController.h"

@interface DetailTaskController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSString *text;

@end

@implementation DetailTaskController

- (instancetype)initWithText:(NSString *)text {
    self = [super initWithNibName:nil bundle:nil];
    self.text = text;
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Detail Task";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textView setText:self.text];
    // Do any additional setup after loading the view from its nib.
}

//- (void)configure:(NSString *)string {
//    [self.textView setText:string];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

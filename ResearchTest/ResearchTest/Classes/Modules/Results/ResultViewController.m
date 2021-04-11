//
//  ResultViewController.m
//  ResearchTest
//
//  Created by Александр on 11.04.2021.
//

#import "ResultViewController.h"
#import "ResultModel.h"
#import "ResultCell.h"
#import "DetailTaskController.h"

@interface ResultViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *models;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UILabel *placeholder;

@end

@implementation ResultViewController

- (instancetype)initWithResults:(NSArray *)results {
    self = [super initWithNibName:nil bundle:nil];
    self.models = [[NSArray alloc] initWithArray:results];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"History";
    self.placeholder = [[UILabel alloc] init];
    self.placeholder.text = @"Empty Result";
    [self.placeholder setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.placeholder.textColor = [UIColor grayColor];
    [self.view addSubview:self.placeholder];
    [[self.placeholder.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
    [[self.placeholder.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [self.tableView registerNib:[UINib nibWithNibName:@"ResultCell" bundle:nil] forCellReuseIdentifier:@"ResultCell"];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.placeholder setHidden:(self.models.count > 0)];

    // Do any additional setup after loading the view from its nib.
}

//- (void)setData:(NSArray *)models {
////    self.models = models;
//    [self.placeholder setHidden:(self.models.count > 0)];
//    [self.tableView reloadData];
//}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"ResultCell";

    ResultModel *model = self.models[indexPath.row];
    ResultCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ResultCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell configure:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ResultModel *model = self.models[indexPath.row];
    DetailTaskController *vc = [[DetailTaskController alloc] initWithText:model.details];
    [self.navigationController pushViewController:vc animated:YES];
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 100.0;
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

//
//  TasksViewController.m
//  ResearchTest
//
//  Created by Александр on 11.04.2021.
//

#import "TasksViewController.h"
#import "TaskModel.h"
#import "DatabaseManager.h"
#import "ResultViewController.h"

@interface TasksViewController () <UITableViewDelegate, UITableViewDataSource, ORKTaskViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *tasks;

@end

@implementation TasksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Please select task";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView setDelegate: self];
    [self.tableView setDataSource: self];
    
    self.tasks = [TaskModel tasks];
    [self.tableView reloadData];
    // Do any additional setup after loading the view from its nib.
}

- (void)showActionSheet:(TaskModel *)model {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Select mode" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * testAction = [UIAlertAction actionWithTitle:@"Take Test" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self showTaskController:model];
    }];
    UIAlertAction * resultAction = [UIAlertAction actionWithTitle:@"Show Result" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self showResults: model.type];
    }];
    [alert addAction:testAction];
    [alert addAction:resultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showTaskController:(TaskModel *)model {
    ORKTaskViewController *taskVC = [[ORKTaskViewController alloc] initWithTask:model.task taskRunUUID:nil];
    taskVC.delegate = self;
    [self presentViewController:taskVC animated:YES completion:nil];
}

- (void)showResults:(nullable NSString *)type {
    NSArray *models = [[DatabaseManager sharedInstance] getResultsWith:type];
    ResultViewController *resultVC = [[ResultViewController alloc] initWithResults:models];
    [self.navigationController pushViewController:resultVC animated:YES];
}

- (void)save:(ORKTaskResult *)result {
    NSString * conclusion = @"Coming soon";
    NSMutableString * string = [[NSMutableString alloc] init];
    for (ORKStepResult *res in result.results) {
        if ([res.identifier isEqualToString:@"conclusion"] && res.results.count > 0) {
            ORKResult *object = res.results.lastObject;
            conclusion = object.identifier;
        }
        [string appendString:res.description];
    }
    [[DatabaseManager sharedInstance] addResultName:result.identifier withType:result.identifier andConclusion:conclusion description:string];
}

#pragma mark - ORKTaskViewControllerDelegate

- (void)taskViewController:(ORKTaskViewController *)taskViewController didFinishWithReason:(ORKTaskViewControllerFinishReason)reason error:(NSError *)error {
    
    switch (reason) {
        case ORKTaskViewControllerFinishReasonCompleted:
            [self save:taskViewController.result];
            break;
        default:
            break;
    }
    
    [taskViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Actions

- (IBAction)showResult:(id)sender {
    [self showResults:nil];
}


#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    TaskModel *model = self.tasks[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasks.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TaskModel *model = self.tasks[indexPath.row];
    [self showActionSheet:model];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

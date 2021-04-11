//
//  AppDelegate.m
//  ResearchTest
//
//  Created by Александр on 08.04.2021.
//

#import "AppDelegate.h"
#import "TasksViewController.h"

@interface AppDelegate ()

//@property (nonatomic, strong) UIWindow *window;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    TasksViewController *controller = [[TasksViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}

@end

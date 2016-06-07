//
//  AppDelegate.m
//  Blocstagram
//
//  Created by Eddy Chan on 4/26/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import "AppDelegate.h"
#import "DataSource.h"
#import "ImagesTableViewController.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor    = [UIColor whiteColor];
    
    // Create the data source (so it can receive the access token notification)
    [DataSource sharedInstance];
    
    UINavigationController *navVC = [[UINavigationController alloc] init];
    
    if (![DataSource sharedInstance].accessToken) {
        LoginViewController *loginVC  = [[LoginViewController alloc] init];
        
        [navVC setViewControllers:@[loginVC] animated:YES];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:LoginViewControllerDidGetAccessTokenNotification
                                                          object:nil
                                                           queue:nil
                                                      usingBlock:^(NSNotification *note) {
            ImagesTableViewController *imagesVC = [[ImagesTableViewController alloc] init];
            [navVC setViewControllers:@[imagesVC] animated:YES];
        }];
    }
    else {
        ImagesTableViewController *imagesVC = [[ImagesTableViewController alloc] init];
        [navVC setViewControllers:@[imagesVC] animated:YES];
    }
    
    self.window.rootViewController = navVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end

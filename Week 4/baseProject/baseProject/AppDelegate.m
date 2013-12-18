//
//  AppDelegate.m
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "AppDelegate.h"

#import "MainViewController.h"
#import "XMLViewController.h"
#import "NewsObject.h"
#import "LoadingViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize  tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //set up loading screen
    UIViewController *loadingView = [[LoadingViewController alloc] initWithNibName:@"LoadingViewController" bundle:nil];
    
    //call custom news object immediately to populate arrays needed
    [[NewsObject GetInstance] getArticles];
    
    //create an NSTimer to allow enough time to retrieve remote data
    timer = [NSTimer scheduledTimerWithTimeInterval:4.0f target:self selector:@selector(onTimeTriggered) userInfo:nil repeats:false];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //set up views to be contained within tabBarController, as well as init the tabBarController
    UIViewController *mainView = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    UIViewController *xmlView = [[XMLViewController alloc] initWithNibName:@"XMLViewController" bundle:nil];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects: mainView, xmlView, nil];
    
    //set the initial rootView to the loadingView until the timer is triggered
    self.window.rootViewController = loadingView;
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)onTimeTriggered
{   //set the rootView to the tabBarController now that all data is in place
    self.window.rootViewController = self.tabBarController;
    //clean up timer now that we are done with it
    [timer invalidate];
    timer = nil;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

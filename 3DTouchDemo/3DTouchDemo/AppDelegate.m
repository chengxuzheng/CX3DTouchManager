//
//  AppDelegate.m
//  3DTouchDemo
//
//  Created by Zheng on 2017/4/28.
//  Copyright © 2017年 Zheng. All rights reserved.
//

#import "AppDelegate.h"
#import "CXForceTouchManager.h"


#import "ViewController.h"
#import "NavViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kNotificationForceTouch1Action) name:@"kNotificationForceTouch1" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kNotificationForceTouch2Action) name:@"kNotificationForceTouch2" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kNotificationForceTouch3Action) name:@"kNotificationForceTouch3" object:nil];

    
    if([CXForceTouchManager checkForceTouchCapabilityAvailable]) {
        [CXForceTouchManager makeShortcutItems:^(CXForceTouchManager *manager) {
            manager.addItem(@"kNotificationForceTouch1",@"按键一",nil,@"add");
            manager.addItem(@"kNotificationForceTouch2",@"按键二",nil,@"addTime");
            manager.addItem(@"kNotificationForceTouch3",@"按键三",nil,@"clock");
            manager.finished();
        }];
    } else {
        NSLog(@"Force Touch 不可用");
    }

    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    [CXForceTouchManager didSelectItemWithType:shortcutItem.type];
}

- (void)kNotificationForceTouch1Action {
    
    FirstViewController *first = [FirstViewController new];
    [self.window.rootViewController presentViewController:first animated:YES completion:nil];
}

- (void)kNotificationForceTouch2Action {
    SecondViewController *second = [SecondViewController new];
    [self.window.rootViewController presentViewController:second animated:YES completion:nil];

}

- (void)kNotificationForceTouch3Action {
    ThirdViewController *third = [ThirdViewController new];
    [self.window.rootViewController presentViewController:third animated:YES completion:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"kNotificationForceTouch1" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"kNotificationForceTouch2" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"kNotificationForceTouch3" object:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
    ViewController *vc = [ViewController new];
    NavViewController *nav = [[NavViewController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;

}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {

}


@end

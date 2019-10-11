//
//  AppDelegate.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/11.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "AppDelegate.h"
#import "LZGMainViewController.h"
#import "OrderVc.h"
#import "OrderManagement.h"
#import "StoreStates.h"
#import "LZGlog.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    LZGMainViewController *vc=[[LZGMainViewController alloc]init];
    self.window.rootViewController=vc;
    OrderVc *ordervc=[[OrderVc alloc]init];
    OrderManagement *ordermanagement=[[OrderManagement alloc]init];
    UINavigationController *ordermanagementnavi=[[UINavigationController alloc]initWithRootViewController:ordermanagement];
    StoreStates *storestatus=[[StoreStates alloc]init];
vc.lzgtabBarControler.viewControllers=@[ordervc,ordermanagementnavi,storestatus];
   // [[UINavigationBar appearance]setBarTintColor:[UIColor blueColor]];
    
    [self.window makeKeyAndVisible];
    LZGlog *logvc=[[LZGlog alloc]init];
    [ [UIApplication sharedApplication].keyWindow.rootViewController presentViewController:logvc animated:YES completion:nil];
    // Override point for customization after application launch.
    [NSThread sleepForTimeInterval:3.0];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
 /* LZGMainViewController *vc=(LZGMainViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    if ([vc.lzgtabBarControler.viewControllers.firstObject respondsToSelector:@selector(storethedata)]) {
        [vc.lzgtabBarControler.viewControllers.firstObject performSelector:@selector(storethedata)];
        NSLog(@"");
    }
    else{NSLog(@"its not orvc");
NSLog(@"%@",NSStringFromClass([vc.tabBarController.viewControllers.firstObject class]));
    }
    NSLog(@"进入后台已经写入数据");*/
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
 LZGMainViewController *vc=(LZGMainViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [vc.lzgtabBarControler.viewControllers.firstObject performSelector:@selector(storethedata)];
    NSLog(@"应用退出已经写入数据!!");
}


@end

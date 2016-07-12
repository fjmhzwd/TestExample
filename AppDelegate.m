//
//  AppDelegate.m
//  TestExample
//
//  Created by wayne on 15-8-30.
//  Copyright (c) 2015年 wayne. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /*
    //    1. 设置通知行为：
    //1.创建可变通知行为
    UIMutableUserNotificationAction * ua = [[UIMutableUserNotificationAction alloc] init];
    //2.设置通知行为的表现为文本输入
    [ua setBehavior:UIUserNotificationActionBehaviorTextInput];
    //3.给action给一个标示符
    [ua setIdentifier:@"myReply"];
    //4.设置行为激活模式为保持后台运行
    [ua setActivationMode:UIUserNotificationActivationModeBackground];
    //    这里设置激活模式时，如果在通知栏回复/阅读之后希望跳转回自己的APP，应当原则前台激活模式，如果回复/阅读之后希望保持后台运行才选择这个模式
    //    2. 设置通知策略:
    //1.创建一个可变通知策略
    UIMutableUserNotificationCategory * cate = [[UIMutableUserNotificationCategory alloc] init];
    //2.给category一个标示符
    [cate setIdentifier:@"textCategory"];
    //3.为这个策略category制定相关的通知行为action
    [cate setActions:@[ua] forContext:UIUserNotificationActionContextDefault];
    //    3. 注册通知配置(iOS8以后的方式):
    //1.通过上面的策略来创建用户通知配置
    UIUserNotificationSettings * settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:[NSSet setWithArray:@[cate]]];
    //2.注册这个通知配置
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    */

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
//UIApplicationDelegate的代理方法提供了这种带reply的通知代理:

//远程通知的带回复通知代理
- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler
{
    
}

//不管具体是本地通知和本地通知，获取到通知栏用户输入的文本内容，只需要去responseInfo这个字典中取UIUserNotificationActionResponseTypedTextKey这个key对应的string就好了。

//本地通知的带回复通知代理
- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
    NSLog(@"用户在文本框中输入的内容:%@",responseInfo [UIUserNotificationActionResponseTypedTextKey]);
    completionHandler();
}

*/

/*
 在需要发送通知的时候，只需要设置对应的策略和行为，就能以这种方式来弹出通知。以本地通知UILocalNotification为例：
 //1.初始化本地通知
 UILocalNotification * noti = [[UILocalNotification alloc]init];
 //2.设置通知正文
 [noti setAlertBody:[NSString stringWithFormat:@"您有新的消息:%@",[NSDate new].description]];
 //3.配置对应的策略和行为(必须之前已经注册过了)
 [noti setCategory:@"textCategory"];
 [noti setAlertAction:@"myReply"];
 //4.弹出通知
 [[UIApplication sharedApplication] presentLocalNotificationNow:noti];
*/

@end

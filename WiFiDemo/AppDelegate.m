//
//  AppDelegate.m
//  WiFiDemo
//
//  Created by 小飞鸟 on 2019/05/15.
//  Copyright © 2019 小飞鸟. All rights reserved.
//

#import "AppDelegate.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <NetworkExtension/NetworkExtension.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    [self getWiFiInfo];
    
    return YES;
}

-(void)getWiFiInfo{
    NSArray * supports =  (__bridge_transfer id)CNCopySupportedInterfaces();
    id SSID = nil;//WiFi标示
    id BSSID = nil;
    id info = nil;
    id SSIDDATA = nil;
    for(NSString * idf in supports){
        info =  (__bridge_transfer id)CNCopyCurrentNetworkInfo((CFStringRef)idf);
        if (info&&[info count]) {
            break;
        }
    }
    
    SSID = [info objectForKey:@"SSID"];
    BSSID = [info objectForKey:@"BSSID"];
    SSIDDATA = [info objectForKey:@"SSIDDATA"];
    
//    NSData *  data = (__bridge NSData*)SSIDDATA;
   NSLog(@"%@",[[NSString alloc]initWithData:SSIDDATA encoding:NSUTF8StringEncoding]);
    
    NSLog(@"SSID***%@",SSID);
    NSLog(@"BSSID***%@",BSSID);
    NSLog(@"SSIDDATA***%@",SSIDDATA);
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
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

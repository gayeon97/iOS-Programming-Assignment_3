//
//  AppDelegate.m
//  hw3
//
//  Created by Gayeon Park on 3/9/20.
//  Copyright © 2020 Gayeon Park. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"term"]){

        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"term"];
        [[NSUserDefaults standardUserDefaults] synchronize];

//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WORKED" message:@"term works" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
//        [alert show];

    }
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"HighScore"];
    
    [[NSUserDefaults standardUserDefaults] setBool: NO forKey:@"block9"];
    [[NSUserDefaults standardUserDefaults] setBool: NO forKey:@"block8"];
    [[NSUserDefaults standardUserDefaults] setBool: NO forKey:@"block7"];
    [[NSUserDefaults standardUserDefaults] setBool: NO forKey:@"block6"];
    [[NSUserDefaults standardUserDefaults] setBool: NO forKey:@"block5"];
    [[NSUserDefaults standardUserDefaults] setBool: NO forKey:@"block4"];
    [[NSUserDefaults standardUserDefaults] setBool: NO forKey:@"block3"];
    [[NSUserDefaults standardUserDefaults] setBool: NO forKey:@"block2"];
    [[NSUserDefaults standardUserDefaults] setBool: NO forKey:@"block1"];
    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

-(void)applicationWillTerminate:(UIApplication *)application {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"term"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"HighScore"];

}




@end

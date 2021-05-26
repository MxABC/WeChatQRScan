//
//  AppDelegate.m
//  WeChatScanDemo
//
//  Created by 夏利兵 on 2021/5/26.
//

#import "AppDelegate.h"
#import "WechatScanViewController.h"


@interface AppDelegate ()
@property (strong, nonatomic) UIWindow *window;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    [self testLoadImageFile];
    
//    [self testWechatQR];
    
    UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    window.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:[[WechatScanViewController alloc]init]];

//    NSString *udidString = [UIDevice currentDevice].identifierForVendor.UUIDString;
//7AC7282B-A930-4931-9426-74859610F6E3

    window.rootViewController = navi;
                                 
    
    [window makeKeyAndVisible];
    
    return YES;
}




@end

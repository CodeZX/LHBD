//
//  AppDelegate+UI.m
//  BasicFramework
//
//  Created by Rainy on 2016/11/7.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "AppDelegate+UI.h"
#import "MainHelper.h"
#import "AvoidCrash.h"
#import "HomePageVC.h"
#import "BasicMainNC.h"
#import "BasicMainTBVC.h"
#import "UserCenterViewController.h"
#import "SDLaunchViewController.h"

@implementation AppDelegate (UI)

-(void)setMyWindowAndRootViewController
{
    [self setItems];
    [self setViews];
}
-(void)setItems
{
    [[UINavigationBar appearance]setBackgroundImage:[UIImage createImageWithColor:WhiteColor] forBarMetrics:UIBarMetricsDefault];
    NSDictionary *dic = @{NSForegroundColorAttributeName:kMainFontColor};
    [[UINavigationBar appearance] setTitleTextAttributes:dic];
    [[UINavigationBar appearance]setTintColor:kMainFontColor];
    [[UIBarButtonItem appearance]setTitleTextAttributes:dic forState:UIControlStateNormal];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [UIApplication sharedApplication].applicationSupportsShakeToEdit = YES;
    
}
-(void)setViews
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    BasicMainTBVC *TBVC  = [[BasicMainTBVC alloc]init];
    SDLaunchViewController *launchVC = [[SDLaunchViewController alloc]initWithMainVC:TBVC viewControllerType:GifBackgroundLaunchViewController];
//    launchVC.hideEndButton = YES;
//    [launchVC.endButton setTitleColor:RedColor forState:UIControlStateNormal];
//    launchVC.endButton.backgroundColor  = RedColor;
    launchVC.gifImageName = @"launch";
//
   
    self.window.rootViewController = launchVC;
    
//    UserCenterViewController *VC = [[UserCenterViewController alloc]init];
//    BasicMainNC *NC = [[BasicMainNC alloc]initWithRootViewController:VC];
//    self.window.rootViewController = NC;
}

-(UIImageView *)GetPortraitIMG
{
    CGSize viewSize = self.window.bounds.size;
    NSString *viewOrientation = @"Portrait";//横屏 @"Landscape"
    __block NSString *launchImage = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    
    [imagesDict enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSDictionary* dict = (NSDictionary *)obj;
        
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            launchImage = dict[@"UILaunchImageName"];
        }
        
    }];
    
    UIImageView *launchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:launchImage]];
    launchView.frame = self.window.bounds;
    
    return launchView;
}












@end

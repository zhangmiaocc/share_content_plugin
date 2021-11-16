#import "ShareContentPlugin.h"

@implementation ShareContentPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"share_content_plugin"
                                     binaryMessenger:[registrar messenger]];
    ShareContentPlugin* instance = [[ShareContentPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    
    if ([@"shareInfo" isEqualToString:call.method]) {
        
        [self startShareWithUrlStr:call.arguments];
        result(nil);
        
    } else {
        
        result(FlutterMethodNotImplemented);
    }
}

- (void)startShareWithUrlStr:(NSString *)urlStr {
    
    NSArray        *activityItems = @[[NSURL URLWithString:urlStr]];
    NSMutableArray *activities    = [NSMutableArray array];
    
    UIActivityViewController *activeViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:activities];
    
    // 不显示哪些分享平台
    activeViewController.excludedActivityTypes = @[UIActivityTypeAddToReadingList, UIActivityTypeOpenInIBooks, UIActivityTypeSaveToCameraRoll];
    
    UIViewController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        activeViewController.popoverPresentationController.sourceView = controller.view;
        activeViewController.popoverPresentationController.sourceRect = CGRectMake(0, UIScreen.mainScreen.bounds.size.height - 100, UIScreen.mainScreen.bounds.size.width, 100);
        [controller presentViewController:activeViewController animated:YES completion:nil];
        
    } else {
        
        [controller presentViewController:activeViewController animated:YES completion:nil];
    }
    
    // 分享结果回调方法
    activeViewController.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType,
                                                        BOOL completed,
                                                        NSArray * _Nullable returnedItems,
                                                        NSError * _Nullable activityError) {};
}

@end

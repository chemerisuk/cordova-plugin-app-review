#import <Cordova/CDV.h>

@interface AppReviewPlugin : CDVPlugin

- (void)requestReview:(CDVInvokedUrlCommand*)command;
- (void)openStoreScreen:(CDVInvokedUrlCommand*)command;

@end

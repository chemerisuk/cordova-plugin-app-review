#import <Cordova/CDV.h>

@interface AppReviewPlugin : CDVPlugin

- (void)requestReviewDialog:(CDVInvokedUrlCommand*)command;
- (void)requestReview:(CDVInvokedUrlCommand*)command;

@end

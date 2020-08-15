#import <Cordova/CDV.h>

@interface InAppReviewPlugin : CDVPlugin

- (void)requestReviewDialog:(CDVInvokedUrlCommand*)command;
- (void)requestReviewManually:(CDVInvokedUrlCommand*)command;

@end

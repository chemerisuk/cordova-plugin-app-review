#import <Cordova/CDV.h>

@interface InAppReviewPlugin : CDVPlugin

- (void)requestReviewDialog:(CDVInvokedUrlCommand*)command;
- (void)requestReview:(CDVInvokedUrlCommand*)command;

@end

#import <Cordova/CDV.h>

@interface InAppReviewPlugin : CDVPlugin

- (void)askToReview:(CDVInvokedUrlCommand*)command;

@end

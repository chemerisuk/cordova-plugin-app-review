#import "InAppReviewPlugin.h"
#import "StoreKit/StoreKit.h"

@implementation InAppReviewPlugin

- (void)askToReview:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult;

    if ([SKStoreReviewController class]) {
        [SKStoreReviewController requestReview];

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Rating dialog requires iOS 10.3+"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end

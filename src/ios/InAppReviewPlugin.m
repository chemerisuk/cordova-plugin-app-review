#import "InAppReviewPlugin.h"
#import "StoreKit/StoreKit.h"

@implementation InAppReviewPlugin

- (void)requestReviewDialog:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult;

    if ([SKStoreReviewController class]) {
        [SKStoreReviewController requestReview];

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Rating dialog requires iOS 10.3+"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)requestReview:(CDVInvokedUrlCommand*)command {
    NSString* bundleId = [[NSBundle mainBundle] infoDictionary][@"CFBundleIdentifier"];
    NSString* lookupURL = [NSString stringWithFormat:@"http://itunes.apple.com/lookup?bundleId=%@", bundleId];
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:lookupURL]];
    NSDictionary* lookup = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

    CDVPluginResult* pluginResult;
    if ([lookup[@"resultCount"] integerValue] == 1) {
        NSString* trackId = lookup[@"results"][0][@"trackId"];
        NSString* reviewURL = [NSString stringWithFormat:@"https://apps.apple.com/app/id%@?action=write-review", trackId];

        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:reviewURL] options:@{} completionHandler:nil];

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Can't get appId"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end

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
    NSString* packageName = [command.arguments objectAtIndex:0];
    if (!packageName) {
        packageName = [[NSBundle mainBundle] infoDictionary][@"CFBundleIdentifier"];
    }
    NSString* trackId = [self fetchTrackId:packageName];

    CDVPluginResult* pluginResult;
    if (trackId) {
        NSString* reviewURL = [NSString stringWithFormat:@"https://apps.apple.com/app/id%@?action=write-review", trackId];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:reviewURL] options:@{} completionHandler:nil];

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Can't get trackId"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (NSString*)fetchTrackId:(NSString*)packageName {
    NSString* lookupURL = [NSString stringWithFormat:@"http://itunes.apple.com/lookup?bundleId=%@", packageName];
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:lookupURL]];
    NSDictionary* lookup = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

    if ([lookup[@"resultCount"] integerValue] == 1) {
        return lookup[@"results"][0][@"trackId"];
    } else {
        return nil;
    }
}

@end

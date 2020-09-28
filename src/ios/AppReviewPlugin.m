#import "AppReviewPlugin.h"
#import "StoreKit/StoreKit.h"

@implementation AppReviewPlugin

- (void)requestReview:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult;
    if ([SKStoreReviewController class]) {
        [SKStoreReviewController requestReview];

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Rating dialog requires iOS 10.3+"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)openStoreScreen:(CDVInvokedUrlCommand*)command {
    NSString* packageName = [command.arguments objectAtIndex:0];
    if ([packageName isKindOfClass:[NSNull class]]) {
        packageName = [[NSBundle mainBundle] infoDictionary][@"CFBundleIdentifier"];
    }
    NSString* trackId = [self fetchTrackId:packageName];

    CDVPluginResult* pluginResult;
    if (trackId) {
        NSString* storeURL = [NSString stringWithFormat:@"https://apps.apple.com/app/id%@", trackId];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:storeURL] options:@{} completionHandler:nil];

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

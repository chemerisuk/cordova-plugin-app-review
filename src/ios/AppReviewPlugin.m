#import "AppReviewPlugin.h"
#import "StoreKit/StoreKit.h"

@implementation AppReviewPlugin

- (void)requestReview:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult;
    if ([SKStoreReviewController class]) {
        BOOL shownInScene = NO;
        if (@available(iOS 14.0, *)) {
            UIWindowScene *scene = self.viewController.view.window.windowScene;
            if (scene) {
                [SKStoreReviewController requestReviewInScene:scene];
                shownInScene = YES;
            }
        }

        if (!shownInScene) {
            [SKStoreReviewController requestReview];
        }

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
    BOOL writeReview = [[command.arguments objectAtIndex:1] boolValue];

    [self.commandDelegate runInBackground:^{
        NSString* trackId = [self fetchTrackId:packageName];

        if (trackId) {
            NSString* storeURL = [NSString stringWithFormat:@"https://apps.apple.com/app/id%@", trackId];

            if (writeReview) {
                storeURL = [NSString stringWithFormat:@"%@?action=write-review", storeURL];
            }

            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:storeURL] options:@{} completionHandler:^(BOOL success) {
                    CDVPluginResult *pluginResult;
                    if (success) {
                        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                    } else {
                        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"openURL reported failure"];
                    }
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }];
            });
        } else {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Can't get trackId"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    }];
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

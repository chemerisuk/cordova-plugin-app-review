export interface AppReviewPlugin {
    /**
     * Launches in-app review dialog.
     *
     * IOS notes:
     * - Supported iOS 10.3+ only
     * - iOS limits the frequency of displaying The Rating dialog
     *
     * Android notes:
     * - After the account on the device has downloaded the app at least once from the
     * internal test track and is part of the testers list, you can deploy new
     * versions of the app via cordova cli and call `requestReview` in debug mode
     * - In-app reviews require your app to be published in Play Store
     * - Google Play enforces a quota on how often a user can be shown the review dialog
     *
     * @returns Callback when operation is completed
     *
     * @see {@link https://developer.apple.com/design/human-interface-guidelines/ios/system-capabilities/}
     * @see {@link https://developer.android.com/guide/playcore/in-app-review#quotas}
     *
     * @example
     * cordova.plugins.AppReview.requestReview();
     * // request dialog and provide fallback
     * cordova.plugins.AppReview.requestReview().catch(function() {
     *     return cordova.plugins.AppReview.openStoreScreen();
     * });
     */
    requestReview(): Promise<void>;

    /**
     * Launches App/Play store page with a review form. By default current app screen
     * is displayed but you can pass a package name string to show another app details.
     *
     * @param packageName Package name to show instead of the current app.
     * @returns Callback when operation is completed
     *
     * @example
     * cordova.plugins.AppReview.openStoreScreen();
     * cordova.plugins.AppReview.openStoreScreen("com.app.example");
     */
    openStoreScreen(packageName?: string): Promise<void>;
}

/** @ignore */
interface CordovaPlugins {
    AppReview: AppReviewPlugin;
}

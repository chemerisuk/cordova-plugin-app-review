export interface AppReviewPlugin {
    /**
     * Launches in-app review dialog.
     *
     * @returns Callback when operation is completed
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

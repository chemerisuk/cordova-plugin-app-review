interface AppReviewPlugin {
    /**
     * Launches inapp review dialog.
     *
     * @example
     * cordova.plugins.AppReview.requestReview();
     */
    requestReview(): Promise<void>;

    /**
     * Launches App/Play store page with a review form.
     * By default current app screen is displayed. Optionally you can pass a package name string to show another app details.
     *
     * @param packageName Optional package name to show another app details instead of the current app.
     *
     * @example
     * cordova.plugins.AppReview.openStoreScreen();
     * cordova.plugins.AppReview.openStoreScreen("com.app.example");
     */
    openStoreScreen(packageName?: string): Promise<void>;
}

interface CordovaPlugins {
    AppReview: AppReviewPlugin;
}

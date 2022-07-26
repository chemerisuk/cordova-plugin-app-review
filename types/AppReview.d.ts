export function AppReview(): void;
export class AppReview {
    /**
     * Launches in-app review dialog.
     *
     * @returns {Promise<void>} Callback when operation is completed
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
     * @param {string} [packageName] Package name to show instead of the current app.
     * @returns {Promise<void>} Callback when operation is completed
     *
     * @example
     * cordova.plugins.AppReview.openStoreScreen();
     * cordova.plugins.AppReview.openStoreScreen("com.app.example");
     */
    openStoreScreen(packageName?: string): Promise<void>;
}
/**
 * Launches in-app review dialog.
 *
 * @returns {Promise<void>} Callback when operation is completed
 *
 * @example
 * cordova.plugins.AppReview.requestReview();
 * // request dialog and provide fallback
 * cordova.plugins.AppReview.requestReview().catch(function() {
 *     return cordova.plugins.AppReview.openStoreScreen();
 * });
 */
export declare function requestReview(): Promise<void>;
/**
 * Launches App/Play store page with a review form. By default current app screen
 * is displayed but you can pass a package name string to show another app details.
 *
 * @param {string} [packageName] Package name to show instead of the current app.
 * @returns {Promise<void>} Callback when operation is completed
 *
 * @example
 * cordova.plugins.AppReview.openStoreScreen();
 * cordova.plugins.AppReview.openStoreScreen("com.app.example");
 */
export declare function openStoreScreen(packageName?: string): Promise<void>;

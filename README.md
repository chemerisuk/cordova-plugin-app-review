# cordova-plugin-app-review

[![NPM version][npm-version]][npm-url] [![NPM downloads][npm-downloads]][npm-url] [![PayPal donate](https://img.shields.io/badge/paypal-donate-ff69b4?logo=paypal)][donate-url] [![Twitter][twitter-follow]][twitter-url]

<table>
    <tr>
        <td><img src="https://developer.apple.com/design/human-interface-guidelines/ios/images/AppRating_2x.png"/></td>
        <td><img src="https://4.bp.blogspot.com/-MSM5VeZfLAU/Xym0OR_huqI/AAAAAAAAPaA/2u9CsMLiQoE4cx3fmQPf0coIH0TuTWiSwCLcBGAsYHQ/s1600/image2.jpg"/></td>
    </tr>
</table>

## Index

<!-- MarkdownTOC levels="2" autolink="true" -->

- [Supported platforms](#supported-platforms)
- [Installation](#installation)
- [Methods](#methods)

<!-- /MarkdownTOC -->

## Supported platforms

* iOS
* Android

## Installation

    $ cordova plugin add cordova-plugin-app-review

Use variable `ANDROID_PLAY_CORE_VERSION` to override dependency version on Android:

    $ cordova plugin add cordova-plugin-app-review --variable ANDROID_PLAY_CORE_VERSION='1.8.+'

## Methods
Most of time you can just use a boilerplate below to trigger the inapp review dialog and fallback to app/play store screen when the dialog wasn't displayed:
```js
cordova.plugins.AppReview.requestReview().catch(function() {
   return cordova.plugins.AppReview.openStoreScreen();
});
```

### requestReview()
Launches inapp review dialog.
```js
cordova.plugins.AppReview.requestReview();
```

IOS notes:

* Supported iOS 10.3+ only.
* [iOS limits the frequency of displaying The Rating dialog](https://developer.apple.com/design/human-interface-guidelines/ios/system-capabilities/ratings-and-reviews/#system-rating-and-review-prompts).

Android notes:

* **After the account on the device has downloaded the app at least once from the internal test track and is part of the testers list, you can deploy new versions of the app via cordova cli and call `requestReview` in debug mode**.
* In-app reviews require your app to be published in Play Store.
* [Google Play enforces a quota on how often a user can be shown the review dialog](https://developer.android.com/guide/playcore/in-app-review#quotas).

### openStoreScreen(_packageName_)
Launches App/Play store page with a review form
```js
cordova.plugins.AppReview.openStoreScreen();
```

By default current app screen is displayed. Optionally you can pass a package name string to show another app details.

[npm-url]: https://www.npmjs.com/package/cordova-plugin-app-review
[npm-version]: https://img.shields.io/npm/v/cordova-plugin-app-review.svg
[npm-downloads]: https://img.shields.io/npm/dm/cordova-plugin-app-review.svg
[twitter-url]: https://twitter.com/chemerisuk
[twitter-follow]: https://img.shields.io/twitter/follow/chemerisuk.svg?style=social&label=Follow%20me
[donate-url]: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=Z9FRHXAYSQ8BL&source=url

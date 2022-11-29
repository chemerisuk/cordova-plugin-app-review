# cordova-plugin-app-review

[![NPM version][npm-version]][npm-url] [![NPM downloads][npm-downloads]][npm-url] [![PayPal donate](https://img.shields.io/badge/paypal-donate-ff69b4?logo=paypal)][donate-url] [![Twitter][twitter-follow]][twitter-url]

<table>
    <tr>
        <td><img src="https://developer.apple.com/design/human-interface-guidelines/ios/images/AppRating_2x.png"/></td>
        <td><img src="https://4.bp.blogspot.com/-MSM5VeZfLAU/Xym0OR_huqI/AAAAAAAAPaA/2u9CsMLiQoE4cx3fmQPf0coIH0TuTWiSwCLcBGAsYHQ/s1600/image2.jpg"/></td>
    </tr>
</table>

[npm-url]: https://www.npmjs.com/package/cordova-plugin-app-review
[npm-version]: https://img.shields.io/npm/v/cordova-plugin-app-review.svg
[npm-downloads]: https://img.shields.io/npm/dm/cordova-plugin-app-review.svg
[twitter-url]: https://twitter.com/chemerisuk
[twitter-follow]: https://img.shields.io/twitter/follow/chemerisuk.svg?style=social&label=Follow%20me
[donate-url]: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=Z9FRHXAYSQ8BL&source=url

## Index

<!-- MarkdownTOC levels="2" autolink="true" -->

- [Supported platforms](#supported-platforms)
- [Installation](#installation)
- [Functions](#functions)

<!-- /MarkdownTOC -->

## Supported platforms

* iOS
    - Supported iOS 10.3+ only
    - [iOS limits the frequency of displaying The Rating dialog](https://developer.apple.com/design/human-interface-guidelines/ios/system-capabilities/)

* Android
    - After the account on the device has downloaded the app at least once from the internal test track and is part of the testers list, you can deploy new versions of the app via cordova cli and call `requestReview` in debug mode
    - In-app reviews require your app to be published in Play Store
    - [Google Play enforces a quota on how often a user can be shown the review dialog](https://developer.android.com/guide/playcore/in-app-review#quotas)

## Installation

    $ cordova plugin add cordova-plugin-app-review

Use variable `ANDROID_PLAY_REVIEW_VERSION` to override dependency version on Android:

    $ cordova plugin add cordova-plugin-app-review \
        --variable ANDROID_PLAY_REVIEW_VERSION='2.0.+'

<!-- TypedocGenerated -->

## Functions

### openStoreScreen

**openStoreScreen**(`packageName?`, `writeReview?`): `Promise`<`void`\>

Launches App/Play store page with a review form. By default current app screen
is displayed but you can pass a package name string to show another app details.

**`Example`**

```ts
cordova.plugins.AppReview.openStoreScreen();
cordova.plugins.AppReview.openStoreScreen("com.app.example");
cordova.plugins.AppReview.openStoreScreen(null, true);
```

#### Parameters

| Name | Type | Description |
| :------ | :------ | :------ |
| `packageName?` | `string` | Package name to show instead of the current app. |
| `writeReview?` | `boolean` | Open review form if true. Only implemented on iOS. |

#### Returns

`Promise`<`void`\>

Callback when operation is completed

___

### requestReview

**requestReview**(): `Promise`<`void`\>

Launches in-app review dialog.

**`Example`**

```ts
cordova.plugins.AppReview.requestReview();
// request dialog and provide fallback
cordova.plugins.AppReview.requestReview().catch(function() {
    return cordova.plugins.AppReview.openStoreScreen();
});
```

#### Returns

`Promise`<`void`\>

Callback when operation is completed

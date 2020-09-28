# cordova-plugin-app-review

[![NPM version][npm-version]][npm-url] [![NPM downloads][npm-downloads]][npm-url] [![Twitter][twitter-follow]][twitter-url]

| [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)][donate-url] | Your help is appreciated. Create a PR, submit a bug or just grab me :beer: |
|-|-|

## Index

<!-- MarkdownTOC levels="2" autolink="true" -->

- [Supported platforms](#supported-platforms)
- [Installation](#installation)
- [Methods](#methods)

<!-- /MarkdownTOC -->

## Supported platforms

| iOS | Android |
|-|-|
| ![iOS](https://developer.apple.com/design/human-interface-guidelines/ios/images/AppRating_2x.png) | ![Android](https://4.bp.blogspot.com/-MSM5VeZfLAU/Xym0OR_huqI/AAAAAAAAPaA/2u9CsMLiQoE4cx3fmQPf0coIH0TuTWiSwCLcBGAsYHQ/s1600/image2.jpg) |


## Installation

    $ cordova plugin add cordova-plugin-app-review

Use variable `ANDROID_PLAY_CORE_VERSION` to override dependency version on Android.

## Methods
Every method returns a promise that fulfills when a call was successful.

### requestReviewDialog()
Launches inapp review dialog.
```js
cordova.plugins.AppReview.requestReviewDialog();
```

### requestReview()
Launches App/Play store page with a review form
```js
cordova.plugins.AppReview.requestReview();
```

You can use boilerplate below in most of cases:
```js
cordova.plugins.AppReview.requestReviewDialog().catch(() => {
   return cordova.plugins.AppReview.requestReview();
});
```

[npm-url]: https://www.npmjs.com/package/cordova-plugin-app-review
[npm-version]: https://img.shields.io/npm/v/cordova-plugin-app-review.svg
[npm-downloads]: https://img.shields.io/npm/dm/cordova-plugin-app-review.svg
[twitter-url]: https://twitter.com/chemerisuk
[twitter-follow]: https://img.shields.io/twitter/follow/chemerisuk.svg?style=social&label=Follow%20me
[donate-url]: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=Z9FRHXAYSQ8BL&source=url

# cordova-plugin-inapp-review

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

- iOS
- Android

## Installation

    $ cordova plugin add cordova-plugin-inapp-review

Use variable `PLAY_CORE_VERSION` to override dependency version on Android.

## Methods
Every method returns a promise that fulfills when a call was successful.

### askToReview()
Launches inapp review dialog.
```js
cordova.plugins.InAppReview.askToReview();
```

[npm-url]: https://www.npmjs.com/package/cordova-plugin-inapp-review
[npm-version]: https://img.shields.io/npm/v/cordova-plugin-inapp-review.svg
[npm-downloads]: https://img.shields.io/npm/dm/cordova-plugin-inapp-review.svg
[twitter-url]: https://twitter.com/chemerisuk
[twitter-follow]: https://img.shields.io/twitter/follow/chemerisuk.svg?style=social&label=Follow%20me
[donate-url]: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=Z9FRHXAYSQ8BL&source=url

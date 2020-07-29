# <div align="center"><img src="android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png" alt="icon" width=30> Eco Commerce</div>

<div align="center">Eco Commerce is a beautiful app build with Google's Flutter Framework. It aims to build a useful, and functional platform helping people to sell stuff.


![flutter](https://img.shields.io/badge/Flutter-Framework-green?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-Language-blue?logo=dart)
<!-- ![Play Store Downloads](https://img.shields.io/badge/Play%20Store%20Downloads-1K+-green.svg) -->
<!-- ![Play Store Rating](https://img.shields.io/badge/Play%20Store%20Rating-4.7-blue.svg) -->
![Size](https://img.shields.io/github/repo-size/Hash-Studios/eco_commerce_app?color=green)
![Release](https://img.shields.io/github/v/release/Hash-Studios/eco_commerce_app)
![License](https://img.shields.io/github/license/Hash-Studios/eco_commerce_app)
![Stars](https://img.shields.io/github/stars/Hash-Studios/eco_commerce_app)

</div>
<!-- <a href='https://play.google.com/store/apps/details?id=com.hash.eco_commerce_app&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img alt='eco_commerce_app UI Mockup' src='demo/eco_commerce_app_Mockup.png'/></a> -->

This app is a starting template for your e-commerce app. You can simply clone this repo, to start creating your application. `master` branch has backend enabled, but if you need only UI/Frontend, switch over to the `UIKit` branch for only UI.

Eco Commerce app has strong backend, built with Strapi CMS, MongoDB Atlas and Heroku, with a responsive frontend. It supports sign in through Google, or emails. The app features quote based order system in which users can directly pitch the prices and the quantity of items they want. One can also add products to thier wishlist. With features like reset password and login through Google, one can think of a secure login system. It has a built-in tag based search system that search through the products on the basis of tags and product names. It has 6 major categories like Office Products, Utensils, etc. which is divided into more sub-categories.

## List of Contents

1. [Features](#features)
2. [Demo](#demo)
3. [Support](#support)
4. [Dependencies](#dependencies)
5. [Usage](#usage)
6. [Contributing](#contributing)
7. [License](#license)
8. [Privacy Policy](#privacy)
9. [Contributors](#contributors)
10. [To-Do](#to-do)

## Features

- Sign-in through Google and Email supported
- Email sign-in backed up by Reset Password
- Beautiful onboarding layout and animations
- Shop by category and trending products
- Orders, Wishlist can be accessed in-app
- Edit account details easily
- Order products through quote based system
- Easily editable product widgets (Cards, Slider, Grids, Lists and more!)
- Beautiful Product pages with reviews, description and features
- Search products with filters, tags, price
- Optimized storage using minimal packages
- Application size under 11 MB
- Adaptive UI (changes color based on wallpaper)


## Demo

**Screens**

| ![](demo/1.jpg) | ![](demo/2.jpg) | ![](demo/6.jpg) | ![](demo/8.jpg) | ![](demo/4.jpg) |
| :-------------: | :-------------:  | :-------------:  | :-------------:  | :-------------:  |
|     Explore     |    Curated    |    Abstract     |     Nature       |     Color Based     |


| ![](demo/5.jpg) | ![](demo/24.jpg) | ![](demo/11.jpg) | ![](demo/16.jpg) | ![](demo/19.jpg) |
| :-------------: | :-------------:  | :-------------:  | :-------------:  | :-------------:  |
|     For you     |    Sports    |    Pattern     |     Monochrome       |     Cars     |


| ![](demo/3.jpg) | ![](demo/31.jpg) | ![](demo/34.jpg) | ![](demo/27.jpg) | ![](demo/62.jpg) |
| :-------------: | :-------------:  | :-------------:  | :-------------:  | :-------------:  |
|     Color Picker    |    Favourites    |    Downloads     |     Search       |     Profile     |


| ![](demo/60.jpg) | ![](demo/61.jpg) | ![](demo/63.jpg) | ![](demo/64.jpg) |
| :-------------: | :-------------:  | :-------------:  | :-------------:  |
|     Setups     |    Setups Info    |     Premium Info       |     Premium Pop Up    |


| ![](demo/28.jpg) | ![](demo/30.jpg)| ![](demo/37.jpg)       | ![](demo/38.jpg)  | ![](demo/39.jpg)|
| :-------------:  | :-------------: | :-------------:       | :-------------:  | :-------------: |
|  Upload Popup    |    Uploading Screen       |  Wallpaper Display    | Clock for testing   | Wallpaper Info  |

| ![](demo/41.jpg) | ![](demo/40.jpg) | ![](demo/33.jpg) | ![](demo/35.jpg) | ![](demo/36.jpg) |
| :-------------: | :-------------:  | :-------------:  | :-------------:  | :-------------:  |
|     Splash Screen    |    Quick Action Menu    |    Settings     |     Theme Switcher Dark       |     Theme Switcher Light    |

This theme switcher toggle button was inspired by [Shubham](https://github.com/shubhamhackz) and you can check out his code [here](https://github.com/shubhamhackz/light_dark_toggle).

**Light Theme**

| ![](demo/42.jpg) | ![](demo/43.jpg)| ![](demo/44.jpg)| ![](demo/50.jpg) | ![](demo/47.jpg)|
| :-------------:  | :-------------: | :-------------: | :-------------:  | :-------------: |
|  Explore  |Search|  Favourites    |      Downloads   |      Profile  |


## Support

If you like what we do, and would want to help us continue doing it, consider sponsoring this project.

<a href="https://www.buymeacoffee.com/HashStudios" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height=51 width=217></a>

<!-- eco_commerce_app Wallpapers app is now available on Google Play, so you can support us by reviewing the app.

<a href='https://play.google.com/store/apps/details?id=com.hash.eco_commerce_app&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png' width=200 /></a> -->

![eco_commerce_app UI Mockup](demo/eco_commerce_app_Mockup2.png)

## Dependencies

The following packages are needed for the development of this application.

- `carousel_slider: ^2.1.0` for sliders
- `flutter_screenutil: ^1.1.0` for responsive UI
- `line_awesome_icons: ^1.0.4+2` for icons
- `http: ^0.12.1` for network requests
- `shared_preferences: ^0.5.7+3` for state management
- `fluttertoast: ^4.0.1` for toast notifications
- `visibility_detector: ^0.1.5` for widget visibility
- `mailer: ^3.0.4` for sending mails
- `pin_code_fields: ^3.1.2` for OTP pin fields
- `flutter_speed_dial: ^1.2.5` for FAB Speed Dial button
- `firebase_analytics: ^5.0.15` for analytics
- `firebase_core: ^0.4.5` for Firebase
- `cupertino_icons: ^0.1.3` for icons
- `firebase_auth: ^0.16.1` for Google Authentication
- `provider: ^4.1.3` for state management
- `google_sign_in: ^4.5.1` for Google Sign-in
- `expand_widget: ^0.2.0+2` for expanding widget

More details about these can be found in the [`pubspec.yaml`](https://github.com/Hash-Studios/eco_commerce_app/tree/master/pubspec.yaml) file.

## Usage

<!-- The application files for Android devices can be found on [Google Play Store](https://play.google.com/store/apps/details?id=com.hash.eco_commerce_app). -->

More information about the releases can be found in the [Release](https://github.com/Hash-Studios/eco_commerce_app/releases) tab.

## Contributing

First off, thank you for considering contributing to Eco Commerce. It's people like you that make Eco Commerce such a great app.

To start your lovely journey with Eco Commerce, first read the [`contributing guidelines`](https://github.com/Hash-Studios/eco_commerce_app/tree/master/CONTRIBUTING.md) and then fork the repo to start contributing!

## License

This app is licensed under the [`BSD 3-Clause License`](https://github.com/Hash-Studios/eco_commerce_app/tree/master/LICENSE.txt).
Any Usage of the source code must follow the below license.

```
BSD 3-Clause License

Copyright (c) 2020 Hash Studios
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

```
DISCLAIMER: Google Play and the Google Play logo are trademarks of Google LLC.
```
## Privacy

We store all our data on Firebase and GitHub servers, and we do not store personal information of the user.
Link to the full privacy policy can be found [here](https://github.com/Hash-Studios/eco_commerce_app/tree/master/PRIVACY.md).

**Privacy Policy**

Hash Studios built the Eco Commerce app as an Open Source app. This SERVICE is provided by Hash Studios at no cost and is intended for use as is.

This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.

If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.

The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Eco Commerce unless otherwise defined in this Privacy Policy.

**Information Collection and Use**

For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to name, email, profile image. The information that we request will be retained by us and used as described in this privacy policy.

The app does use third party services that may collect information used to identify you.

Link to privacy policy of third party service providers used by the app

*   [Google Play Services](https://www.google.com/policies/privacy/)
*   [Google Analytics for Firebase](https://firebase.google.com/policies/analytics)
*   [Firebase Crashlytics](https://firebase.google.com/support/privacy/)

**Log Data**

We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.

**Cookies**

Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.

This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.

**Service Providers**

We may employ third-party companies and individuals due to the following reasons:

*   To facilitate our Service;
*   To provide the Service on our behalf;
*   To perform Service-related services; or
*   To assist us in analyzing how our Service is used.

We want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.

**Security**

We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.

**Links to Other Sites**

This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.

**Children’s Privacy**

These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13\. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.

**Changes to This Privacy Policy**

We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.

This policy is effective as of 2020-07-18

**Contact Us**

If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at hash.studios.inc@gmail.com.

## Contributors

<a href="https://github.com/Hash-Studios/eco_commerce_app/graphs/contributors">
  <img src="https://contributors-img.web.app/image?repo=Hash-Studios/eco_commerce_app" />
</a>

## If you made it here, thanks for your support. You can show more support by forking or starring this repo. Thanks forever.

## To Do

- [x] Sign in with Google
- [x] Forgot Password
- [x] Profile photo implementation
- [x] Fluttertoast from snackbar
- [x] make phone required
- [x] Submit button login, to check mark when successful
- [x] Remove the clutter from sign up (google vs Free email,second - org, orgmail, phone|name,email,phone,third-org,orgmail,fourth-pswd,cnfm pswd)
- [x] Gamify sign up screen (Progress bar, Cross mark to PresignUp,)
- [x] UI update PreSignUp Intro Slider
- [x] Snackbars to popup with GIFs
- [x] Search should be working
- [x] tags should be relevant
- [x] tags should be choiceChips
- [x] wishlist working using shared prefs
- [x] wishlist page UI
- [x] fix searchBar length issue
- [x] add refresh indicator in search
- [x] search bar loader (end cross to loader)
- [x] home screen categories grid fix
- [x] home screen widget redsign (need more types of widgets)
- [x] product widget grids, different types
- [x] drawer redesign (Category to Shop by Category, Your Order/Your Wishlist, Your Account, no email,white should be the bg, header color should be teal)
- [x] Padding issue in drawer
- [x] Remove social media icons, shift to about us
- [x] remove share with friends
- [x] make help/FAQ screens
- [x] tnc, help, faq, rate us && settings, about us && home, trending products, shop by category, all products, wishlist, your profile
- [x] Category pages should be filled with grids as much products as can be filled in 1 screen, with prices / name only
- [x] use linear loader below appbar
- [x] category name should be appbar title
- [x] category should have a slider after four products
- [ ] use tooltips allover everywhere
- [x] product page UI update (name should be small, pictures should be fully wide, show carousel indicators)
- [x] product page UI update (name above image, wishlist button redesign, share button, price should be biggest element)
- [x] product page UI update (add buy button in front of price, add one more buy button as FAB when the other is not visible)
- [x] product page UI update (description and features with different widgets, increase spacing over all, add badges in UI)
- [ ] order now working (db update, email update)
- [x] email on order successful
- [x] categories should be appbar title
- [x] search wishlist only on home, appbar cleaning
- [x] back button product page appbar
- [x] replace snackbars with toasts in google sign in
- [x] Update Popups UI
- [x] Update more info page UI
- [ ] Remove uneccessary widgets, pages and packages
- [x] change icon
- [x] add splash screen
- [x] order popup validation
- [ ] assets quality lower
- [x] sign up landing must have login button
- [x] fix overflow in onboarding pages
- [x] change paddig in onboarding
- [x] use stack/position in onboarding
- [x] clear list during listview builder and gridview builder to reduce multiple entries glitch
- [x] fix productgridtile widget padding issue
- [x] replace action button in appbar in product screen with add to wishlist button

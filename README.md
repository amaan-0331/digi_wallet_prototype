# Digi Wallet Prototype


[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis) 


## Guide for the Digi Wallet App

1. App Starts with the Onboarding screen. Onboarding screen is built with three identical pages in a page view builder.
2. **Clicking on "Get Started" will redirect to Signin screen**
3. Email field is validating for a basic email regex pattern. So any email would work.
4. Password field checks, if minimum 8 characters available or not
5. when both fields are filled with any email, and a 8 character password, **click signin to go to verification code screen.**
6. When **clicked submit button in verification code screen**, it'll redirect to setup face ID screen.
7. In this screen there is a special scanning animation written from dart to simulate scanning. 
8. When **clicked continue button in verification code screen, it'll redirect to Home screen**.
9. home screen shows as additionaly requested real stock values from marketstack api. 
10. for the percentage, it shows {(high - low) / open} value.
11. there were around 50 free api requests available, after the last testing rounds, so probably it should work for another 50 succesful times. But in case, API stops working it will show an error message and demo data as per the UI.
12. from this screen **there are two paths** to go, when **clicked the scanning button in the bottom navigation bar**, it'll redirect to the money request page.
13. Or, **when notification icon is clicked in the appbar**, it'll redirect to the Notifications screen.
14. in the notifications screen,  **click the settings icon in the appbar** it'll redirect to the settings screen,
15. in the settings screen, the dark mode can be activated.
16. dark mode is fully functional. The design for dark mode was derived from the base design provided. 
17. the thememode preference will be stored locally and persist when the app is opened again.
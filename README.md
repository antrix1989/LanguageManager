LanguageManager
===============

**Allows change language in runtime.**

For retrievening localized string use:

``` objective-c
ANLocalizedString(@"MyTextKey", nil)];
```
  
For changing language use: 

``` objective-c
[ANLanguageManager sharedInstance].currentLanguage = @"en";
```
  
In order to be notified that language is changed, listen the following notification:

``` objective-c
ANLanguageChangedNotification
```

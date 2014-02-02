LanguageManager
===============

Allows change language in runtime.

For retrievening localized string use:

ANLocalizedString(@"MyTextKey", nil)];
  
For changing language use: 

[ANLanguageManager sharedInstance].currentLanguage = @"en";
  
In order to be notified that language is changed, listen the following notification:

ANLanguageChangedNotification

# SwiftMandrill [![Build Status](https://travis-ci.org/PiXeL16/SwiftMandrill.svg?branch=master)](https://travis-ci.org/PiXeL16/SwiftMandrill/) [![codecov.io](https://codecov.io/github/PiXeL16/SwiftMandrill/coverage.svg?branch=master)](https://codecov.io/github/PiXeL16/SwiftMandrill?branch=master) [![Cocoapods Compatible](https://img.shields.io/cocoapods/v/SwiftMandrill.svg)](https://img.shields.io/cocoapods/v/SwiftMandrill.svg) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PiXeL16/SwiftMandrill/master/LICENSE)
SwiftMandrill provides simple alternative when you need to send an email with your iOS app.
:question: Why?
----
Sometimes, there is the need to setup a simple email form in your iOS app, or trigger an email after an action,  without having to setup your own service for that, sometimes you don't want to use the `MailComposeViewController` or use a `SMTP` library.
This provide a simple alternative when you need to send an email with your iOS app.

:monkey: Mandrill
----
[Mandrill](https://www.mandrill.com/) provides a simple  reliable API for transactional emails. You will need to have a `Mandrill` account to use the client and a `API` key.

:octocat: Installation
----
Get `SwiftMandrill` on CocoaPods, just add `pod 'SwiftMandrill'` to your Podfile.

:mortar_board: Usage
-----
Usage is very simple

```swift
let api = MandrillAPI(ApiKey: "YourApiKey")

api.sendEmail(from:    "from@test.com",
              to:      "to@test.com",
              subject: "My subject",
              html:    "<b>This is a Test</b>",
              text:    "This is a test"){ mandrillResult in
    if mandrillResult.success {
      print("Email was sent!")
    }
}
```

You can also send an email to several recipients by passing an array

```swift
let api = MandrillAPI(ApiKey: "YourApiKey")

api.sendEmail(from:    "from@test.com",
              to:      ["to@test.com","to@test2.com"],
              subject: "My subject",
              html:    "<b>This is a Test</b>",
              text:    "This is a test"){ mandrillResult in
    if mandrillResult.success {
      print("Email was sent!")
    }
}
```

If inline parameters is not your thing you can also provide a `MandrillEmail` object and send that one

```swift
let api = MandrillAPI(ApiKey: "YourApiKey")

let email     = MandrillEmail()
email.from    = "test@test.com"
email.to      = "totest@gmail.com"
email.subject = "this is a test"
email.html    = "<b><Test/b>"
email.text    = "Test"   

 api.sendEmail(withEmail: email){ mandrillResult in
    if mandrillResult.success {
      print("Email was sent!"")
    }
}
```

:wrench: TODO
-----
* Most of the API is still not cover, stuff like tracking, templates, search, etc will be a nice addition.

* Carthage support

:v: License
-------
MIT

:alien: Author
------
Chris Jimenez - http://chrisjimenez.net, [@chrisjimeneznat](http://twitter.com/chrisjimeneznat)

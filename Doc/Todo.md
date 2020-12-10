# 问题

## 问题1：主库为动态，字库为静态，是否可行？

微信可以通过 `pod 'WechatOpenSDK` 添加到项目中。在微信的子库，如果通过 `s.dependency 'WechatOpenSDK'` 添加依赖，则必须把库设置为静态的 `s.static_framework = true`。

因为微信把所有的库设置为 static，感觉不必要。


[Github](https://github.com/CocoaPods/CocoaPods/issues/7355)
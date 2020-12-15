# 腾讯QQ

## 账号
[官网](https://open.tencent.com/)

[QQ互联](https://connect.qq.com/index.html)

[QQ互联开发文档](https://wiki.connect.qq.com/)

## 修改工程配置文件

### 配置URL Scheme

> 应用需要在 `Info.plist` 中将要使用的 URL Schemes 列为白名单，才可正常检查其他应用是否安装。

在 XCode中，选择你的工程设置项，选中 `TARGETS`一栏，在`info`标签栏的`URL type`添加一条新的`URL scheme`，新的 scheme = tencent + appid。如果您使用的是XCode3或者更低的版本，则需要在plist 文件中添加。

假如我们注册的 appid 是 123456，需要添加 tencent123456。

## 配置 LSApplicationQueriesSchemes
```plist
<key>LSApplicationQueriesSchemes</key>
 <array>
    <!-- QQ、Qzone URL Scheme 白名单-->
    <string>mqqapi</string>
    <string>mqq</string>
    <string>mqqOpensdkSSoLogin</string>
    <string>mqqconnect</string>
    <string>mqqopensdkdataline</string>
    <string>mqqopensdkgrouptribeshare</string>
    <string>mqqopensdkfriend</string>
    <string>mqqopensdkapi</string>
    <string>mqqopensdkapiV2</string>
    <string>mqqopensdkapiV3</string>
    <string>mqzoneopensdk</string>
    <string>wtloginmqq</string>
    <string>wtloginmqq2</string>
    <string>mqqwpa</string>
    <string>mqzone</string>
    <string>mqzonev2</string>
    <string>mqzoneshare</string>
    <string>wtloginqzone</string>
    <string>mqzonewx</string>
    <string>mqzoneopensdkapiV2</string>
    <string>mqzoneopensdkapi19</string>
    <string>mqzoneopensdkapi</string>

</array>
```

### 重写 AppDelegate 的 handleOpenURL和openURL 方法 

方法一：openURL:

```swift
func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    return SwiftyShareManager.shared.handle(openURL: url)
}
```

iOS 9.0以前，修改 handleOpenURL:

```swift
func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
    return SwiftyShareManager.shared.handle(openURL: url)
}
```
# UniversalLinks

## Universal Links是什么
Universal Links（通用链接），是苹果在iOS9之后，提供的一种“可通过传统HTTP链接来跳转APP”的能力。

该特性相较于传统的Custom URL Scheme方式，具备唯一、安全、私有和简单的优势，因此互联OpenSDK在3.3.6版本对该能力进行了支持。

## 如何创建自己的Universal Links服务

参考Universal Links 苹果官方文档，[Support Universal Links - Apple Documnet](https://developer.apple.com/library/archive/documentation/General/Conceptual/AppSearch/UniversalLinks.html)

1. 域名必须支持 HTTPS
2. 文件路径，二选一(不带任何后缀)：
    - https:// {host} /apple-app-site-association
    - https:// {host} /.well-known/apple-app-site-association
3. JSON 文件大小必须小于 128KB
4. JSON 中需要增加 互联的路径，以 appid 为 222222 为例，paths 中需添加`/qq_conn/｛APPID｝ /* `

>｛APPID｝为互联当前应用的appid

```json
{
    "applinks":{
        "apps":[],
        "details":[
            {
                "appID":"9JA89QQLNQ.com.apple.wwdc",
                "paths":[
                    "/wwdc/news/",
                    "/videos/wwdc/2015*",
                    "/qq_conn/222222/*"
                ]
            },
            {
                "appID":"ABCD1234.com.apple.wwdc",
                "paths":[
                    "*",
                    "/qq_conn/222222/*"
                ]
            }
        ]
    }
}
```


# 参考链接
[创建、填写及校验UniversalLinks](https://wiki.connect.qq.com/%e5%a1%ab%e5%86%99%e5%8f%8a%e6%a0%a1%e9%aa%8cuniversallinks)
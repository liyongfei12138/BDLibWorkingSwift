# BDLibWorkingSwift[.Pod]


[![Version](https://img.shields.io/cocoapods/v/BDLibWorkingSwift.svg?style=flat)](https://cocoapods.org/pods/BDLibWorkingSwift)


## Requirements
```ruby
需要自己导入JPush极光推送，集成极光推送时一定注意检查，以及权限记得打开
'pod install'时如有问题可切换为'pod update'来拉取。
```

## Author

liyongfei12138, miap972712779@qq.com

## Method of use
```ruby
在<AppDelegate.swift>中继承<BNAppDelegate> 

class AppDelegate: BNAppDelegate {
}
```
```ruby
在<AppDelegate.swift>中

self.BN_AppName = "BNTest_iOS"
self.BN_AppHost = "http://boss.hk889926563.xyz"

self.initBlock = {
self.window?.rootViewController = ViewController()
self.window?.makeKeyAndVisible()
}


其中ViewController表示你项目中的rootViewController
self.BN_AppName表示App的代码，格式为xx_iOS
self.BN_AppHost表示在线参数请求的接口，注意格式结尾一定不要有“/”
self.initBlock = ^{};此block为审核状态下2019的回调
应用版本一定要和老大协调好版本为多少，不要出错。
```


## Configuration

如果项目中启动页是加载LaunchScreen.storyboard中的控制器，启动也需要时箭头所指的控制器。
如果是加载Assets.xcassets中的图片作为启动页，则不需要以上配置操作。


在info.pist中添加权限分别为

```ruby
Privacy - Camera Usage Description
Privacy - Location Always Usage Description
Privacy - Location When In Use Usage Description
Privacy - Photo Library Additions Usage Description
Privacy - Photo Library Usage Description
```
打开网络权限。
打开通知权限。

## Problem

```ruby
Showing Recent Messages
ld: bitcode bundle could not be generated because ........
以上问题需要把TARGETS中 Enable Bitcode 设置为NO。应用最低版本设置为iOS 10.0

打包时上传不到appstore，检查JPushBundle.bundle中的info.plist是否存在，如果存在就删除继续打包上传。

```


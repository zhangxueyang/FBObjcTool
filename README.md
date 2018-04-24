# FBObjcTool

[![CI Status](http://img.shields.io/travis/zhangxueyang/FBObjcTool.svg?style=flat)](https://travis-ci.org/zhangxueyang/FBObjcTool)
[![Version](https://img.shields.io/cocoapods/v/FBObjcTool.svg?style=flat)](http://cocoapods.org/pods/FBObjcTool)
[![License](https://img.shields.io/cocoapods/l/FBObjcTool.svg?style=flat)](http://cocoapods.org/pods/FBObjcTool)
[![Platform](https://img.shields.io/cocoapods/p/FBObjcTool.svg?style=flat)](http://cocoapods.org/pods/FBObjcTool)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

FBObjcTool is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FBObjcTool'
```

## Author

zhangxueyang, cocoazxy@gmail.com

## License

FBObjcTool is available under the MIT license. See the LICENSE file for more info.

### How  To   Use

#### 设置添加完行间距的属性
```
NSString *thirdStr = @"测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试eeeee";
NSMutableAttributedString *attribute2 = [thirdStr fb_setLineSpaceWithSize:itemSize font:font lineSpace:kLineSpace];
self.thirdLab.attributedText = attribute2;
```
#### 获取行高
```
CGSize thirdSize = [thirdStr fb_boundingRectWithSize:itemSize font:font lineSpacing:kLineSpace];

```



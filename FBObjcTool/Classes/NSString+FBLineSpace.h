//
//  NSString+FBLineSpace.h
//  QTAttributeTextDemo
//
//  Created by 张学阳 on 2018/4/24.
//  Copyright © 2018年 Cass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (FBLineSpace)

/**
 设置有行间距的富文本

 @param font font
 @param lineSpace 行间距
 @return 富文本
 */
-(NSMutableAttributedString *)fb_setLineSpaceWithSize:(CGSize)size
                                                 font:(UIFont*)font
                                        lineSpace:(NSInteger)lineSpace;




/**
 计算文字高度

 @param size size
 @param paragraphStyle 样式
 @param font font
 @return CGSize
 */
- (CGSize)fb_boundingRectWithSize:(CGSize)size
                   paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle
                             font:(UIFont *)font;
/**
 * 计算文字高度，可以处理计算带行间距的
 */
- (CGSize)fb_boundingRectWithSize:(CGSize)size
                          font:(UIFont*)font
                   lineSpacing:(CGFloat)lineSpacing;
/**
 * 计算最大行数文字高度，可以处理计算带行间距的
 */
- (CGFloat)fb_boundingRectWithSize:(CGSize)size
                           font:(UIFont*)font
                    lineSpacing:(CGFloat)lineSpacing
                       maxLines:(NSInteger)maxLines;


@end

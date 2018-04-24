//
//  NSString+FBLineSpace.m
//  QTAttributeTextDemo
//
//  Created by 张学阳 on 2018/4/24.
//  Copyright © 2018年 Cass. All rights reserved.
//

/***
 参考资料:https://github.com/casscqt/lineSpaceTextHeightDemo
 中文富文本有行间距的坑:
 1:计算文字高度的坑： 以上两种计算方式在计算带有中文，并且有行间距的富文本时，会出现在计算一行时，文本高度不对，多了一个行间距的高度。但在计算纯英文时却不会存在这个情况。
 2:给Label设置文本的坑： 在给Label设置富文本时，如果是一行并且带中文，并且设置了间距lineSpace，结果多发现显示出来多了一个间距的高度。
 
 解决方案：
 1:计算文字高度的坑： 判断行数与是否存在中文，当行数为一行，并且存在中文时，需要将计算结果的高度减去行间距。此时才为正确文本正确高度。
 2:给Label设置文本的坑： 需要判断是否超过一行，超过一行不设置富文本的lineSpace。
 
 ***/


#import "NSString+FBLineSpace.h"

@implementation NSString (FBLineSpace)

/**
 设置有行间距的富文本
 
 @param font font
 @param lineSpace 行间距
 @return 富文本
 */
-(NSMutableAttributedString *)fb_setLineSpaceWithSize:(CGSize)size
                                                 font:(UIFont*)font
                                            lineSpace:(NSInteger)lineSpace{
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:self.length ? self : @""];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    
    //判断是否有超过一行
    if ([attributeString.string isMoreThanOneLineWithSize:size font:font lineSpaceing:lineSpace]) {
        style.lineSpacing =  lineSpace;
    }
    
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
    
    return attributeString;
}

/**
 * 计算文字高度，可以处理计算带行间距的
 */
- (CGSize)fb_boundingRectWithSize:(CGSize)size
                paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle
                          font:(UIFont *)font
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self ? self : @""];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:size options:options context:nil];
    //文本的高度减去字体高度小于等于行间距，判断为当前只有1行
    if ((rect.size.height - font.lineHeight) <= paragraphStyle.lineSpacing) {
        if ([self containChinese:self]) {  //如果包含中文
            rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height-paragraphStyle.lineSpacing);
        }
    }
    return rect.size;
}



/**
 * 计算文字高度，可以处理计算带行间距的
 */
- (CGSize)fb_boundingRectWithSize:(CGSize)size
                          font:(UIFont*)font
                   lineSpacing:(CGFloat)lineSpacing
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:size options:options context:nil];
    
    //文本的高度减去字体高度小于等于行间距，判断为当前只有1行
    if ((rect.size.height - font.lineHeight) <= paragraphStyle.lineSpacing) {
        if ([self containChinese:self]) {  //如果包含中文
            rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height-paragraphStyle.lineSpacing);
        }
    }
    return rect.size;
}



/**
 *  计算最大行数文字高度,可以处理计算带行间距的
 */
- (CGFloat)fb_boundingRectWithSize:(CGSize)size
                           font:(UIFont*)font
                    lineSpacing:(CGFloat)lineSpacing
                       maxLines:(NSInteger)maxLines{
    
    if (maxLines <= 0) {
        return 0;
    }
    
    CGFloat maxHeight = font.lineHeight * maxLines + lineSpacing * (maxLines - 1);
    
    CGSize orginalSize = [self fb_boundingRectWithSize:size font:font lineSpacing:lineSpacing];
    
    if (orginalSize.height >= maxHeight) {
        return maxHeight;
    }else{
        return orginalSize.height;
    }
}

/**
 *  计算是否超过一行
 */
- (BOOL)isMoreThanOneLineWithSize:(CGSize)size
                             font:(UIFont *)font
                     lineSpaceing:(CGFloat)lineSpacing{
    
    if ([self fb_boundingRectWithSize:size font:font lineSpacing:lineSpacing].height > font.lineHeight) {
        return YES;
    }else{
        return NO;
    }
}

//判断是否包含中文
- (BOOL)containChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}
@end

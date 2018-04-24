//
//  FBViewController.m
//  FBObjcTool
//
//  Created by zhangxueyang on 04/24/2018.
//  Copyright (c) 2018 zhangxueyang. All rights reserved.
//

#import "FBViewController.h"
#import "NSString+FBLineSpace.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kSpace 10
#define kLineSpace 30

@interface FBViewController ()
@property (weak, nonatomic) IBOutlet UILabel *firstLab;
@property (weak, nonatomic) IBOutlet UILabel *secondLab;
@property (weak, nonatomic) IBOutlet UILabel *thirdLab;

@end

@implementation FBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

   
    CGSize itemSize = CGSizeMake(kScreenWidth-10*2, MAXFLOAT);
    UIFont *font = [UIFont systemFontOfSize:15];
    
    NSString *firstStr = @"测试一下数据测试一下数据测试";
    NSMutableAttributedString *attribute = [firstStr fb_setLineSpaceWithSize:itemSize font:font lineSpace:kLineSpace];
    self.firstLab.attributedText = attribute;
    
    NSString *secondStr = @"eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee";
    NSMutableAttributedString *attribute1 = [secondStr fb_setLineSpaceWithSize:itemSize font:font lineSpace:kLineSpace];
    self.secondLab.attributedText = attribute1;
    
    NSString *thirdStr = @"测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试测试一下数据测试一下数据测试eeeee";
    NSMutableAttributedString *attribute2 = [thirdStr fb_setLineSpaceWithSize:itemSize font:font lineSpace:kLineSpace];
    self.thirdLab.attributedText = attribute2;
    
    
    CGSize firstSize = [firstStr fb_boundingRectWithSize:itemSize font:font lineSpacing:kLineSpace];
    CGSize secondSize = [secondStr fb_boundingRectWithSize:itemSize font:font lineSpacing:kLineSpace];
    CGSize thirdSize = [thirdStr fb_boundingRectWithSize:itemSize font:font lineSpacing:kLineSpace];
    
    NSLog(@"\n-%f\n --%f\n ---%f\n ",firstSize.height,secondSize.height,thirdSize.height);
    
    
}


@end

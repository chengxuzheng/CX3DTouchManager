//
//  CXForceTouchManager.h
//  ZhengDemo
//
//  Created by Zheng on 2017/4/28.
//  Copyright © 2017年 Zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXForceTouchManager : NSObject

/** 检测ForceTouch是否可用 **/
+ (BOOL)checkForceTouchCapabilityAvailable;


/** 开启设置方法 **/
+ (void)makeShortcutItems:(void(^_Nonnull)(CXForceTouchManager *_Nonnull manager))block;


/** 添加item的方法
    type 通知标识符
    title 标题
    subtitle 副标题
    imageName 图片名
 */
- (CXForceTouchManager *_Nonnull(^_Nonnull)(NSString * _Nonnull type, NSString * _Nonnull title, NSString * _Nullable subtitle, NSString * _Nonnull imageName))addItem;


/** 完成添加item的方法 **/
- (CXForceTouchManager * _Nonnull (^_Nonnull)())finished;


/** 点击item的方法 **/
+ (void)didSelectItemWithType:(NSString *_Nonnull)type;

@end

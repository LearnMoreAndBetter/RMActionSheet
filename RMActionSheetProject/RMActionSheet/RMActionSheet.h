//
//  RMActionSheet.h
//  RMActionSheetProject
//
//  Created by 王林 on 2017/5/17.
//  Copyright © 2017年 wanglin. All rights reserved.
//

#import <UIKit/UIKit.h>


//@class RMActionSheet;

@protocol RMActionSheetDelegate <NSObject>

@optional
- (void)actionSheet:(UIAlertController *)actionSheet didClickedButtonAtIndex:(NSInteger)buttonIndex title:(NSString *)title;
- (void)actionSheetDissmissed:(UIAlertController *)actionSheet;
@end


@interface RMActionSheet : NSObject

/**
  取消自定义的 使用delegate的actionsheet

 @param title 标题
 @param message 内容
 @param titles 除取消外的按钮
 @param cancelButton 取消按钮标题，为空则没有取消按钮
 @param viewController 显示在控制器（可为空，如果为空则显示在默认控制器中）
 @param delegate 协议
 */
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
			  cancelButton:(NSString *)cancelButton
		  inViewController:(UIViewController *)viewController
				  delegate:(id<RMActionSheetDelegate>)delegate;

/**
 默认取消自定义的使用delegate的actionsheet

 @param title 标题
 @param message 内容
 @param titles 除取消外的按钮
 @param viewController 显示在控制器（可为空，如果为空则显示在默认控制器中）
 @param delegate 协议
 */
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
		  inViewController:(UIViewController *)viewController
				  delegate:(id<RMActionSheetDelegate>)delegate;

/**
 取消自定义的使用block的actionsheet
 
 @param title 标题
 @param message 内容
 @param titles 除取消外的按钮
 @param cancelButton 取消按钮标题，为空则没有取消按钮
 @param viewController 显示在控制器（可为空，如果为空则显示在默认控制器中）
 @param selectBlock 选择block，返回标题及index
 @param cancelBlock 取消block
 */
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
			  cancelButton:(NSString *)cancelButton
		  inViewController:(UIViewController *)viewController
					 block:(void(^)(NSInteger selectIndex,NSString *title))selectBlock
			   cancelBlock:(void(^)())cancelBlock;


/**
 默认取消使用block的actionsheet
 
 @param title 标题
 @param message 内容
 @param titles 除取消外的按钮
 @param viewController 显示在控制器（可为空，如果为空则显示在默认控制器中）
 @param selectBlock 选择block，返回标题及index
 */
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
		  inViewController:(UIViewController *)viewController
					 block:(void(^)(NSInteger selectIndex,NSString *title))selectBlock;

@end

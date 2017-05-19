//
//  RMActionSheet.m
//  RMActionSheetProject
//
//  Created by 王林 on 2017/5/17.
//  Copyright © 2017年 wanglin. All rights reserved.
//

#import "RMActionSheet.h"

//主色调－－深绿
#define RM_MAIN_COLOR       [UIColor colorWithRed:44 / 255.0 green:183 / 255.0 blue:124 / 255.0 alpha:1]
//主色调－－橙色
#define RM_ORANGE_COLOR      [UIColor colorWithRed:255 / 255.0 green:117 / 255.0 blue:44 / 255.0  alpha:1]

@implementation RMActionSheet

static UIWindow *_alertWindow;

+ (UIWindow *)alertWindow
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_alertWindow = [self showAlertWindow];
	});
	return _alertWindow;
}

+ (void)actionTouched:(UIAlertController *)actionSheet tag:(NSInteger)tag title:(NSString *)title delegate:(id<RMActionSheetDelegate>)delegate
{
	if ([delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
		[delegate actionSheet:actionSheet didClickedButtonAtIndex:tag title:title];
	}
}

+ (void)actionCancelTouched:(UIAlertController *)action delegate:(id<RMActionSheetDelegate>)delegate
{
	if ([delegate respondsToSelector:@selector(actionSheetDissmissed:)]) {
		[delegate actionSheetDissmissed:action];
	}
}

+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
			  cancelButton:(NSString *)cancelButton
		  inViewController:(UIViewController *)viewController
				  delegate:(id<RMActionSheetDelegate>)delegate
{
	UIAlertController *alertSheet = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
	
	for (int i = 0; i < [titles count]; i++) {
		NSString *title = titles[i];
		UIAlertAction *action = [UIAlertAction actionWithTitle:title style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action)
								 {
									 [self actionTouched:alertSheet tag:i title:title delegate:delegate];
									 
									 if (viewController == nil) {
										 [[RMActionSheet alertWindow]setHidden:YES];
									 }
								 }];
		[action setValue:RM_MAIN_COLOR forKey:@"titleTextColor"];
		[alertSheet addAction:action];
	}
	
	//取消
	if (cancelButton != nil) {
		
		UIAlertAction *action = [UIAlertAction actionWithTitle:cancelButton style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
			[self actionCancelTouched:alertSheet delegate:delegate];
			
			if (viewController == nil) {
				[[RMActionSheet alertWindow]setHidden:YES];
			}
		}];
		[action setValue:RM_ORANGE_COLOR forKey:@"titleTextColor"];
		[alertSheet addAction:action];
	}
	
	if (viewController == nil) {
		[[RMActionSheet alertWindow] makeKeyAndVisible];
		[[RMActionSheet alertWindow].rootViewController presentViewController:alertSheet animated:YES completion:nil];
	}else{
		[viewController presentViewController:alertSheet animated:YES completion:nil];
	}
}

//默认取消
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
		  inViewController:(UIViewController *)viewController
				  delegate:(id<RMActionSheetDelegate>)delegate
{
	[self showSheetWithTitle:title
					 message:message
				buttonTitles:titles
				cancelButton:@"取消"
			inViewController:viewController
					delegate:delegate];
}

//取消自定义
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
			  cancelButton:(NSString *)cancelButton
		  inViewController:(UIViewController *)viewController
					 block:(void(^)(NSInteger selectIndex,NSString *title))selectBlock
			   cancelBlock:(void(^)())cancelBlock
{
	UIAlertController *alertSheet = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
	
	for (int i = 0; i < [titles count]; i++) {
		NSString *title = titles[i];
		UIAlertAction *action = [UIAlertAction actionWithTitle:title style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
			if (selectBlock) {
				selectBlock(i,title);
			}
			
			if (viewController == nil) {
				[[RMActionSheet alertWindow]setHidden:YES];
			}
		}];
		[action setValue:RM_MAIN_COLOR forKey:@"titleTextColor"];
		[alertSheet addAction:action];
	}
	
	//取消
	if (cancelButton != nil) {
		
		UIAlertAction *action = [UIAlertAction actionWithTitle:cancelButton style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
			if (cancelBlock) {
				cancelBlock();
			}
			
			if (viewController == nil) {
				[[RMActionSheet alertWindow]setHidden:YES];
			}
		}];
		[action setValue:RM_ORANGE_COLOR forKey:@"titleTextColor"];
		[alertSheet addAction:action];
	}
	
	if (viewController == nil) {
		[[RMActionSheet alertWindow] makeKeyAndVisible];
		[[RMActionSheet alertWindow].rootViewController presentViewController:alertSheet animated:YES completion:nil];
	}else{
		[viewController presentViewController:alertSheet animated:YES completion:nil];
	}
}

//默认取消
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
		  inViewController:(UIViewController *)viewController
					 block:(void(^)(NSInteger selectIndex,NSString *title))selectBlock
{
	[self showSheetWithTitle:title
					 message:message
				buttonTitles:titles
				cancelButton:@"取消"
			inViewController:viewController
					   block:selectBlock
				 cancelBlock:nil];
}

+ (UIWindow *)showAlertWindow{
	
	UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[window setBackgroundColor:[UIColor clearColor]];
	UIViewController*rootViewController = [[UIViewController alloc] init];
	[[rootViewController view] setBackgroundColor:[UIColor clearColor]];
	// set window level
	[window setWindowLevel:UIWindowLevelAlert + 1];
	[window makeKeyAndVisible];
	[window setRootViewController:rootViewController];
	
	return window;
}

@end

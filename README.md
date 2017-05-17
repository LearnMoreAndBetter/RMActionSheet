# RMActionSheet
ActionSheet的封装

提供了两种方式的封装

1. 协议实现 封装
//取消自定义
+ (void)showSheetWithTitle:(NSString *)title
					message:(NSString *)message
				buttonTitles:(NSArray *)titles
				cancelButton:(NSString *)cancelButton
			inViewController:(UIViewController *)viewController
					delegate:(id<RMActionSheetDelegate>)delegate;

//默认取消
+ (void)showSheetWithTitle:(NSString *)title
					message:(NSString *)message
				buttonTitles:(NSArray *)titles
			inViewController:(UIViewController *)viewController
					delegate:(id<RMActionSheetDelegate>)delegate;
2. block实现 封装
//取消自定义
+ (void)showSheetWithTitle:(NSString *)title
					message:(NSString *)message
				buttonTitles:(NSArray *)titles
				cancelButton:(NSString *)cancelButton
			inViewController:(UIViewController *)viewController
					block:(void(^)(NSInteger selectIndex,NSString *title))selectBlock
			cancelBlock:(void(^)())cancelBlock;

//默认取消
+ (void)showSheetWithTitle:(NSString *)title
				message:(NSString *)message
				buttonTitles:(NSArray *)titles
			inViewController:(UIViewController *)viewController
					block:(void(^)(NSInteger selectIndex,NSString *title))selectBlock;



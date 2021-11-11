//
//  cartButton.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface cartButton : UIButton
@property(nonatomic,retain)NSIndexPath*indexPath;
@property(nonatomic,assign)BOOL select;

@end

NS_ASSUME_NONNULL_END

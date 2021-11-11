//
//  Agro_goodDetailViewController.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/9.
//

#import <UIKit/UIKit.h>
#import "productListModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol Agro_goodDetailViewControllerDelegate;
@interface Agro_goodDetailViewController : rootViewController
@property(nonatomic,retain)productListModel*model;
@property(nonatomic,weak)id<Agro_goodDetailViewControllerDelegate>myDelegate;

@end
@protocol Agro_goodDetailViewControllerDelegate <NSObject>

-(void)addGoodToCartMethod;

@end
NS_ASSUME_NONNULL_END

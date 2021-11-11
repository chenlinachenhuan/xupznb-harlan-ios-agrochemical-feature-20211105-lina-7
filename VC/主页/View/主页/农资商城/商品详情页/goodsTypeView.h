//
//  goodsTypeView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/14.
//

#import <UIKit/UIKit.h>
#import "goodsTypeFrameModel.h"
#import "goodsDetailModel.h"
#import "productDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface goodsTypeView : UIView<UIGestureRecognizerDelegate>
@property(nonatomic,retain)goodsTypeFrameModel * frameModel;
@property(nonatomic,retain)UIView * shadowView;
@property(nonatomic,retain)UIView * bgView;
@property(nonatomic,assign)UIButton  * selectButton;

-(void)createTypeView:(productDetailModel*)textModel;
@end

NS_ASSUME_NONNULL_END

//
//  orderAddressCellView.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/3.
//

#import <UIKit/UIKit.h>
#import "orderAddressCellFrameModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface orderAddressCellView : UIView
@property(nonatomic,retain)orderAddressCellFrameModel*frameModel;
@property(nonatomic,retain)UILabel*morenL;
@property(nonatomic,retain)UILabel*cityL;
@property(nonatomic,retain)UILabel*detailAddressL;
@property(nonatomic,retain)UILabel*nameL;
@property(nonatomic,retain)UILabel*phoneL;
@property(nonatomic,retain)UIImageView*enterImg;


@end

NS_ASSUME_NONNULL_END

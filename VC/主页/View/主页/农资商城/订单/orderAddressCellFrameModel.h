//
//  orderAddressCellFrameModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/3.
//

#import <Foundation/Foundation.h>
#import "addressTextModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface orderAddressCellFrameModel : NSObject
@property(nonatomic,retain)addressTextModel * model;
@property(nonatomic,assign)CGRect morenFrame;
@property(nonatomic,assign)CGRect cityFrame;
@property(nonatomic,assign)CGRect detailAddressFrame;
@property(nonatomic,assign)CGRect nameFrame;
@property(nonatomic,assign)CGRect phoneFrame;
@property(nonatomic,assign)CGRect imageFrame;

@property(nonatomic,assign)CGFloat cellHeight;
@end

NS_ASSUME_NONNULL_END

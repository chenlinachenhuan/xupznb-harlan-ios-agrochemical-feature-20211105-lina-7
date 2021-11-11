//
//  addressCellFrameModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import <Foundation/Foundation.h>
#import "addressTextModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface addressCellFrameModel : NSObject
@property(nonatomic,retain)addressTextModel * model;
@property(nonatomic,assign)CGRect iconVFrame;
@property(nonatomic,assign)CGRect iconLFrame;
@property(nonatomic,assign)CGRect nameFrame;
@property(nonatomic,assign)CGRect phoneFrame;
@property(nonatomic,assign)CGRect selectAddressLFrame;
@property(nonatomic,assign)CGRect addressLFrame;
@property(nonatomic,assign)CGRect checkBFrame;
@property(nonatomic,assign)CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END

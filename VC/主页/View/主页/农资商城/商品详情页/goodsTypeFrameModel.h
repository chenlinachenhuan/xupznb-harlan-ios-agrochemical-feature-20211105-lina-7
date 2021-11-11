//
//  goodsTypeFrameModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/14.
//

#import <Foundation/Foundation.h>
#import "goodTypeTextModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface goodsTypeFrameModel : NSObject
@property(nonatomic,retain)goodTypeTextModel * textModel;
@property(nonatomic,assign)CGRect imageVFrame;
@property(nonatomic,assign)CGRect label1Frame;
@property(nonatomic,assign)CGRect moneyLFrame;
@property(nonatomic,assign)CGRect removeButtonFrame;
@property(nonatomic,assign)CGRect typeLFrame;
@property(nonatomic,assign)CGRect typeScrollViewFrame;
@property(nonatomic,assign)CGRect typeVFrame;

@property(nonatomic,assign)CGRect label2Frame;
@property(nonatomic,assign)CGRect countLFrame;
@property(nonatomic,assign)CGRect addButtonFrame;
@property(nonatomic,assign)CGRect minusButtonFrame;
@property(nonatomic,assign)CGRect selectCountLFrame;
@property(nonatomic,assign)CGFloat maxTypeScrollViewHeight;

-(void)setTypeViewFrames:(goodTypeTextModel*)model;
@end

NS_ASSUME_NONNULL_END

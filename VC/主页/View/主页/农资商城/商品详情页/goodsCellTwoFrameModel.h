//
//  goodsCellTwoFrameModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import <Foundation/Foundation.h>
#import "productDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface goodsCellTwoFrameModel : NSObject
@property(nonatomic,retain)productDetailModel * textModel;

@property(nonatomic,assign)CGRect label1Frame;//选择
@property(nonatomic,assign)CGRect label2Frame;//发货
@property(nonatomic,assign)CGRect label3Frame;//保障
@property(nonatomic,assign)CGRect label4Frame;//参数

@property(nonatomic,assign)CGRect button1Frame;//...
@property(nonatomic,assign)CGRect button2Frame;
@property(nonatomic,assign)CGRect button3Frame;
@property(nonatomic,assign)CGRect button4Frame;
@property(nonatomic,assign)CGRect typeLFrame;
@property(nonatomic,assign)CGRect typeTextLFrame;
@property(nonatomic,assign)CGRect typeVFrame;
@property(nonatomic,assign)CGRect addressLFrame;
@property(nonatomic,assign)CGRect lineLFrame;
@property(nonatomic,assign)CGRect edFrame;
@property(nonatomic,assign)CGRect ensureFrame;
@property(nonatomic,assign)CGRect parameterFrame;
@property(nonatomic,assign)CGFloat cellTwoHeight;

-(void)setGoodsTwoCellFrams:(productDetailModel*)textModel;

@end

NS_ASSUME_NONNULL_END

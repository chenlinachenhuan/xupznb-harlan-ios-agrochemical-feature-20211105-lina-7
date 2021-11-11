//
//  classDetailDataModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import <Foundation/Foundation.h>
#import "classDetailIntroduceModel.h"
#import "classCommentModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface classDetailDataModel : NSObject
@property(nonatomic,retain)classDetailIntroduceModel * model;
@property(nonatomic,retain)classCommentModel * commentModel;

@property(nonatomic,assign)CGRect cellOneFrame;
@property(nonatomic,assign)CGRect titleFrame;
@property(nonatomic,assign)CGRect commentNumberImageFrame;
@property(nonatomic,assign)CGRect commentNumberFrame;
@property(nonatomic,assign)CGRect viewsFrame;
@property(nonatomic,assign)CGRect moneyFrame;

@property(nonatomic,assign)CGRect moneyFrame1;

@property(nonatomic,assign)CGRect cellTwoFrame;
@property(nonatomic,assign)CGRect headerImageFrame;
@property(nonatomic,assign)CGRect nameFrame;
@property(nonatomic,assign)CGRect introduceFrame;
@property(nonatomic,assign)CGRect cellTwoImageOneFrame;
@property(nonatomic,assign)CGRect cellTwoImageTwoFrame;
@property(nonatomic,assign)CGRect cellTwoImageThreeFrame;

@property(nonatomic,assign)CGRect cellThreeFrame;
@property(nonatomic,assign)CGRect cellThreeOneTextFrame;
@property(nonatomic,assign)CGRect cellThreeTwoTextFrame;

@property(nonatomic,assign)CGRect cellFourFrame;
@property(nonatomic,assign)CGRect cellFourOneTextFrame;
@property(nonatomic,assign)CGRect cellFourTwoTextFrame;

@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)BOOL isShow;

@end

NS_ASSUME_NONNULL_END

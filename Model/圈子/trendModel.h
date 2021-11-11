//
//  trendModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/22.
//

#import <Foundation/Foundation.h>
#import "trendCommentModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface trendModel : NSObject
@property(nonatomic,retain)NSString * headImage;
@property(nonatomic,retain)NSString * nameStr;
@property(nonatomic,retain)NSString * pubTime;
@property(nonatomic,retain)NSString * viewNum;

@property(nonatomic,retain)NSString * titleStr;
@property(nonatomic,retain)NSString * textStr;
@property(nonatomic,retain)NSString * followStatus;
@property(nonatomic,retain)NSString * commentTitleStr;
@property(nonatomic,retain)NSString * fabulousNum;
@property(nonatomic,retain)NSString * shareNum;

@property(nonatomic,retain)NSString * likeStr;
@property(nonatomic,retain)NSString * forwordStr;
@property(nonatomic,retain)NSString * allCommentCountStr;
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString *memberId;
@property(nonatomic,retain)NSMutableArray * imageArr;
@property(nonatomic,retain)NSMutableArray * commentArr;
@property(nonatomic,retain)NSString * typeId;
@property(nonatomic,retain)NSString * movUrl;
@property(nonatomic,retain)NSString * fabulousStatus;

- (id)initWithData:(NSDictionary *)dat;

@end

NS_ASSUME_NONNULL_END

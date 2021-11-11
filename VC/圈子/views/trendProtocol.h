//
//  trendProtocol.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//
#import "trendModel.h"
@protocol trendProtocolDelegate<NSObject>
-(void)didselectCell:(NSInteger)tag;
-(void)didselectcommentButton:(NSInteger)tag;
-(void)deleteButtonClick:(trendModel*)model;
-(void)likeButtonClick:(trendModel*)model;

@end

//
//  NewsTextMedel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsTextMedel : NSObject
@property(nonatomic,retain)NSString * albumPics;
@property(nonatomic,retain)NSString * cat2Name;
@property(nonatomic,retain)NSString * pic;
@property(nonatomic,retain)NSString * pubTime;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)NSString * viewNum;
@property(nonatomic,retain)NSString * myId;

- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END

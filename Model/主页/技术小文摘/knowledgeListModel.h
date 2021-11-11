//
//  knowledgeListModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface knowledgeListModel : NSObject
@property(nonatomic,retain)NSString * albumPics;
@property(nonatomic,retain)NSString * cat2Name;
@property(nonatomic,retain)NSString * pic;
@property(nonatomic,retain)NSString * pubTime;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)NSString * viewNum;
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString * cropId;
@property(nonatomic,retain)NSString * cropName;
@property(nonatomic,retain)NSString *typeId;
- (id)initWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END

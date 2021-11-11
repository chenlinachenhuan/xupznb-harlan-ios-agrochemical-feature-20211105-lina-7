//
//  goodsDetailCommentModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface goodsDetailCommentModel : NSObject
@property(nonatomic,retain)NSString * nameStr;
@property(nonatomic,retain)UIImage * headImg;
@property(nonatomic,retain)NSString * dateStr;
@property(nonatomic,retain)NSString * textStr;
@property(nonatomic,retain)NSString * typeStr;
@property(nonatomic,retain)NSMutableArray * imageArr;

- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END

//
//  goodTypeTextModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface goodTypeTextModel : NSObject
@property(nonatomic,retain)UIImage * typeImage;
@property(nonatomic,retain)NSString * moneyStr;
@property(nonatomic,retain)NSString * nameStr;
@property(nonatomic,retain)NSString * countStr;
@property(nonatomic,retain)NSString * typeStr;

- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END

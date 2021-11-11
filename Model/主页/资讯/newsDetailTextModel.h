//
//  newsDetailTextView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface newsDetailTextModel : NSObject
@property (nonatomic,strong)NSDate * updateTime;
@property(nonatomic,retain)NSString * content;
@property(nonatomic,retain)NSString * catName;
@property(nonatomic,retain)NSString * cat2Name;
@property(nonatomic,retain)NSString * title;
- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END

//
//  NextTableViewCell.h
//  TestCellBlockCycleRetain
//
//  Created by 席萍萍 on 16/8/19.
//  Copyright © 2016年 Bob. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CellBlock)(id cell);

@interface NextTableViewCell : UITableViewCell


@property (nonatomic,   copy) CellBlock cellBlock;

@end

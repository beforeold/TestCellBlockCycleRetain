//
//  NextTableViewCell.m
//  TestCellBlockCycleRetain
//
//  Created by 席萍萍 on 16/8/19.
//  Copyright © 2016年 Bob. All rights reserved.
//

#import "NextTableViewCell.h"

@implementation NextTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
    }
    
    return self;
}

- (void)tap:(UITapGestureRecognizer *)tap {
    !self.cellBlock ?: self.cellBlock(self);
}

@end

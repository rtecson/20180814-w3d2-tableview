//
//  MyTableViewCell.m
//  w3d2-demo
//
//  Created by Roland on 2018-08-14.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    
    // Reset cell back to default state
    self.label.text = @"Default value";
}

@end

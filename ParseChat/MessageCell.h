//
//  MessageCell.h
//  ParseChat
//
//  Created by Alexis Rojas-Westall on 6/17/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *messageText;
@property (weak, nonatomic) IBOutlet UILabel *username;

@end

NS_ASSUME_NONNULL_END

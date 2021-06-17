//
//  LoginViewController.m
//  ParseChat
//
//  Created by Alexis Rojas-Westall on 6/17/21.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewDidAppear:(BOOL)animated {
    PFUser *user = [PFUser currentUser];
    if (user != nil) {
        NSLog(@"Welcome back %@ 😀", user.username);

        [self performSegueWithIdentifier:@"chatSegue" sender:self];
    }
}

- (IBAction)onSIgnUp:(id)sender {
    // initialize a user object
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title"
                                                                        message:@"Message"
                                                                        preferredStyle:(UIAlertControllerStyleAlert)];
    // create an OK action
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                             // handle response here.
                                                     }];
    // add the OK action to the alert controller
    [alert addAction:okAction];
    
    if (([self.usernameTextfield.text isEqual:@""]) || ([self.passwordTextfield.text isEqual:@""])) {
        [self presentViewController:alert animated:YES completion:^{
            // optional code for what happens after the alert controller has finished presenting
        }];
    } else {
        PFUser *newUser = [PFUser user];
        
        // set user properties
        newUser.username = self.usernameTextfield.text;
        newUser.password = self.passwordTextfield.text;
        
        // call sign up function on the object
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
            if (error != nil) {
                NSLog(@"Error: %@", error.localizedDescription);
            } else {
                NSLog(@"User registered successfully");
                
            }
        }];
    }
    
}

- (IBAction)onLogin:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title"
                                                                        message:@"Message"
                                                                        preferredStyle:(UIAlertControllerStyleAlert)];
    // create an OK action
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                             // handle response here.
                                                     }];
    // add the OK action to the alert controller
    [alert addAction:okAction];
    
    if (([self.usernameTextfield.text isEqual:@""]) || ([self.passwordTextfield.text isEqual:@""])) {
        [self presentViewController:alert animated:YES completion:^{
            // optional code for what happens after the alert controller has finished presenting
        }];
    } else {
        NSString *username = self.usernameTextfield.text;
            NSString *password = self.passwordTextfield.text;
            
            [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
                if (error != nil) {
                    NSLog(@"User log in failed: %@", error.localizedDescription);
                } else {
                    NSLog(@"User logged in successfully");
                    
                    // display view controller that needs to shown after successful login
                    [self performSegueWithIdentifier:@"chatSegue" sender:self];
                    
                }
            }];
    }
}

//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}



@end

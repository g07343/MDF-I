//
//  ViewController4.m
//  baseProject
//
//  Created by Matthew Lewis on 12/5/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController4.h"
#import "CustomObject.h"
#import "CreatedMonster.h"

@interface ViewController4 ()

@end

@implementation ViewController4

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Create", @"Plot");
        self.tabBarItem.image = [UIImage imageNamed:@"create"];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set up keyboard listeners
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    //set background of datepicker to white since goofy Apple doesn't provide a simple way to change it's text color
    datePicker.backgroundColor = [UIColor whiteColor];
    closeKeyboard.enabled = false;
    saveButton.enabled = false;
    pictureChosen = false;
    
    //check whether there is a previously saved monster, and if so, enable the viewMonster button
    NSString *saveCheck = [[CustomObject GetInstance]savedName];
    if (saveCheck != nil)
    {
        NSLog(@"Found monster: %@", saveCheck);
    } else {
        viewButton.enabled = false;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button.tag == 0)
    {
        [nameField resignFirstResponder];
        closeKeyboard.enabled = NO;
        
    } else if (button.tag == 1)
    {
        pictureChosen = true;
        chosenMonster = @"rozBig";
        if (![nameField.text  isEqual: @""])
        {
            saveButton.enabled = true;
        }
    }
    else if (button.tag == 2)
    {
        pictureChosen = true;
        chosenMonster = @"knightBig";
        if (![nameField.text  isEqual: @""])
        {
            saveButton.enabled = true;
        }
    } else if (button.tag == 3)
    {
        pictureChosen = true;
        chosenMonster = @"waternooseBig";
        if (![nameField.text  isEqual: @""])
        {
            saveButton.enabled = true;
        }
    } else if (button.tag == 4)
    {
        pictureChosen = true;
        chosenMonster = @"griffBig";
        if (![nameField.text  isEqual: @""])
        {
            saveButton.enabled = true;
        }
    } else if (button.tag == 5)
    {   //check that a name was created
        if (![nameField.text  isEqual: @""])
        {   //check that user chose a picture
            if (pictureChosen == true)
            {
                nameString = nameField.text;
                //set value of date picker to dateString var
                NSDate *date = datePicker.date;
                //format date
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                if (dateFormatter != nil)
                {
                    [dateFormatter setDateFormat:@"LLL dd, yyyy"];
                    dateString = [dateFormatter stringFromDate:date];
                    //save date via custom object
                    [[CustomObject GetInstance]saveDate:dateString];
                }
                NSString *name = nameField.text;
                //save name via custom object
                [[CustomObject GetInstance] saveName:name];
                
                //save picture via custom object
                [[CustomObject GetInstance] savePic:chosenMonster];
                
                //disabled save button now that info is saved
                saveButton.enabled = false;
                //enable viewMonster button 
                viewButton.enabled = true;
                
            }
        }
    } else if (button.tag == 6)
    {
        //load created monster view
        CreatedMonster *createdMonster = [[CreatedMonster alloc] initWithNibName:@"CreatedMonster" bundle:nil];
        if (createdMonster != nil)
        {
            [self presentViewController:createdMonster animated:true completion:nil];
        }
        
    }
}

-(IBAction)onChange:(id)sender
{
    NSLog(@"%@", datePicker.date);
}

-(void)keyboardWillShow:(NSNotification *)notification
{
    closeKeyboard.enabled = true;
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    closeKeyboard.enabled = false;
    if (![nameField.text  isEqual: @""])
    {
        if (pictureChosen == true)
        {
            saveButton.enabled = true;
        }
    }
}

@end

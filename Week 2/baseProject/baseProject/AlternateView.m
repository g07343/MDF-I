//
//  AlternateView.m
//  baseProject
//
//  Created by Matthew Lewis on 12/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "AlternateView.h"

@interface AlternateView ()

@end

@implementation AlternateView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set selected imageViews to 'invisible' until the user makes a selection
    donSelected.alpha = 0;
    artSelected.alpha = 0;
    squishySelected.alpha = 0;
    terrySelected.alpha = 0;
    charBio.text = @"Select a monster above to get more info!";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//check which button is being pressed and display information from Full Sail library article or go back
-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button != nil)
    {
        if (button.tag == 0)
        {
            [self dismissModalViewControllerAnimated:true];
        } else if (button.tag == 1)
        {//reset alpha to none for all others and set don to visible
            artSelected.alpha = 0;
            squishySelected.alpha = 0;
            terrySelected.alpha = 0;
            donSelected.alpha = 1;
            charBio.text = @"A midlife failure now back in school, Don (Joel Murray) finds love in bloom at MU";
        } else if (button.tag == 2)
        {//reset alpha to none for all others and set art to visible
            donSelected.alpha = 0;
            squishySelected.alpha = 0;
            terrySelected.alpha = 0;
            artSelected.alpha = 1;
            charBio.text = @"MU's hippy-dippy furball (Charlie Day) is in college because \"I can't go back to jail!\"";
        } else if (button.tag == 3)
        {//reset alpha to none for all others and set squishy to visible
            donSelected.alpha = 0;
            artSelected.alpha = 0;
            terrySelected.alpha = 0;
            squishySelected.alpha = 1;
            charBio.text = @"Mike's frat bro is this smiley blob--optimism in embryo. (Voiced by Peter Sohn.)";
        } else if (button.tag == 4)
        {//reset alpha to none for all others and set terry to visible
            donSelected.alpha = 0;
            artSelected.alpha = 0;
            squishySelected.alpha = 0;
            terrySelected.alpha = 1;
            charBio.text = @"Feuding twins: two balky heads (Sean Hayes and Dave Foley) share one puny body";
        }
    }

    
}

@end

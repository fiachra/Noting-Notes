//
//  QuizScene.m
//  SpriteKitTest
//
//  Created by Meagan Matthews on 21/09/2013.
//  Copyright (c) 2013 Fiachra Matthews. All rights reserved.
//

#import "QuizScene.h"
#import "QuizQuestion.h"

@implementation QuizScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        
        self.backgroundColor = [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        
        _background = [SKSpriteNode spriteNodeWithImageNamed:@"backgroundBorder"];
        
        float scale = self.frame.size.width / _background.size.width;
        _background.xScale = scale;
        _background.yScale = scale;
        
        _background.anchorPoint= CGPointMake(0.5,0.5);
        self.anchorPoint= CGPointMake(0.5,0.5);
        
        //[self addChild:myLabel];
        [self addChild:_background];
        
        SKSpriteNode *paper = [SKSpriteNode spriteNodeWithImageNamed:@"backgroundPaper"];
        paper.anchorPoint= CGPointMake(0.5,0.5);
        
        [_background addChild:paper];
        
        _note = [SKSpriteNode spriteNodeWithImageNamed:@"trebleE-Natural-Middle-8"];
        _note.anchorPoint= CGPointMake(0.5,0.5);
        [_background addChild:_note];
        
        
        //trebleE-Natural-Middle-8
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        //CGPoint location = [touch locationInNode:self];
        /*
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
         */
        QuizQuestion *question = [[QuizQuestion alloc] initWithQuestion:QT_NOTES_ONLY Note:NQ_TREBLE_CLEF andKey:KQ_MAJOR_ONLY];

        _note = [SKSpriteNode spriteNodeWithImageNamed:[question QuestionImageLocation]];
        _note.anchorPoint= CGPointMake(0.5,0.5);
        [_background addChild:_note];
        
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

- (void) generateQuestion
{
    
    
}
/*
 
 function generateQuestion()
 local letters = {"A","B","C","D","E","F","G"}
 local clefs = {"treble","bass"}
 local times = {"1","2","4","8"};
 local tones = {"Major","Minor"}
 
 
 local letterChoice = math.random(1,6)
 local clefChoice = math.random(1,2)
 local timeChoice = math.random(1,4)
 
 --enableNotes = true
 --enableMajorKeys = false
 --enableMinorKeys= false
 
 --enableBassClef = false
 --enableTrebleClef = true
 
 local toneChoice = 0
 
 if(enableMajorKeys and enableMinorKeys) then
 toneChoice = math.random(1,2)
 elseif enableMinorKeys then
 toneChoice = 2
 else
 toneChoice = 1
 end
 
 
 if(enableTrebleClef and enableBassClef) then
 clefChoice = math.random(1,2)
 elseif(enableBassClef) then
 clefChoice = 2
 else
 clefChoice = 1
 end
 
 
 local questionInfo = {}
 questionInfo.AnswerLetter = table.remove(letters,letterChoice)
 
 if(enableNotes and (enableMajorKeys or enableMinorKeys)) then
 questionInfo.noteOrTone = math.random(1,2)
 elseif (enableMajorKeys or enableMinorKeys) then
 questionInfo.noteOrTone = 2
 else
 questionInfo.noteOrTone = 1
 end
 
 
 if(questionInfo.noteOrTone == 1) then
 questionInfo.noteImagePath = "images/notes/" .. clefs[clefChoice] .. questionInfo.AnswerLetter .. "-Natural-Middle-" .. times[timeChoice] .. ".png"
 else
 questionInfo.tone = tones[toneChoice]
 questionInfo.noteImagePath = "images/Keys/Key-" .. clefs[clefChoice] .."-" .. questionInfo.AnswerLetter .. "-" .. questionInfo.tone .. ".png"
 end
 
 questionInfo.CorrectAnswerIndex = math.random(1,3)
 questionInfo.answers = {}
 
 for i = 1, 3 do
 if(i == questionInfo.CorrectAnswerIndex) then
 table.insert(questionInfo.answers,questionInfo.AnswerLetter)
 else
 local wronAnsIndex = math.random(1, table.getn(letters))
 local wrongAns = letters[wronAnsIndex]
 table.remove(letters, wronAnsIndex)
 table.insert(questionInfo.answers, wrongAns)
 end
 end
 
 return questionInfo
 
 end
 */

@end

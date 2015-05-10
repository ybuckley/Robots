//
// begin license header
//
// This file is part of Pixy CMUcam5 or “Pixy” for short
//
// All Pixy source code is provided under the terms of the
// GNU General Public License v2 (http://www.gnu.org/licenses/gpl-2.0.html).
// Those wishing to use Pixy source code, software and/or
// technologies under different licensing terms should contact us at
// cmucam@cs.cmu.edu. Such licensing terms are available for
// all portions of the Pixy codebase presented here.
//
// end license header
//
/*
06.04.2014 v0.1.3 John Leimon
+ Now using pixy.init() to initialize Pixy in setup().
*/
#include <SPI.h>
#include <Pixy.h>
#include <SdFat.h>         // SDFat Library
#include <SdFatUtil.h>     // SDFat Util Library
#include <SFEMP3Shield.h>  // Mp3 Shield Library

SdFat sd; // Create object to handle SD functions

SFEMP3Shield MP3player; // Create Mp3 library object
// These variables are used in the MP3 initialization to set up
// some stereo options:
const uint8_t volume = 0; // MP3 Player volume 0=max, 255=lowest (off)
const uint16_t monoMode = 1;  // Mono setting 0=off, 3=max
Pixy pixy;
bool requested;
int randNumber;
int randResponse;

void setup()
{
  Serial.begin(9600);
  Serial.print("Starting...\n");
  pixy.init();
  initSD();
  initMP3Player();
  MP3player.playTrack(1);
  delay(5000);
  MP3player.end();
  requested = false;
  randNumber = 0;
  randResponse = 0;
}
void loop()
{
  if (requested == false)
  {  
    randNumber = random(2,7);
    randResponse = random(8,9);
    MP3player.begin();
    MP3player.playTrack(randNumber);
    delay(3000);
    MP3player.end();
    requested = true;
  }
  static int i = 0;
  int j;
  uint16_t blocks;
  char buf[32];
  blocks = pixy.getBlocks();
  if (blocks){
    i++;
    if (i%50 == 0)
    {
      sprintf(buf, "Detected %d:\n", blocks);
      if (pixy.blocks[j].signature == (randNumber - 1))
      {
        MP3player.begin();
        MP3player.playTrack(randResponse);
        delay(3000);
        MP3player.end();
        requested = false;   
      }
    }
  }
}


// initSD() initializes the SD card and checks for an error.
void initSD()
{
  //Initialize the SdCard.
  if(!sd.begin(SD_SEL, SPI_HALF_SPEED)) 
    sd.initErrorHalt();
  if(!sd.chdir("/")) 
    sd.errorHalt("sd.chdir");
}

void initMP3Player()
{
  uint8_t result = MP3player.begin(); // init the mp3 player shield
  if(result != 0) // check result, see readme for error codes.
  {
    // Error checking can go here!
  }
  MP3player.setVolume(volume, volume);
  MP3player.setMonoMode(monoMode);
}

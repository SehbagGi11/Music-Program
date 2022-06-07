//Libraries: uses Sketch / Import Library / Add Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
/*
import processing.sound.*;
SoundFile file;
*/
/*
import processing.sound.*;
 Sound s;
 */
//
Minim minim; //creates object to access all functions
int numberOfSongs = 6;
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; //creates "Play List" variables holding extensions WAV, AIFF, AU, SND, & MP3
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs]; //"song1's meta data"
int currentSong = numberOfSongs - numberOfSongs;
//
color black=0, purple=#2C08FF; //Grey Scale vs. Hexidecimal
PFont titleFont;
//
void setup() {
  size(500, 600); //Remeber, Display Geoemtry is Mandatory
  minim = new Minim(this); //loads from data directory, loadFile should also laod from project folder, like loadImage()
  //
  song[currentSong] = minim.loadFile("DownLoaded/Built to Last (Instrumental) - NEFFEX.mp3"); //albe to pass absulute path, file name & extension, and URL
  song[currentSong+=1] = minim.loadFile("DownLoaded/Danger Snow - Dan Henig.mp3");
  song[currentSong+=1] = minim.loadFile("DownLoaded/It's Only Worth It if You Work for It - NEFFEX.mp3");
  song[currentSong+=1] = minim.loadFile("DownLoaded/Tell Me That I Can't - NEFFEX.mp3");
  song[currentSong+=1] = minim.loadFile("DownLoaded/Tropical Thunder - RKVC.mp3");
  //array is always one less, that's why there is no 6, thye count from 0
  //
  currentSong-=currentSong; //currentSong = currentSong - currentSong
  for ( int i=currentSong; i<song.length; i++ ) { //i+=1, i=i+1, i++
    songMetaData[i] = song[i].getMetaData();
  }//End Meta Data
  /* For summarization ...
  //
  songMetaData[0] = song[0].getMetaData(); //reads song meta 1, like song1, mimicking array notation
  songMetaData[1] = song[1].getMetaData();
  songMetaData[2] = song[2].getMetaData();
  songMetaData[3] = song[3].getMetaData();
  songMetaData[4] = song[4].getMetaData();
  songMetaData[5] = song[5].getMetaData();
  */
  titleFont = createFont ("Century", 55);
  //
  println("Start of Console");
  println("Click the console to Finish Starting this Program"); // See previous lesson for OS-level Button
  println("Title:", songMetaData[currentSong].title() );
} //End setup
//
void draw() {
  if ( song[currentSong].isLooping() ) println("There are", song[currentSong].loopCount(), "loops left.");
  if ( song[currentSong].isPlaying() && !song[currentSong].isLooping() ) println("Play Once");
  //
  println("Computer Number of Current Song:", currentSong);
  println( "Song Position", song[currentSong].position(), "Song Length", song[currentSong].length() );
  //
  background (black);
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(purple); //Ink, hexidecimal copied from Color Selector
  textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  textFont(titleFont, 30); //Change the number until it fits, largest font size
  text(songMetaData[currentSong].title(), width*1/4, height*0, width*1/2, height*1/10);
  fill(255); //Reset to white for rest of the program
  /*
  float amplitude = map(mouseY, 0, height, 0.4, 0.0);
   //
   s.volume(amplitude);
   */
}//End draw
//
void keyPressed() {
  //Only press a number for this code below
  //println(key);
  if ( key=='1' || key=='9') {
    //Note: "9" is assumed as massive. "Simulate Infinite"
    if ( key == '1' ) println("Looping 1 time"); // Simulating Once
    if ( key == '9' ) println("Looping 9 times"); //Simulating Infinity
    String keystr = String.valueOf(key);
    println("Number of Repeats is", keystr);
    int num = int(keystr);
    song[currentSong].loop(num);
  }//End LOOP
  if ( key=='l' || key=='L' ) song[currentSong].loop(); //No parameter means "infinite loops"
  //
  if ( key>='2' && key!='9' ) println("I do not loop that high. Try again.");
  //
  /*
  //Only press a number for the code below
   String keyStr = String.valueOf(key);
   println("Number of Repeats is", keyStr);
   int num = int(keyStr);
   song1.loop(num);
   */
  //
  //Alternate Play/Pause Button
  if ( key=='p' || key=='P' ) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if ( song[currentSong].position() >= song[currentSong].length()-song[currentSong].length()*1/5 ) {
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }
  }//End Play/Pause Button
  //
  //Forward and Reverse Button
  //Built-in question: .isPlaying();
  if ( key=='f' || key=='F' ) song[currentSong].skip(1000); //skip forward 1 second (1000 milliseconds)
  if ( key=='r' || key=='R' ) song[currentSong].skip(-1000); //skip backward, or reverse, 1 second (1000 milliseconds)
  //
  /* Previous Play Button and Loop Button
   int loopNum = 2; //Local Variables plays once and loops twice
   //song1.play(); //Parameter is milli-seconds from start of audio file to start fo playing
   if ( key=='l' || key=='L' ) song1.loop(loopNum);
   */
  //
  if ( key=='m' || key=='M' ) { //Mute Buttin
    if ( song[currentSong].isMuted() ) {
      song[currentSong].unmute();
    } else {
      song[currentSong].mute();
    }
  } //End MUTE
  //
  //STOP Button
  if ( key=='s' || key=='S' ) { //STOP Button
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      //
    } else {
      song[currentSong].rewind();
    }
  } //End STOP Button
  //
  if ( key=='n' || key=='N' ) {
    if ( song[currentSong].isPlaying() ) {
      //Serious Problem: playing multiple songs at the same time
    } else {
      currentSong++;
    }
  } //End Next Button
  //
}//End keyPressed
//
void mousePressed() {
  //
}//End mousePressed
//
//End MAIN

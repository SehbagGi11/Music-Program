//Libraries: uses Sketch / Import Library / Add Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
import processing.sound.*;
SoundFile file;
/*
import processing.sound.*;
 Sound s;
 */
//
Minim minim; //creates object to access all functions
AudioPlayer song1; //creates "Play List" variables holding extensions WAV, AIFF, AU, SND, & MP3
AudioMetaData songMetaData1; //"song1's meta data"
//
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;
AudioPlayer song5;
AudioPlayer song6;
//
void setup() {
  size(500, 600); //Remeber, Display Geoemtry is Mandatory
  minim = new Minim(this); //loads from data directory, loadFile should also laod from project folder, like loadImage()
  //
  song1 = minim.loadFile("DownLoaded/Built to Last (Instrumental) - NEFFEX.mp3"); //albe to pass absulute path, file name & extension, and URL
  songMetaData1 = song1.getMetaData(); //reads song meta 1, like song1, mimicking array notation
  //
  song2 = minim.loadFile("DownLoaded/Danger Snow - Dan Henig.mp3");
  song3 = minim.loadFile("DownLoaded/Away - Patrick Patrikios.mp3");
  song4 = minim.loadFile("DownLoaded/Take it Slow - SefChol.mp3");
  song5 = minim.loadFile("DownLoaded/Positive Fuse - French Fuse.mp3");
  song6 = minim.loadFile("DownLoaded/Target Fuse - French Fuse.mp3");
  //
  println("Start of Console");
  println("CLick the console to Finish Starting this Program"); // See previous lesson for OS-level Button
  println("Title:" songMetaData1.title() );
} //End setup
//
void draw() {
  if ( song1.isLooping() ) println("There are", song1.loopCount(), "loops left.");
  if ( song1.isPlaying() && !song1.isLooping() ) println("Play Once");
  //
  println( "Song Position", song1.position(), "Song Length", song1.length() );
  //
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
    song1.loop(num);
  }//End LOOP
  if ( key=='l' || key=='L' ) song1.loop(); //No parameter means "infinite loops"
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
    if ( song1.isPlaying() ) {
      song1.pause();
    } else if ( song1.position() >= song1.length()-song1.length()*1/5 ) {
      song1.rewind();
      song1.play();
    } else {
      song1.play();
    }
  }//End Play/Pause Button
  //
  //Forward and Reverse Button
  //Built-in question: .isPlaying();
  if ( key=='f' || key=='F' ) song1.skip(1000); //skip forward 1 second (1000 milliseconds)
  if ( key=='r' || key=='R' ) song1.skip(-1000); //skip backward, or reverse, 1 second (1000 milliseconds)
  //
  /* Previous Play Button and Loop Button
   int loopNum = 2; //Local Variables plays once and loops twice
   //song1.play(); //Parameter is milli-seconds from start of audio file to start fo playing
   if ( key=='l' || key=='L' ) song1.loop(loopNum);
   */
  //
  if ( key=='m' || key=='M' ) { //Mute Buttin
    if ( song1.isMuted() ) {
      song1.unmute();
    } else {
      song1.mute();
    }
  } //End MUTE
  //
  //STOP Button
  if ( key=='s' || key=='S' ) { //STOP Button
    if ( song1.isPlaying() ) {
      song1.pause();
      song1.rewind();
      //
    } else {
      song1.rewind();
    }
  } //End STOP Button
  //
}//End keyPressed
//
void mousePressed() {
}//End mousePressed
//
//End MAIN


String output="";
String[] lines;
String hFinn; //entire play in one string



StringParser sp;
void setup() {
  size(800, 800,P3D);
  lines=loadStrings("mis2.txt"); //lines
  hFinn = join(lines, " "); //entire play in one string
  



  sp = new StringParser(hFinn);
  println("Word Count: " + sp.countWords());
  println("Vowel Count: " + sp.countVowels());
  println("Syllable Count: " + sp.countSyllables());
  println("Sentence Count: " + sp.countSentences());
 println("Flesch Reading Ease Score: " + sp.Flesch());
  println("Flesch Grade Level: " + sp.getGrade());
}
void draw() {
  background(0);
 
  text("Word Count: " + sp.countWords(),200,100,100);

  text("Vowel Count: " + sp.countVowels(),200,200);
  text("Syllable Count: " + sp.countSyllables(),200,300);
  text("Sentence Count: " + sp.countSentences(),200,400);
  text("Flesch Reading Ease Score: " + sp.Flesch(),200,500);
  text("Flesch Grade Level: " + sp.getGrade(),200,600);
  
  
  //sp.Flesch();
}

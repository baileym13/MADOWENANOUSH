

public class StringParser {
  String mis;
  String[] words;
  String [] sentences;

  public StringParser() {
  }
  public StringParser(String l) {
    mis=l;
    sentences = mis.split("[\\!\\.\\?]+");
    words=splitTokens(mis, ",.?!: ");

  }

  /**
   *countWords();
   * A "word" is defined as a contiguous string of alphabetic characters
   * i.e. any upper or lower case characters a-z or A-Z.  This method completely 
   * ignores numbers when you count words, and assumes that the document/paragraph does not have 
   * any strings that combine numbers and letters. 
   */

  public int countWords() {
    return words.length;
  }

  public int countVowels() {
    int count=0;
    for (String word : words) {
      for (int i=0; i<word.length(); i++) {
        if (word.charAt(i)=='a' || word.charAt(i)=='e' || word.charAt(i)=='i' || word.charAt(i)=='o' || word.charAt(i)=='u' || word.charAt(i)=='y' || word.charAt(i)=='A' || word.charAt(i)=='E' || word.charAt(i)=='I' || word.charAt(i)=='O' || word.charAt(i)=='U' || word.charAt(i)=='Y')
          count++;
      }
    }

    return count++;
  }


  /**
   * Get the total number of syllables in the document (the paragraph). 
   * To count the number of syllables in a word, use the following rules:
   *       Each contiguous sequence of one or more vowels is a syllable, 
   *       with the following exception: a lone "e" at the end of a word 
   *       is not considered a syllable unless the word has no other syllables. 
   *       You should consider y a vowel.
   */

  public int countSyllables() {

    int Exceptcount=0;
    for (String word : words) {
      for (int i=0; i<word.length()-1; i++) {
        if (word.charAt(i)=='a' || word.charAt(i)=='e' || word.charAt(i)=='i' || word.charAt(i)=='o' || word.charAt(i)=='u' || word.charAt(i)=='y' || word.charAt(i)=='A' || word.charAt(i)=='E' || word.charAt(i)=='I' || word.charAt(i)=='O' || word.charAt(i)=='U' || word.charAt(i)=='Y')
          if (word.charAt(i+1)=='a' || word.charAt(i+1)=='e' || word.charAt(i+1)=='i' || word.charAt(i+1)=='o' || word.charAt(i+1)=='u' || word.charAt(i+1)=='y' || word.charAt(i+1)=='A' || word.charAt(i+1)=='E' || word.charAt(i+1)=='I' || word.charAt(i+1)=='O' || word.charAt(i+1)=='U' || word.charAt(i+1)=='Y')
            Exceptcount++;
      }
      if (word.charAt(word.length()-1)=='e')
        Exceptcount++;
    }

    return countVowels()-Exceptcount;
  }



  /**
   * Eventually write this one too. Get the number of sentences in the document/paragraph.
   * Sentences are defined as contiguous strings of characters ending in an 
   * end of sentence punctuation (. ! or ?) or the last contiguous set of 
   * characters in the document, even if they don't end with a punctuation mark.
   */

  public int countSentences() {

    return sentences.length;
  }
  public double Flesch() {
    double fle;
    fle= 206.835-1.015*(countWords()/(double)countSentences());
    fle-=84.6*(countSyllables()/(double)countWords());
    fill(255);
    textSize(30);
   // text("Flesch Reading Ease Score: "+Math.round(fle), 100, height/2);
    return fle;
  }
  public String getGrade() {
    if ( Flesch() >= 90.0 && Flesch() <= 100.0) {
      return "5th grade";
    } else if ( Flesch() >= 80.0 && Flesch() < 90.0) {
      return "6th grade";
    } else if ( Flesch() >= 70.0 && Flesch() < 80.0) {
      return "7th grade";
    } else if ( Flesch() >= 60.0 && Flesch() < 70.0) {
      return "8th and 9th grade";
    } else if ( Flesch() >= 50.0 && Flesch() < 60.0) {
      return "10th and 12th grade";
    } else if ( Flesch() >= 30.0 && Flesch() < 50.0) {
      return "college";
    } else if ( Flesch() > 70.0 && Flesch() < 80.0) {
      return "College Graduate";
    }  
    return "";
  }


}

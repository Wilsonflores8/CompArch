// Wilson Flores

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <ctype.h>
#include <assert.h>

// memDump iterates through the char array pointer and prints out memory address, ascii value, and char.
// At the end of the 1 gets added to the memory address.
void memDump(char *wp){
  printf("\nMemory Dump:\n");
  int ln = strlen(wp);
  for(int i = 0; i < ln; i+=1)  {
    printf("%p    ", wp);
    printf("%d    ", *wp);
    printf("%c\n", *wp);
    wp += 1;
  }
}
// getHash adds up all hash values of each char and divides that number with the number of chars in the char array.
int getHash  (char *wp){
  int sum_of_ascii_values = 0;
  int hash_value = 0;
  // To find the length of the char array
  int number_of_chars = 0;
  // int ln = strlen(wp);
  while(*wp != '\0')  {
    sum_of_ascii_values += (*wp);
    number_of_chars += 1;
    wp += 1;
  }
  hash_value = sum_of_ascii_values/number_of_chars;
  
  return hash_value;
}

bool isPalindrome(char *wp){
  // While loop to find the length of the char array passed
  int num_of_chars = 0;
  while(*wp != '\0')  {
    num_of_chars += 1;
    wp += 1;
  }

  char backward_str[num_of_chars];
  char* backward_ptr = backward_str;
  wp -= 1; // subtract 1 so wp is pointed at last char
  for(int i=0; i < num_of_chars; i+=1){
    *backward_ptr = (*wp); // copying the char at wp to backward_ptr
    backward_ptr += 1;
    wp -= 1;
  }
  wp += num_of_chars; // resetting wp back to point at last index
  backward_ptr -= 1; // backward_ptr is now the reversed wp and pointing at last index after this line
  int backward_ptr_reset = 0; // This is to reset backward_ptr to last char to print it if not palindrome
  for(int i = 0; i < num_of_chars; i++){
    if((*wp) != (*backward_ptr)){ // If wp not palindrome, the program will enter the if statement
      backward_ptr += backward_ptr_reset;
      printf("\nSadly, \"");
      for(int j = 0; j < num_of_chars; j+=1){
        printf("%c", *backward_ptr);
        backward_ptr -= 1;
      }
      printf("\" is not a palindrome :(\n");
      return false;
    }
    backward_ptr_reset += 1;
    wp -= 1;
    backward_ptr -= 1;
  }
  printf("\nNice, \"");
  backward_ptr += 1;
  // While loop is used to print the palindrome
  while(num_of_chars != 0){
    printf("%c", *backward_ptr);
    backward_ptr += 1;
    num_of_chars -= 1;
  }
  printf("\" is a palindrome :)\n");
  return true;
}

void printFromIndex(char *wp){
  int num_of_chars = 0; // This helps us to not go out of bounds when iterating through wp
  int chosen_idx = 0;
  char original_name[15]; // where we will store the chars in wp
  char* original_name_pointer = original_name;
  while(*wp != '\0')  {
    num_of_chars += 1;
    *original_name_pointer = *wp;
    original_name_pointer += 1;  
    wp += 1;
  }
  wp -= num_of_chars;
  printf("What index should I start at? ");
  scanf("%d", &chosen_idx);
  if (chosen_idx > num_of_chars){ // If statement makes sure index is not out of bounds
    printf("Oops! That is not a valid starting index, try again later.\n");
    exit(0);
  }
  for (int i = 0; i < chosen_idx; i++){ // After this for loop wp will point to the index we want to start with
    wp += 1;
  }
  original_name_pointer -= num_of_chars; // After this line original_name_pointer will point at the first index
  printf("So, \"");
  for(int i = 0; i < num_of_chars; i+=1){ // For loop prints the starting word
    printf("%c", *original_name_pointer);
    original_name_pointer += 1;
  }
  printf("\" starting at index %d is \"", chosen_idx);
  while(*wp != '\0'){ // While loop prints from chosen_idx
    printf("%c", *wp);
    wp += 1;
  }
  printf("\"\n");
}

void checkWord(char* wp){
  int length = 0;
  while(*wp != '\0'){ 
    char iu_check = (*wp);
    if(isupper(iu_check)){ // checks if all chars are lowercase
        printf("Word is not valid\n"); 
        exit(0);}
    length += 1;
    wp += 1;
    if (length > 15){ // length of wp is <= 15
        printf("Word is not valid\n"); 
        exit(0);}
  }
  wp -= length;
}

void extension(char* wp){
  int num_of_chars = 0;
  while(*wp != '\0')  { // Finds the length of wp
    num_of_chars += 1;
    wp += 1;
  }
  wp -= num_of_chars;
  char char_holder[num_of_chars]; // Will hold chars in wp in reverse order
  char* char_holder_pointer = char_holder;
  for (int i = 0; i < num_of_chars; i+=1){ // For loop add chars to char_holder in reverse order
    *char_holder_pointer = *wp;
    char_holder_pointer += 1;
    wp += 1;
  }
  char_holder_pointer -= 1;
  wp -= num_of_chars; // resets wp to first char
  for(int j = 0; j < num_of_chars; j+=1){ // For loop copies the order of chars to wp
    *wp = *char_holder_pointer;
    wp += 1;
    char_holder_pointer -= 1;
  }
  wp -= num_of_chars; // resets wp to first char
  for(int k = 0; k < num_of_chars; k+=1){ // prints wp
    printf("%c", *wp);
    wp += 1;
  }
  printf("\n");
}

int main(int argc, char* argv[]){
  char word[16]; // add one extra space to identify the last char
  int option_number;

  printf("Enter an all lowercase word, max of 15 characters: ");
  scanf("%s", word);
  char* word_pointer = word; // creates a pointer to word
  checkWord(word_pointer); // check to make sure word is less than 16 chars and not uppercase
  //printing out options
  printf("Choose an option:\n");
  printf(" 1) Memory dump\n");
  printf(" 2) Print hash value\n");
  printf(" 3) Determine if your word is a palindrome\n");
  printf(" 4) Print the word from an index\n");
  printf(" 5) Extension: Reverse String\n");
  printf("\n");

  printf("Option (number): ");
  scanf("%d", &option_number);
  // if and else if's to determine which method to call
  if (option_number == 1){
    memDump(word_pointer);
  }
  else if(option_number == 2){
    printf("\nHash value: %d\n", getHash(word_pointer));
  }
  else if(option_number == 3){
    isPalindrome(word_pointer);
  }
  else if(option_number == 4){
    printFromIndex(word_pointer);
  }
  else if(option_number == 5){
    extension(word_pointer);
  }
}

/*
Follow Up Questions:
1. This assignment took me a long time
2. Yes
3. I learned to enjoy them over time. I feel each method I worked on I got better with pointers. BY the
  time I got to the extension I felt really comfortable.
4. Finding the best way to iterate through a char array without going out of bounds was difficult for me.
  I later relised that I could use the strlen() method but sadly it was to late and I already wrote my code without it.
  But I slowly learned the best ways and methods to set the pointer to where I wanted it in the char array.
5. The main thing I took away from this assignment is how pointers work
*/
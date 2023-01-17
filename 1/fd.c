// Exercise 01: Write a shell script that accepts a file name, starting and ending line numbers as arguments and displays all the lines between the given line numbers.

#include <stdio.h>
#include <stdlib.h>

void printHelp() {
  printf("Usage: [] filename start end\n");
}

int main(int argc, char *argv[]) {
  int start, end;
  int curr;
  char line[256];

  if (argc != 4) {
    printf("Error while parsing input, expected 3 arguments but received %d.\n", argc-1);
    printHelp();
    return 1;
  }

  start = atoi(argv[2]);
  end = atoi(argv[3]);

  if (start > end) {
    printf("Error while parsing input, start line cannot be greater than end line.\n");
    return 1;
  }

  FILE *fp = fopen(argv[1], "r");
  if (fp == NULL) {
    printf("Couldn't open file %s, have you checked the name?\n", argv[1]);
    return 1;
  }

  curr = 0;
  while (fgets(line, sizeof(line), fp) != NULL) {
    curr++;
    if (curr < start || curr > end) continue;

    printf("[%d] %s", curr, line);
  }

  fclose(fp);
  return 0;
}
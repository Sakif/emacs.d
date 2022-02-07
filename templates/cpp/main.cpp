#include <iostream>

using namespace std;

int main(int const argc, char const **argv) {
  if (argc < 1) {
    cout << "No argument was passed" << endl;
  }

  for (auto i = 0; i < argc; i++) {
    printf("arg %d: %s\n", i, argv[i]);
  }

  cout << "Hello, World!" << endl;
  return EXIT_SUCCESS;
}

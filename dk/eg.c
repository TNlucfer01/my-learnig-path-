#include <stdio.h>
#include <stdlib.h>

int main() {
  FILE *file = fopen("filename.dat", "rb");
  if (file == NULL) {
    perror("Error opening file");
    return 1;
  }

  // Read data (assuming you know the structure)
  unsigned char buffer[1024];
  size_t bytesRead = fread(buffer, 1, sizeof(buffer), file);

  printf("Read %zu bytes:\n", bytesRead);
  for (size_t i = 0; i < bytesRead; i++) {
    printf("%02x ", buffer[i]);
  }

  fclose(file);
  return 0;
}

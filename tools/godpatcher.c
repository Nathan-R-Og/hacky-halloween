//LITERALLY all this does is change the first 0x10 bytes of an input file to the nes 2.0 header.
#include <stdio.h>
#include <stdlib.h>
unsigned char new_bytes[] = {'N','E','S',0x1a,16,32,0x42,0x08,0x00,0x00,0x70,0x00,0x00,0x00,0x00,0x01};

void copy_file(char *src_path, char *dest_path) {
    FILE *src = fopen(src_path, "rb");  // Open source for reading in binary mode
    FILE *dest = fopen(dest_path, "wb"); // Open destination for writing in binary mode

    if (src == NULL || dest == NULL) {
        perror("File opening failed");
        printf("%s", src_path);
        return;
    }

        // Get file size
    fseek(src, 0, SEEK_END);
    long size = ftell(src);
    rewind(src);

    // Allocate dynamic buffer
    char *buffer = (char *)malloc(size + 1);
    if (!buffer) {
        fclose(src);
        return;
    }

    size_t bytes;
    while ((bytes = fread(buffer, 1, sizeof(buffer), src)) > 0) {
        fwrite(buffer, 1, bytes, dest);
    }

    fclose(src);
    fclose(dest);
}

int main(int argc, char *argv[]) {
    FILE *file_ptr;
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    char outfile[] = "patched_rom.nes";
    copy_file(argv[1], outfile);

    file_ptr = fopen(outfile, "r+b");
    if (file_ptr == NULL) {
        perror("Error opening file");
    }

    size_t bytes_written = fwrite(new_bytes, sizeof(unsigned char), sizeof(new_bytes), file_ptr);
    if (bytes_written != sizeof(new_bytes)) {
        perror("Error writing to file");
        fclose(file_ptr);
    }

    fclose(file_ptr);
    printf("Done! Have fun!\n");
    return 0;
}
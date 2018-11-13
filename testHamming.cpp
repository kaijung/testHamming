#include <stdio.h>
#include <stdlib.h>
#include <opencv2/flann/flann.hpp>


typedef cvflann::Hamming<uchar> Distance;

int main(int argc, char **argv) {

	uchar a[5] = {0x03,0x2f,0x31,0x23,0x67};
	uchar b[5] = {0x05,0x7f,0x81,0x93,0xee};
	Distance hammingDist;
	printf("%d\n",hammingDist(a,b,5));
}
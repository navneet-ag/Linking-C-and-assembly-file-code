// Navneet Agarwal
// 2018348
#include <stdio.h>
#include <inttypes.h>

extern int64_t add(int64_t, int64_t);

int main() {
	int a,b;
	printf("%s\n","Enter the two numbers :" );
	scanf("%d",&a);
	scanf("%d",&b);
	add(a,b);	
    return 0;
}
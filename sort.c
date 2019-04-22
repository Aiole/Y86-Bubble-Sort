#include<stdio.h>

#define SZ 10

//--------------------------- tiny_sort -----------------------------------//
// sorts an array of integers into ascending order using O(n^2) bubblesort //
//   algorithm.                                                            //
//  [long *] values - array to sort                                        //
//  [long] length of array                                                 //
//-------------------------------------------------------------------------//
void tiny_sort(long *values, long count) {
   long i,last;
   for(last=count-1;last>0;last--) {
     for(i=0;i<last;i++) {
       if (values[i+1] < values[i]) {
         long t = values[i+1];
         values[i+1]=values[i];
         values[i]=t;
       }
     }
   }
}

//------------------------ print_values -----------------------------------//
// prints each element of the array, one per line                          //
//  [long *] values - array of integers                                    //
//  [long] count - length of the array                                     //
//-------------------------------------------------------------------------//
void print_values(long *values, long count) {

  long i;
  for(i=0;i<count;i++) {
    printf("%ld: %10ld %016lx\n", i, values[i], values[i]);
  }
}

//----- start main
int main(void) {

   long array[SZ] = {
     0x0FFF,
     0x0F20,
     0xFFFFFFFFFFFFFF45,
     0xFFFFFFFFFFFFFFFF,
     0x01,
     0x03,
     0x04,
     0x0A,
     0x09,
     0x11
   };
 
   tiny_sort(array, SZ);
   print_values(array,SZ);
}

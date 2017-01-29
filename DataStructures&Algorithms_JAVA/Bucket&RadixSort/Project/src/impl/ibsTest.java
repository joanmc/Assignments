package impl;

import core.List;
import java.util.Random;

/**
 *  Class to test integerBucketSort method of SortingUtils class with an Integer list 
 *  with integers between a specified range
 */
public class ibsTest {
	public static void main(String[] args) {
		// Integer linked list
		List<Integer> list  = new LinkedList<Integer>();
		Random r = new Random();
		// number of integers in list
		int size = 500;
		// upper and lower limits of range
		int lower = 50;
		int upper = 250;
		
		//add random integers to list
		for (int i=0; i<size; i++){
			// generate random number within range and insert at end of list
	        list.insertLast(r.nextInt((upper-lower)+1) + lower);
	    }
		
		// print list before sorting
		System.out.println(list);
		// sort list
		SortingUtils.integerBucketSort(list, lower, upper);
		// print list after sorting
		System.out.println(list);
	}
}

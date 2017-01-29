package impl;

import core.List;
import java.util.Random;

/**
 *  Class to test integerRadixSort method of SortingUtils class with an Integer list 
 *  with each integer having a max number of digits
 */
public class irsTest {
	public static void main(String[] args) {
		// Integer Linked List
		List<Integer> list  = new LinkedList<Integer>();
		Random r = new Random();
		// num
		int size = 500;
		int limit = 1000;
		int digits = 3;
		
		//add random integers to list
		for (int i=0; i<size; i++){
			// generate random number between 0 and 999 and insert at end of list
	        list.insertLast(r.nextInt(limit));
	    }
		
		// print list before sorting
		System.out.println(list);
		// sort list
		SortingUtils.integerRadixSort(list, digits);
		// print list after sorting
		System.out.println(list);
	}
}
package impl;

import java.lang.reflect.Array;
//import java.util.Random;

import core.List;

/**
 * Class containing 4 sorting algorithms 
 * singleDigitBucketSort: bucket sort algorithm to sort single integers
 * integerBucketSort: bucket sort algorithm to sort a list of integers between a range specified by the upper and lower parameters
 * integerRadixSort: radix sort algorithm to sort a list of integers, with the max number of digits in the integers specified by the digits parameter
 * stringRadixSort: radix sort algorithm to sort a list of strings with the max number of characters in the Strings specified by the digits parameter
 */
public class SortingUtils {
	@SuppressWarnings("unchecked")
	public static void singleDigitBucketSort(List<Integer> list) {
		// set up integer list to represent the buckets 
		// this method is to sort single integers therefore there are 10 buckets (0-9)
		List<Integer>[] buckets = (List<Integer>[]) Array.newInstance(List.class, 10);
		
		// Copy the values from the list into the buckets.
		while (!list.isEmpty()) {
			// remove each integer from the list
			int value = list.remove(list.first());
			// check the integer removed is valid (i.e. that it is between 0-9 inclusive)
			if (value < 0 || value > 9) throw new UnsortableException("The list contains an invalid value: " + value);
			// if the indexed bucked is null...
			if (buckets[value] == null) {
				// initialise an integer linked list at the indexed bucket
				buckets[value] = new LinkedList<Integer>();
			}
			// insert the value being sorted to the end of the linked list of the indexed bucket
			buckets[value].insertLast(value);
		}
		
		// Copy the values from the buckets to the list
		for (int i=0; i < buckets.length; i++) {
			// if the bucket contains a list...
			if (buckets[i] != null) {
				//remove all values from the bucket
				while (!buckets[i].isEmpty()) {
					// remove the values from the bucket list (first to last) and insert the value onto the end of the list
					list.insertLast(buckets[i].remove(buckets[i].first()));
				}
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public static void integerBucketSort(List<Integer> list, int lower, int upper) {
		// set up integer list to represent the buckets 
		// this method is to sort integers between a lower and upper range, therefore there are (upper-lower)+1 buckets
		List<Integer>[] buckets = (List<Integer>[]) Array.newInstance(List.class, (upper-lower)+1);
				
		// Copy the values from the list into the buckets.
		while (!list.isEmpty()) {
			// remove each integer from the list
			int value = list.remove(list.first());
			// check the integer removed is valid (i.e. that it is between the upper and lower range specified)
			if (value > upper || value < lower) throw new UnsortableException("The list contains an invalid value: " + value);
			// as the buckets index start at 0, he lower range must be subtracted from the value to specify the correct index for the bucket
			// if the indexed bucked is null...
			if (buckets[value-lower] == null) {
				// initialise an integer linked list at the indexed bucket
				buckets[value-lower] = new LinkedList<Integer>();
			}
			// insert the value being sorted to the end of the linked list of the indexed bucket
			buckets[value-lower].insertLast(value);
		}
		
		// Copy the values from the buckets to the list
		for (int i=0; i < buckets.length; i++) {
			// if the bucket contains a list...
			if (buckets[i] != null) {
				//remove all values from the bucket
				while (!buckets[i].isEmpty()) {
					// remove the values from the bucket list (first to last) and insert the value onto the end of the list
					list.insertLast(buckets[i].remove(buckets[i].first()));
				}
			}
		}
	}  
	
	@SuppressWarnings("unchecked")
	public static void integerRadixSort(List<Integer> list, int digits) {
		// set up integer list to represent the buckets 
		// this method sorts single integers on each loop of the for loop therefore there are 10 buckets (0-9)
		List<Integer>[] buckets = (List<Integer>[]) Array.newInstance(List.class, 10);
		
		// for the max number of digits in an integer in a list..
		for (int exp=0; exp<digits; exp++){
			// Copy the values from the list into the buckets
			while (!list.isEmpty()) {
				// remove each integer from the list
				int value = list.remove(list.first());
				// extract a digit from the value
				// note: we start with the Least significant digit and move to the next digit on the left 
				// with each iteration of the for loop for each value in the list
				int digit = (int) ((value/(Math.pow(10, exp))) % 10);
				// check the integer removed is valid (i.e. that it is between 0-9 inclusive)
				if (digit < 0 || digit > 9) throw new UnsortableException("The list contains an invalid value: " + value);
				// if the indexed bucked is null...
				if (buckets[digit] == null) {
					// initialise an integer linked list at the indexed bucket
					buckets[digit] = new LinkedList<Integer>();
				}
				// insert the value being sorted to the end of the linked list of the indexed bucket
				buckets[digit].insertLast(value);
			}
		
			// Copy the values from the buckets to the list
			for (int i=0; i < buckets.length; i++) {
				// if the bucket contains a list...
				if (buckets[i] != null) {
					//remove all values from the bucket
					while (!buckets[i].isEmpty()) {
						// remove the values from the bucket list (first to last) and insert the value onto the end of the list
						list.insertLast(buckets[i].remove(buckets[i].first()));
					}
				}
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public static void stringRadixSort(List<String> list, int digits) {
		// set up String list to represent the buckets 
		// this method is to sort letters of the alphabet therefore we need 26 buckets plus 
		// an additional bucket to store shorter words that have already been fully sorted
		List<String>[] buckets = (List<String>[]) Array.newInstance(List.class, 27);
		int index; 
		
		// need to sort number of times equal to max length word
		for (int j=1; j<=digits; j++){
			while (!list.isEmpty()) {
				// remove each word from the list
				String word = list.remove(list.first());
				// if word is already sorted (word is shorter than max length)
				// index is zero - put into first bucket
				if (word.length() < j){
					index = 0;
				}
				// otherwise sort based on next letter to the left
				else{
					// start at last letter (least significant character) and move to the left 
					int i = word.length()-j;
					char letter = word.charAt(i);
					// check the character is valid (i.e. that it is between a-z inclusive)
					if ((int)letter < (int)'a' || (int)letter > (int)'z') throw new UnsortableException("The list contains a word of invalid length: " + word);
					// set the bucket index for the character being sorted
					// 27 buckets, 26 letters and first bucket for holding words already sorted
					// ascii 'a' is 97
					index = (int)letter-96;
					
				}
				// put word into correct bucket (based on index already determined)
				// if the indexed bucket is null...
				if (buckets[index] == null) {
					// initialise a string linked list at the indexed bucket
					buckets[index] = new LinkedList<String>();
				}
				// insert the word being sorted to the end of the linked list of the indexed bucket
				buckets[index].insertLast(word);
			}
			
			// Copy the values from the buckets to the list
			for (int i=0; i < buckets.length; i++) {
				// if the bucket contains a list...
				if (buckets[i] != null) {
					//remove all values from the bucket
					while (!buckets[i].isEmpty()) {
						// remove the values from the bucket list (first to last) and insert the value onto the end of the list
						list.insertLast(buckets[i].remove(buckets[i].first()));
					}
				}
			}	
		}
	}
}

	

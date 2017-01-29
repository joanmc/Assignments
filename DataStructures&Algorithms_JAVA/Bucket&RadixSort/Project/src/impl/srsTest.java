package impl;

import core.List;

/**
 *  Class to test stringRadixSort method of SortingUtils class with a given phrase
 */
public class srsTest {
	public static void main(String[] args) {
		// phrase to sort
		String sentence = "the big black cat sat on the beautiful brown mat";
		// String linked list
		List<String> list  = new LinkedList<String>();
		
		// insert string into String list
		for (String word : sentence.split(" ")) {
			list.insertLast(word.toLowerCase());
		}
		
		// print list before sorting
		System.out.println(list);
		// sort list
		SortingUtils.stringRadixSort(list, 9);
		// print list after sorting
		System.out.println(list);
	}

}

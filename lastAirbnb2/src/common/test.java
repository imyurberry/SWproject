package common;

import java.util.Scanner;

public class test {
	static int arr[];
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		int m = sc.nextInt();
		
		arr = new int[n+1];
		for(int i = 0; i < arr.length; i++) {
			arr[i] = i;
		}
		
		for(int i = 1; i <= m; i++) {
			int first = sc.nextInt();
			int second = sc.nextInt();
			int third = sc.nextInt();
			
			if(first == 0) {
				union(second, third);
			}else {
				if(arr[second] == arr[third]) 
					System.out.println("YES");
				else 
					System.out.println("NO");
			}
		}
	}
	
	public static void union(int second, int third) {
			int secondParent = find(second);
			int thirdParent = find(third);
			
			if(secondParent >= thirdParent) {
				arr[second] = arr[third];
			}else {
				arr[third] = arr[second];
			}
	}
	
	public static int find(int num) {
		if(num == arr[num]) return num;
		return arr[num] = find(arr[num]);
	}
	
}

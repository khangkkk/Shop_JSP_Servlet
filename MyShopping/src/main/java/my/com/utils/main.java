package my.com.utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import my.com.dao.UserDAO;
import my.com.dao.impl.UserDAOImpl;

public class main {

	public static void main(String[] args) throws SQLException {		
		List<Integer> lst = new ArrayList<Integer>();
		List<Integer> lstI = null;
		Map<Integer, List<Integer>> mapI = new HashMap<Integer, List<Integer>>();
		lst.add(1);
		lst.add(1);
		lst.add(3);
		lst.add(4);
		lst.add(5);

//		for (int i = 0; i < lst.size(); i++) {
//			int a = lst.get(i);
//			if (!mapI.containsKey(lst.get(i))) {
//				lstI = new ArrayList<Integer>();
//				lstI.add(a);
//				mapI.put(a, lstI);
//			} else {
//				lstI = mapI.get(a);
//				lstI.add(a);
//				mapI.put(a, lstI);
//
//			}
//		}
//		
//		for (Integer integer : lst) {
//			
//			List<Integer> added = mapI.putIfAbsent(integer, new ArrayList<>(Arrays.asList(integer)));
//			if(added!=null) {
//				mapI.computeIfPresent(integer, (k, v) -> {
//					v.add(integer);
//					return v;
//					});
//			}
//		}
//		for (Map.Entry<Integer, List<Integer>> entry : mapI.entrySet()) {
//			System.out.println(entry.getKey() + " " + entry.getValue());
//		}
//		String word = "em la em";
//		String s="em";
//		Map<String, Integer> charCount = new HashMap();
//		for (String charr : word.split("[\r]")) {
//			if(s.equals(charr)) {
//				Integer added = charCount.putIfAbsent(charr, 1);
//				if (added != null)
//					charCount.computeIfPresent(charr, (k, v) -> v + 1);
//			}
//			
//		}
//		System.out.println(charCount);
		
//		UserDAO ud=new UserDAOImpl();
//		System.out.println(ud.getSaltPassword("admin"));
//		System.out.println(ud.isUsernameExist("admin"));
//		
//		int count = StringUtils.countMatches("String text", "char");
		String sa="ba";
		if(sa.isEmpty()) {
			System.out.println("a");
		}else if(sa.contains("a")) {
			System.out.println("b");
		}else if(sa.contains("b")) {
			System.out.println("c");			
		}else {
			System.out.println("d");
		}
	}
}

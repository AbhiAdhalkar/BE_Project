package Dbconnection;

public class UserInfo {
static private String srno;
static private int id;

public static int getId() {
	return id;
}

public static void setId(int id) {
	UserInfo.id = id;
}

public static String getSrno() {
	return srno;
}

public static void setSrno(String srno) {
	UserInfo.srno = srno;
}
}

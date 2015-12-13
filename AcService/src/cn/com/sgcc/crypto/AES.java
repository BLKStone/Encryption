package cn.com.sgcc.crypto;

import java.util.Properties;

public class AES {

	static 
    { 
		// check jre bits
		Properties props = System.getProperties();
		String bits=String.valueOf(props.get("sun.arch.data.model"));
		// user dir D:/Java/SgccUI
		String userdir = System.getProperty("user.dir");
		System.out.println("load dll: " + userdir + '/' + "Sgcc" + bits + ".dll");
		try {
			System.load(userdir + '/' + "Sgcc" + bits + ".dll");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("jre bits: " + bits);
			System.out.println("dll path: " + userdir);
		}
		//System.out.println(System.getProperty("java.library.path"));
    }
	
	public native static String encryptApi(String s);
	public native static String decryptApi(String s); 
	
	public static String encrypt(String s){
		return encryptApi(s);
		// seems nonsense below ~
		
		
//		StringBuilder sb = new StringBuilder();
//		
//	    int blocks = s.length()%32 == 0 ? s.length()/32 : 1 + s.length()/32;
//		
//	    String bs = null;
//	    for (int i=0;i<blocks;i++){
//			if (32*(i+1)<=s.length()){
//				bs = s.substring(32*i,32*(i+1));
//				//System.out.println(s.substring(32*i,32*(i+1)));
//				
//			} else {
//				bs = s.substring(32*i,s.length());
//				for(int j=0;j<32*(i+1)-s.length();j++){
//					bs = bs +'|';
//				}
//				//System.out.println(bs);
//			}
//			//System.out.println(bs);
//			//System.out.println(encryptApi(bs));
//			//sb.append(encryptApi(s.substring(32*i,32*(i+1))));
//			sb.append(encryptApi(bs));
//	    }
//	    //System.out.println(sb.toString());
//		return sb.toString();
	}
	
	public static String decrypt(String s){
		return decryptApi(s);
	}
	
	public static void main(String[] args) {
		
		
		System.out.println(AES.encrypt("1|CC495C74019886FB21B68E4DAE5373C5|49BDF7DB70F64AD0150AE5AF95E3B3E1|null|true|false|false|false|false|false|-1|-1"));
		for(int i=0;i<100;i++){
			AES.encrypt("3E1|null|true|false|false|false|");
		}
		// TODO Auto-generated method stub
		//System.out.println(decryptApi("579533533e2467d42389296ecf465e12bf89e187c89c04e2"));
//		System.out.println(encryptApi("caacccccccccccccccdddddddddddddddd"));
//		System.out.println(decryptApi(encryptApi("caacccccccccccccccddddddddddddddddcaacccccccccccccccdddddddddddddddd"))); 
	//	System.out.println(decryptApi("FFA203DE5B184AE1F8ECCD4B667ED69D3440E698C697B42CBB3E8D92F5D277756464"));
	System.out.println(decryptApi(encryptApi("1|CC495C74019886FB21B68E4DAE5373C5|49BDF7DB70F64AD0150AE5AF95E3B3E1|null|true|false|false|false|false|false|-1|-1")));
		//System.out.println(encryptApi("3E1|null|true|false|false|false|"));
	}

}

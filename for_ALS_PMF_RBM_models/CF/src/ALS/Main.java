package ALS;

import java.io.IOException;

public class Main {

	//userID，itemID starts from 0
	//userPath: userID，itemID，rate, with urserID sorted first then itemID
	//itemPath: itemID，userID，rate，with itemID sorted first then userID
	//testPath: userID，itemID，rate

	static String userPath   = "tr_1_u_s_8_0.csv";//"ratings9u_0_s.csv";
	static String itemPath   = "tr_1_i_s_8_0.csv";//"ratings9i_0_s.csv";
	static String testPath   = "va_1_s_1_0.csv";//"ratings1_0_s.csv";
	static String split_Sign = ",";
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		long startTime=System.nanoTime();
		try {
			ReadData.init(userPath, itemPath, testPath, split_Sign);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long midTime=System.nanoTime();
		System.out.println("The time of reading Train file： " + (midTime-startTime) + "ns");
		
		System.out.println("Begin ALS Training ! ! !");
		
		InitAls.initItemFeature();
		Als als = new Als();
		
		for(int i = 0; i < DataInfo.round; i++) {
			System.out.println("round " + i);
			als.genU();
			als.genM();
			System.out.println("RMSE = " + Rmse.calcRmse() + "\n");
			if(i == DataInfo.round-1) Rmse.writeCsvFile("als_pred.csv");
		}
		
		long endTime=System.nanoTime();
		System.out.println("The time of Training： " + (endTime-midTime) + "ns");
		System.out.println("Finish ALS Training ! ! !");
	}

}

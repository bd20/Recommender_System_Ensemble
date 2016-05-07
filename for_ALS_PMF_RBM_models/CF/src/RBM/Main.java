package RBM;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;


public class Main {

	//userID，itemID starts from 0
	//trainPath's form is userID，itemID，rate
	//testPath's form is userID，itemID，rate
	
	static String trainPath   = "./tr_1_u_s_8_0.csv";
	static String testPath    = "./va_1_s_1_0.csv";
	static String split_Sign  = ",";
	
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		
		for(int i = 0; i < DataInfo.numUsers; i++)
			DataInfo.TestSet[i] = new ArrayList<Integer>();
		
		ReadData.readTrainData(trainPath, split_Sign);
		ReadData.ReadTestData(testPath, split_Sign);
		
		System.out.println("Begin Rbm!!!");
		long start = System.nanoTime();
		RBM.initScore();
		RBM.train();
		long end   = System.nanoTime();
		System.out.println("Time: " + (end - start));
	}
	
	public static void Init(int loops, int featureNumber) {
		
	}

}

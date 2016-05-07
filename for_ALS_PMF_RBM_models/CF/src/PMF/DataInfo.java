package PMF;

import java.util.ArrayList;

public class DataInfo {
	
	public static int userNumber = 10000;
	
	public static int itemNumber = 10000;
	
	public static short featureNumber = 210;//350
	
	public static double alpha = 0.001;//0.001
	
	public static double lambda = 0.1;//0.01
	
	public static int  round = 160;//163
	
	public static double mean_rating = 0;
	
	public static int score_record = 0;
	
	public static double[][] userFeature = new double[userNumber][featureNumber];
	
	public static double[][] itemFeature = new double[itemNumber][featureNumber];
	
	public static int trainNumber = 3279759;//3279759;2623807
	public static int testNumber  = 500000;//500000	
	
	public static int[] user_record = new int[trainNumber];
	public static int[] item_record = new int[trainNumber];
	public static double[] rate_record = new double[trainNumber];
	public static ArrayList<Integer> userTest = new ArrayList<Integer>();
	public static ArrayList<Integer> itemTest = new ArrayList<Integer>();
	public static ArrayList<Double>  rateTest = new ArrayList<Double>();

}

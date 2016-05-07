package ALS;

import java.util.ArrayList;

import cern.colt.matrix.DoubleFactory1D;
import cern.colt.matrix.DoubleFactory2D;

public class DataInfo {
	
	public static int num_of_user = 10000;//49290;//
	
	public static int num_of_item = 10000;//139738;//
	
	public static int trainNumber = 3279759;//
	
	public static int featureNumber = 100;//20
	
	public static double lambda = 0.1;//0.1
	
	public static int round = 50;//25,50;
	
	public static DoubleFactory2D factory2D = DoubleFactory2D.dense;	

	public static DoubleFactory1D factory1D = DoubleFactory1D.dense;
	
	public static double[][] userFeature = new double[num_of_user][featureNumber];

	public static double[][] itemFeature = new double[num_of_item][featureNumber];
	
	public static int[][] userlist = new int[num_of_user][];
	public static int[][] itemlist = new int[num_of_item][];
	
	public static ArrayList<Integer> userTest = new ArrayList<Integer>();
	public static ArrayList<Integer> itemTest = new ArrayList<Integer>();
	public static ArrayList<Double>  rateTest = new ArrayList<Double>();

}

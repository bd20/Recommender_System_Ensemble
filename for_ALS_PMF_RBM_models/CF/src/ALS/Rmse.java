package ALS;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Iterator;

public class Rmse {
	
	public static double calcRmse() {
		double sum = 0;
		
		@SuppressWarnings("rawtypes")
		Iterator userIter = DataInfo.userTest.iterator();
		@SuppressWarnings("rawtypes")
		Iterator itemIter = DataInfo.itemTest.iterator();
		@SuppressWarnings("rawtypes")
		Iterator rateIter = DataInfo.rateTest.iterator();
		
		while(userIter.hasNext() && itemIter.hasNext() && rateIter.hasNext()) {
			int a = (Integer) userIter.next();
			int b = (Integer) itemIter.next();
			double c = (Double) rateIter.next();
			double predict = calcRate(a,b);
			
			if(predict < 1)
				predict = 1;
			if(predict > 10)
				predict = 10;
			
			double rate = predict - c;
			sum += rate * rate;

		}
		
		return Math.sqrt(sum / DataInfo.userTest.size());
	}
	
	private static double calcRate(int a, int b) {
		double rate = 0;
		
		for(int i = 0 ; i < DataInfo.featureNumber; i++) {
			//rate += (i+1) * DataInfo.userFeature[a][i] * DataInfo.itemFeature[b][i];
			rate += DataInfo.userFeature[a][i] * DataInfo.itemFeature[b][i];
		}
		return rate;
	}
	
	public static void writeCsvFile(String sFileName){
		try{
			@SuppressWarnings("rawtypes")
			Iterator userIter = DataInfo.userTest.iterator();
			@SuppressWarnings("rawtypes")
			Iterator itemIter = DataInfo.itemTest.iterator();
			@SuppressWarnings("rawtypes")
			Iterator rateIter = DataInfo.rateTest.iterator();
			
			while(userIter.hasNext() && itemIter.hasNext() && rateIter.hasNext()) {
			
				int userId = (Integer) userIter.next();
				int itemId = (Integer) itemIter.next();
				double rating = calcRate(userId,itemId);
			
			
				Writer writer = new BufferedWriter(new FileWriter(sFileName, true));
				
				writer.append(Integer.toString(userId));
			    writer.append(',');
			    writer.append(Integer.toString(itemId));
			    writer.append(',');
			    writer.append(Double.toString(rating));
			    writer.append('\n');
			    
			    writer.flush();
			    writer.close();
			}
		}
		catch(IOException e)
		{
		     e.printStackTrace();
		} 
	}
}
package RBM;

import java.io.FileWriter;
import java.io.IOException;
import java.io.BufferedWriter;
import java.io.Writer;

public class WriteData {
	public static void writeCsvFile(String sFileName, int userId, int itemId, double rating){
		try{
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
		catch(IOException e)
		{
		     e.printStackTrace();
		} 
	}
	
	public static void writeCsvFile_1(String sFileName, double rating){
		try{
			FileWriter writer = new FileWriter(sFileName);
			
			writer.append(Double.toString(rating));
		    
		    writer.flush();
		    writer.close();
		}
		catch(IOException e)
		{
		     e.printStackTrace();
		} 
	}
}

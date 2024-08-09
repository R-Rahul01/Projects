package com.voidmain.service;

import java.time.LocalDate;
import java.time.Period;
import java.util.Date;

public class AppService {
	
	public static long find(Date date1, Date date2)   
    {   
        LocalDate first_date = LocalDate.of(date1.getYear(),date1.getMonth(),date1.getDate());   
        LocalDate second_date = LocalDate.of(date2.getYear(),date2.getMonth(),date2.getDate());   
        
	    Period difference = Period.between(first_date, second_date);
	    
	    System.out.println("Differrence:"+difference.getDays());
	    
	    return  difference.getDays();
    }
}

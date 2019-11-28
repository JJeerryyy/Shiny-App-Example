function(){
	tabPanel("About",
		HTML("
        <p >The method I have used is to convert Rdata to csv with the code such as:</p>
        <p >write.csv(MaxTemp, file=MaxTemp.csv)</p>
		    <p >Likewise, I have got 3 csv files for the lab and they are MaxTemp.csv, MinTemp.csv, Co2North.csv.</p>
		"),
		value="about"
	)
}


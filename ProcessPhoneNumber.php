<?php 
	/**
	 * ProcessPhoneNumber page to run logic of Phone number processing
	 * @required PhoneNumberFormatter.php library
	 */
	require_once('library/PhoneNumberFormatter.php');
	
	/**
	 * Phone Number variable to use as Input
	 * @var String
	 */
	$phoneNumber = '6658213547';
	
	/**
	 * Logic execution with exception handling
	 * @var Object for PhoneNumberFormatter class
	 */
	try{
		$objPhoneNumberFormatter = new PhoneNumberFormatter($phoneNumber);
		
		/**
	     * Process method getFormatted to retrieve Formatted Phone Number
	     */
		echo $objPhoneNumberFormatter->getFormatted();		
	} catch(Exception $e){
	
		/**
	     * Throw an exception
	     * @var String
	     */
		echo ($e->getMessage());
	}
<?php
	/**
	 * UrlOperations page to run logic of getting query string parameters from URL and merge into an Array
	 * @required UrlParser.php library
	 */
	require_once('library/UrlParser.php');
	
	/**
	 * Define variables to use as Input
	 * @var String $strPrimaryURL
     * @var String $strSecondaryURL		
	 */
	$strPrimaryURL = 'https://www.google.com/#q=indian+string+instrument';
	$strSecondaryURL = 'https://claim.phoneclaim.com/vzw/iweb/#/claim?carrierCode=Verizon&UserAction=New&Culture=en-US&icid=in-vzwclaim';
	
	/**
	 * Logic execution with exception handling
	 * @var Object for UrlParser class
	 */
	try{
		$objUrlParser = new UrlParser($strPrimaryURL, $strSecondaryURL);
		
		/**
	     * Process the method getMergedArrayFromURLs to retrieve merged array of Query String parameters
		 * @var Array
	     */
		$arrResult = $objUrlparser->getMergedArrayFromURLs();
		
		/**
	     * Print an Array with Result
		 * @var Array
	     */
		print_r($arrResult);
	} catch (Exception $e){
	
		/**
	     * Throw an exception
	     * @var String
	     */
		echo ($e->getMessage());
	}	
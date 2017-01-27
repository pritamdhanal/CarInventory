<?php

    /**
	 * UrlParserTest class for Run Unit test for Valid URL Query string array output
	 */
	class UrlParserTest extends \PHPUnit_Framework_TestCase
	{
	    /** 
		 * Variable to hold Object of UrlParser class 
		 * @var string
		 */
        private $objUrl;
        
		/** 
		 * setUp: Default method to perform operation on class initialization 
		 */
		public function setUp(){ 
		    $this->objUrl = new UrlParser('https://www.google.com/#q=test', 'http://test.com');
		}
		
		/** 
		 * tearDown: method used to unset objPhone object, once test case executed 
		 */
        public function tearDown(){ 
		    unset($this->objUrl);
		}
		
		/** 
		 * Test Case: testForValidParameterCounts - to check array count gives result expected count
		 * @return boolean
		 */
		public function testForValidParameterCounts(){			
			$this->assertCount( 1, $this->objUrl->getMergedArrayFromURLs() );
		}
		
		/** 
		 * Test Case: testForFailureEmptyArray - to check result fails over empty array check
		 * @return boolean
		 */
		public function testForFailureEmptyArray(){
			$this->assertEmpty( $this->objUrl->getMergedArrayFromURLs() );
		}
	}
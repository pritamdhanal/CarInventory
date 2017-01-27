<?php
    /**
	 * PhoneNumberFormatterTest class for Run Unit test for Valid Phone Number and formatted phone number
	 */
	class PhoneNumberFormatterTest extends \PHPUnit_Framework_TestCase
	{
	    /** 
		 * Variable to hold Object of PhoneNumberFormatterTest class 
		 * @var string
		 */
        private $objPhone;
	    
		/** 
		 * setUp: Default method to perform operation on class initialization 
		 */
        public function setUp(){ 
		    $this->objPhone = new PhoneNumberFormatter('3265986532');	
		}
		
		/** 
		 * tearDown: method used to unset objPhone object, once test case executed 
		 */
        public function tearDown(){ 
		    unset($this->objPhone);
		}
        
		/** 
		 * Test Case: testForValidPhoneNumber - to check number matches valid phone number format
		 * @return boolean
		 */
		public function testForValidPhoneNumber(){
			$this->assertEquals( $this->objPhone->getNumber(), '3265986532' );
		}
		
		/** 
		 * Test Case: testForInvalidPhoneNumber - to check invalid phone number matches phone number format
		 * @return boolean
		 */
		public function testForInvalidPhoneNumber(){
			$this->assertEquals( $this->objPhone->getNumber(), false );
		}
		
		/** 
		 * Test Case: testForFormattedPhoneNumber - to check given phone number matches formatted phone number
		 * @return boolean
		 */
		public function testForFormattedPhoneNumber(){
			$this->assertEquals( $this->objPhone->getFormatted(), '232-659-8256' );
		}
	}
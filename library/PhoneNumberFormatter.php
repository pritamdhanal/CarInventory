<?php
	/**
	 * PhoneNumberFormatter class for performing Phone Formatting operations
	 */
	class PhoneNumberFormatter {
	
		/**
         * Variable to carry Phone number throughout class operations 
		 * @access private
         * @var String
         */
		private $phoneNumber;
		
		/**
         * The class constructor
		 * Assigns value for phone number if valid format
         */
		public function __construct($phoneNumber){
			if($this->isValid($phoneNumber)){
				$this->setNumber($phoneNumber);
			}
		}
		
		/**
	     * Set the Phone Number var
	     *
	     * @param string $phoneNumber
	     */
		private function setNumber($phoneNumber){
			$this->phoneNumber = $phoneNumber;
		}
		
		/**
	     * Function to get Phone Number
	     *
	     * This function returns {@link $phoneNumber}
	     * 
	     * @see setNumber(), $phoneNumber
	     * @return string
	     */
		public function getNumber(){
			return $this->phoneNumber;
		}
		
		/**
	     * Function to check valid 10 digit Phone Number
	     *
	     * This function returns boolean Or throws an exception
		 * @return boolean
	     */
		private function isValid($phoneNumber){
			try{
				if(empty($phoneNumber)){
					throw new Exception('Input number cannot be empty');
				} else {
					if(preg_match("/^[0-9]{10}$/",$phoneNumber)){
						return true;
					} else {
						throw new Exception('Invalid Number');
					}
				}				
			} catch(Exception $e){
				echo ($e->getMessage());
			}			
		}
		
		/**
	     * Function to get formatted Phone Number xxx-xxx-xxxx
	     * 
	     * @see setNumber(), $phoneNumber
	     * @return string
	     */
		public function getFormatted(){		
			return preg_replace("/^(\d{3})(\d{3})(\d{4})$/", "$1-$2-$3", $this->getNumber());
		}
	}
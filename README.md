  - replace 'CompanyID' with your Epicor / Kinetic ERP COmpany ID 
  - use at your own risk: this writes to your database and no warranty or fitness for any particualr purpose is expressed or implied!

Step 1: Identify and return excess KB materials

  - run query 01
  - copy results into text-formatted spreadsheet
  - upload spreadsheet into DMT program "return material"
  
Step 2: Identify and re-open KB jobs that created the excess material

  - run query 02
  - copy results into text-formatted spreadsheet
  - upload spreadsheet into DMT program "Job Closing"
  
Step 3: return KB job materials to inventory

  - this assumes you CAN return the material physically, and it has not been irrevocably transformed
  - run query 03
  - copy results into text-formatted spreadsheet
  - upload spreadsheet into DMT program "return material"
  
Step 4: re-close the affected KB jobs

  - run query 04
  - copy results into text-formatted spreadsheet
  upload spreadsheet into DMT program "Job Closing"
  
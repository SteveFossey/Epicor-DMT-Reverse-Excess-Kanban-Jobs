Scroll to the bottom for license information

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


**Queries to generate DMT upload templates to identify and reverse excess-issued kanban receipt material and job materials**
	
	
    Copyright (C) <2021>  <Steve Fossey>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License version 2 as published by
    the Free Software Foundation.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

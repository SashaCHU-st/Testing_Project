# Testing_Project
Final group work for course testing/robotic tool


Task given by teacher:
Product to be tested: https://www.verkkokauppa.com/

Web application is made in way that contents of page are loaded one after other. When you are doing test robot, you might need Sleep keyword for waiting content to be loaded. 
Create 10 test cases for product (there are 5 mandatory test cases listed in this document). Group need to design and implement test cases with Robot Framework. Check how to do good test cases from lecture materials.

Next 5 test cases are mandatory:


1. Does all product categories have an icon (Tuotealueet)

2. Does all product categories have an "landing page"

3.Test search feature from main page (search keyword is: ps5)

-robot takes element screenshot from first product

-robot drills down to product page

-robot checks that there is something in product page what matches to keyword what was used in search

4.Robot takes element screenshot from product page and compares it to picture taken in step 3. Is there differences?

5. Can you found topics "Esittely" and "Lisätiedot" from product page.

+Bug report

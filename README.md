![header_photo](readme_header.png)


# Rewardify

<br />

# Group 4 - Project 3

<br />

## Group members

<br />

* Jonathan Coleman
* Emmanuel Joseph
* Noelia Nievas
* Akshay vas Nyamala
* Terence Schultz
<br />
<br />

## Project Description

<br />
The StarbucksToken is a tokenized rewards program that allows companies to create custom-branded rewards tokens that can be distributed to customers upon purchase. Customers can then exchange these tokens for tokens from other participating companies or use them to make purchases at their stores. The program is designed to provide customers with more flexible and transparent rewards options, while also benefiting participating companies through increased customer engagement and loyalty. By leveraging the power of blockchain technology, the program can provide greater security, transparency, and decentralization compared to traditional rewards programs.

The StarbucksToken contract uses the BEP-20 standard to create a tokenized rewards program for Starbucks. 

This token is named "Starbucks Token," with the symbol "SBUX".

## Benefits

### Custom Branding

Companies can create their own unique token with their branding, allowing for a more personalized and engaging experience for customers.

### Cross-Promotion

Allowing customers to exchange tokens for other company's tokens can encourage cross-promotion between different businesses, potentially driving more traffic to each other's stores.

### Security

The use of blockchain technology can provide transparency and security for all transactions, which can be reassuring for customers and companies alike.

### Customer Engagement

By incentivizing purchases with the promise of rewards tokens, customers may be more likely to make repeat purchases and engage with the company's brand.

## How it works

Program starts by receving the user input, in this example we have took companies inforamtion as starbucks.

***Google doc link***

### Creation of smart contract

Take the user input from the form and use the given paremeters to create the smart contract for launching it for the client's company. In this case we have used "Starbucks Token," with the symbol "SBUX".

### Functionalities

Transfer function - Allows users to send Starbucks tokens to other users. The fee setup for every transaction for this contract is 1% which directly goes to a fee collector address.

Approve function - Allows users to approve other users to spend a specified amount of tokens on their behalf.

Transferfrom Function - Allows the users to actually spend these tokens  - ecosystem is created.

In addition to these functions, the contract also has a balanceOf function that allows users to check their token balance and an allowance function that allows users to check how much of their tokens have been approved for spending by others.

## Distribution of Tokens

Once the smart contract is deployed and the token is created, the initial supple of tokens are sent to the client company's master wallet. The company can then distribute the tokens to their customers as a reward at their discretion.

## Future Developments

We want to create a common eco-system for our where, customers can exchange their tokens for various other companies - who have patnered with us.
We also want to create a front end website using react where we can eliminate the google forms manual process
















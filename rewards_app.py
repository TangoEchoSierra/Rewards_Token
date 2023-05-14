import os
import json
from web3 import Web3
from pathlib import Path
from dotenv import load_dotenv
import streamlit as st

load_dotenv(".env")

# Define and connect a new Web3 provider
w3 = Web3(Web3.HTTPProvider(os.getenv("WEB3_PROVIDER_URI")))

################################################################################
# Contract Helper function:
# 1. Loads the contract once using cache
# 2. Connects to the contract using the contract address and ABI
################################################################################

# Cache the contract on load
@st.cache_resource()
# Define the load_contract function
def load_contract():

    # Load Rewards ABI
    with open(Path('./contracts/compiled/rewards_abi.json')) as f:
        rewards_abi = json.load(f)

    # Set the contract address (this is the address of the deployed contract)
    contract_address = os.getenv("SMART_CONTRACT_ADDRESS")

    # Get the contract
    contract = w3.eth.contract(
        address=contract_address,
        abi=rewards_abi
    )
    # Return the contract from the function
    return contract


# Load the contract
contract = load_contract()


################################################################################
# Customer Rewards
################################################################################

accounts = w3.eth.accounts
account = accounts[0]
customer_account = st.selectbox("Select Account", options=accounts)
rewards_details = st.text_input("Rewards Token Details", value="Starbucks Rewards")
if st.button("Select Rewards"):
    contract.functions.awardCertificate(customer_account, rewards_details).transact({'from': account, 'gas': 1000000})

################################################################################
# Display Rewards
################################################################################
rewards_id = st.number_input("Enter a Rewards Token ID to display", value=0, step=1)
if st.button("Display Rewards"):
    # Get the reward's owner
    rewards_owner = contract.functions.ownerOf(rewards_id).call()
    st.write(f"The rewards were transfered to {rewards_owner}")

    # Get the reward's metadata
    rewards_uri = contract.functions.tokenURI(rewards_id).call()
    st.write(f"The reward's tokenURI metadata is {rewards_uri}")

import streamlit as st
import pandas as pd
import plotly.express as px

# Page configuration
st.set_page_config(page_title="Retail Sales Dashboard", layout="wide")

# Load data
df = pd.read_csv('../data/superstore.csv')
df['Order Date'] = pd.to_datetime(df['Order Date'], format='%d/%m/%Y')

# Title
st.title("📊 Retail Customer Analytics Dashboard")
st.markdown("Sales performance analysis for a global retail superstore")

# Display raw data preview (temporary, just to test)
st.subheader("Data Preview")
st.dataframe(df.head())
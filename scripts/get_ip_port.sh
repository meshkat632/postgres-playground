#!/bin/bash

# Step#0 - Magical list of ip addresses and ports which cannot exist in terraform
declare -A test_var

test_var["dev"]="10.0.0.1:8081"
test_var["qa"]="10.0.0.2:8082"
test_var["uat"]="10.0.0.3:8083"
test_var["stage"]="10.0.0.4:8084"
test_var["prod"]="10.0.0.5:8085"

# Step#1 - Parse the input
eval "$(jq -r '@sh "p_env=\(.p_env)"')"


# Step#2 - Extract the ip address and port number based on the key passed
url_str=${test_var[$p_env]}
arr=(${url_str//:/ })
IP_ADDRESS=${arr[0]}
PORT_NUM=${arr[1]}

# Step#3 - Create a JSON object and pass it back
jq -n --arg ip_address "$IP_ADDRESS" \
      --arg port_num "$PORT_NUM" \
      '{"ip_address":$ip_address, "port_num":$port_num}'
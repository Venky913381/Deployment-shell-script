#!/bin/bash
filename="deployment.yml"

if [ -f "$filename" ]; then

    echo "The deployment file is exits"

\
  
    kubectl apply -f deployment.yml


else 
    echo "File does not exist. Script terminated."
    exit 1
fi

if [ $? -eq 0 ]; then

    echo "The deployment is succesfull. Proceeding to the next command."

    kubectl apply -f service.yml
    if [ $? -eq 0 ]; then

    echo "The service has created successfully."

    else
        echo "service creation failed."
        exit 1
    fi
else 

echo "deployment has failed"
exit 1
fi

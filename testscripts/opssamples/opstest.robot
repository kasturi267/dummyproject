*** Settings ***
Library    OperatingSystem
Library    String
Library    Collections
Library    JSONLibrary
 
*** Test Cases ***
Reading from Text File
    ${str}=    Get File    ${CURDIR}/output.txt
    Should Contain    ${str}    successfully completed
 
Reading data from CSV File
    ${FILE_CONTENT}=    Get File    ${CURDIR}/inputData.csv
    Log    File Content: ${FILE_CONTENT}
    @{LINES}=    Split to Lines and Remove Header    ${FILE_CONTENT}
    ${SUM}=    Calculate Sum From List    ${LINES}
    Log    Final SUM: ${SUM}

# Create Employee Json File
#     # Define the file path
#     ${jsonFile}=    Set Variable    ${CURDIR}/employee.json
 
#     # Create JSON data
#     ${jsonData}=    Create Dictionary
#     Set To Dictionary    ${jsonData}    id=101
#     Set To Dictionary    ${jsonData}    name=Alice Johnson
#     Set To Dictionary    ${jsonData}    department=Engineering
#     Set To Dictionary    ${jsonData}    role=Software Developer
#     Set To Dictionary    ${jsonData}    salary=75000
 
#     # Write JSON data to the file
#     Dump JSON To File    ${jsonFile}    ${jsonData}
#     Log    Employee JSON file created at: ${jsonFile}
 
#     ${updatedJsonData}    Update Value To Json    ${jsonData}    salary    90000
#     Dump JSON To File    ${jsonFile}    ${updatedJsonData}

#     Should Have Value In Json    ${updatedJsonData}    department 
# 

Create Employee Json File
    # Define the file path
    ${jsonFile}=    Set Variable    ${CURDIR}/employee.json
 
    # Create JSON data with nested dictionary
    ${jsonData}=    Create Dictionary
    Set To Dictionary    ${jsonData}    id=101
    Set To Dictionary    ${jsonData}    name=Alice Britto
    Set To Dictionary    ${jsonData}    department=Engineering
    Set To Dictionary    ${jsonData}    role=Software Developer
    Set To Dictionary    ${jsonData}    salary=90000
 
    ${address}=    Create Dictionary
    ...    street=123 Main St
    ...    city=Springfield
    ...    state=IL
    ...    zip=62701
    Set To Dictionary    ${jsonData}    address=${address}
 
    # Write JSON data to the file
    Dump JSON To File    ${jsonFile}    ${jsonData}
    Log    Employee JSON file created at: ${jsonFile}
 
    # Optional: Validate or log the contents
    Should Have Value In Json    ${jsonData}    department

*** Keywords ***
Split to Lines and Remove Header
    [Arguments]    ${FILE_CONTENT}
    @{LINES}=    Split To Lines    ${FILE_CONTENT}
    Remove From List    ${LINES}    0
    RETURN    @{LINES}
 
Calculate Sum From List
    [Arguments]    ${LIST}
    ${RESULT}=    Set Variable    0
    FOR    ${LINE}    IN    @{LIST}
        Log    ${LINE}
        @{COLUMNS}=    Split String    ${LINE}    separator=,
        ${VALUE}=    Get From List    ${COLUMNS}    2
        Log    ${VALUE}
        ${RESULT}=    Evaluate    ${RESULT}+${VALUE}
    END
    RETURN    ${RESULT}



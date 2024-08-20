MODULE="Modules/BookAPI/Sources/BookAPI"

openapi-generator generate -i "BookApi.yaml" -g swift5 -o "BookApi"
rm -r $MODULE""*
cp -R "BookApi/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "BookApi"


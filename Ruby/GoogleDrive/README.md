# Using [Google Drive API](https://developers.google.com/)
- I'm using .env file to serve secret keys and vars
- sheets.rb
- [Google Sheets API](https://developers.google.com/sheets/api/quickstart/ruby)

```
# You can get the sheet id straight from the URL
# Also you'll need to select range out data from the sheet
machines_sheet = CompanyAdmin::Sheets.new( ENV['STATUS_CSV_ID'], 'A2:B' )
machines = machines_sheet.get_data
=> [['name1', '12.12.12.12'], ['name2','10.10.10.10']]
```

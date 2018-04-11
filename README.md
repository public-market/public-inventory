# Open Inventory - Public Connection Platform

[![pipeline status](https://gitlab.com/publicmarket/open-inventory/badges/master/pipeline.svg)](https://gitlab.com/publicmarket/open-inventory/commits/master)
[![coverage report](https://gitlab.com/publicmarket/open-inventory/badges/master/coverage.svg)](https://gitlab.com/publicmarket/open-inventory/commits/master)

A central inventory and orders clearinghouse that receives and openly publishes data on who is selling what, at what price, anywhere in the world. It securely communicates orders when an item is purchased.

## Technical Details

Open Inventory is Rails API application provides the following JSON:API (http://jsonapi.org/) endpoints:

`GET /items`
* Get open inventory items

`GET /items/:id`
* Get open inventory item by SKU


## LICENSE

Copyright (c) 2018 Abundance Labs, Inc., released under the LGPL

# Open Inventory - Public Connection Platform

[![pipeline status](https://gitlab.com/publicmarket/open-inventory/badges/master/pipeline.svg)](https://gitlab.com/publicmarket/open-inventory/commits/master)
[![Maintainability](https://api.codeclimate.com/v1/badges/00a4834f831c8e032c30/maintainability)](https://codeclimate.com/github/public-market/open-inventory/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/00a4834f831c8e032c30/test_coverage)](https://codeclimate.com/github/public-market/open-inventory/test_coverage)

A central inventory and orders clearinghouse that receives and openly publishes data on who is selling what, at what price, anywhere in the world. It securely communicates orders when an item is purchased.

## Technical Details

Open Inventory is Rails API application provides the following JSON:API ([http://jsonapi.org/](http://jsonapi.org/)) endpoints:

`GET /items`

* Get open inventory items
* Items are filterable by `title` filter: `/items?filter[title]=example`

`GET /items/:id`

* Get open inventory item by SKU

`GET /categories`

* Get open inventory categories

`GET /categories/:id`

* Get open inventory category by permalink

`GET /categories/:id/relationships/parent`

* Get parent category relationship

`GET /categories/:id/parent`

* Get parent category

`GET /categories/:id/relationships/children`

* Get child categories relationship

`GET /categories/:id/children`

* Get child categories

`GET /categories/:id/relationships/items`

* Get category inventory items relationship

`GET /categories/:id/items`

* Get category related inventory items

## LICENSE

Copyright (c) 2018 Abundance Labs, Inc., released under the LGPL

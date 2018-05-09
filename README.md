![Public Market Foundation](.github/public_market_readme_banner_1024_big.png)

# Public Inventory

[![pipeline status](https://gitlab.com/publicmarket/open-inventory/badges/master/pipeline.svg)](https://gitlab.com/publicmarket/open-inventory/commits/master)
[![Maintainability](https://api.codeclimate.com/v1/badges/8b9d30d3ccf34dc441bb/maintainability)](https://codeclimate.com/github/abundance-labs/open-inventory/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/8b9d30d3ccf34dc441bb/test_coverage)](https://codeclimate.com/github/abundance-labs/open-inventory/test_coverage)

Public Inventory receives and openly exposes data on which seller is selling what products, at what prices, anywhere in the world. Anyone can create a personalized product inventory listing for any kind of product they would like to sell. Public Inventory thus enables anyone to create and populate an online store, select the products they would like to sell, and not concern themselves with holding inventory, or managing order fulfillment. Sellers benefit from having their inventory available to be listed for sale on many more online storefronts than they might manage themselves or through their use of a multiple listing service provider, thus broadening the exposure of their products to a larger audience.

## Technical Details

Open Inventory is a Rails API application providing the following JSON:API ([http://jsonapi.org/](http://jsonapi.org/)) endpoints:

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

## Contributing

See [how you can help](.github/CONTRIBUTING.md).

## Code of Conduct

Public Market Foundation [Code of Conduct](.github/CODE_OF_CONDUCT.md).

## LICENSE

Copyright (c) 2018 Public Market Foundation, released under the LGPL

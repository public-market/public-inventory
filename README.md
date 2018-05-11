![Public Market Foundation](.github/public_market_readme_banner_1024_big.png)

# Public Inventory

[![pipeline status](https://gitlab.com/publicmarket/open-inventory/badges/master/pipeline.svg)](https://gitlab.com/publicmarket/open-inventory/commits/master)
[![Maintainability](https://api.codeclimate.com/v1/badges/2a08e6ac45bd2fce6395/maintainability)](https://codeclimate.com/github/public-market-foundation/public-inventory/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2a08e6ac45bd2fce6395/test_coverage)](https://codeclimate.com/github/public-market-foundation/public-inventory/test_coverage)

#### A public transparent inventory database to replace the closed data architectures of private marketplaces.

---


**Public Market** is restoring the Commercial Commons by building 
an open, transparent, and competitive architecture 
for marketplace eCommerce.

**eCommerce Is Broken**

In less than two decades, a handful of private eCommerce platforms 
have grown to account for over half of online retail sales. 
The exorbitant fees and commissions they charge force sellers 
to drive up prices, ultimately hurting consumers.

**A Decentralized Alternative**

We’re leveraging blockchain technology to replace these closed, private, 
rent-extracting intermediaries with an open architecture and 
protocol for eCommerce. The Public Market protocol radically lowers costs for both buyers and sellers while requiring no tradeoffs with regards to convenience or risk.


---

<p align="center">
  <img src=".github/PMFP.png?raw=true" alt="PMF Protocol"/>
</p>

---

## Information

This is just a "mirror" while we are in initial development. - We don't work with pull requests on GitHub at this time but will in the near future. Please contact us at team@publicmarket.io if you would like to contribute. We welcome inquiries with @mention to an admin on our [Telegram Group](https://t.me/publicmrkt)

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

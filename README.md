### Basic Yelp client

This is a headless example of how to implement an OAuth 1.0a Yelp API client. The Yelp API provides an application token that allows applications to make unauthenticated requests to their search API.

Time spent: 5 hours spent in total

Completed user stories:

* [ ] Search results page

  * [x] Table rows should be dynamic height according to the content height.

  * [x] Custom cells should have the proper Auto Layout constraints.

  * [x] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).

    * Hint: This is just a UISearchBar that is set as the navigationItem.titleView

  * [x] Optional: Infinite scroll for restaurant results

  * [x] Optional: Implement map view of restaurant results

* [ ] Filter page. Unfortunately, not all the filters in the real Yelp App, are supported in the Yelp API.

  * [ ] The filters you should actually have are: category, sort (best match, distance, highest rated), distance, deals (on/off).

  * [ ] The filters table should be organized into sections as in the mock.

  * [ ] You can use the default UISwitch for on/off states. Optional: implement a custom switch

  * [ ] Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.

  * [ ] Optional: Distance filter should expand as in the real Yelp app.

  * [ ] Optional: Categories should show a subset of the full list with a "See All" row to expand.

    * [ ] A formatted list of categories available in the Public API can be found here.

  * [ ] Optional: Implement the restaurant detail page.

Notes:

Spent some time making the UI work across multiple phone resolutions by playing around with the RelativeLayout.

- Installation instructions

Walkthrough of all user stories:

![Video Walkthrough](anim_rotten_tomatoes.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

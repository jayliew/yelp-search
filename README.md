### Basic Yelp client

This is a headless example of how to implement an OAuth 1.0a Yelp API client. The Yelp API provides an application token that allows applications to make unauthenticated requests to their search API.

This is an Android demo application for displaying the latest box office movies using the [RottenTomatoes API](http://www.rottentomatoes.com/). See the [RottenTomatoes Networking Tutorial](http://guides.thecodepath.com/android/RottenTomatoes-Networking-Tutorial) on our cliffnotes for a step-by-step tutorial.

Time spent: 5 hours spent in total

Completed user stories:

* [ ] Search results page

  * [ ] Table rows should be dynamic height according to the content height.

  * [ ] Custom cells should have the proper Auto Layout constraints.

  * [ ] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).

    * Hint: This is just a UISearchBar that is set as the navigationItem.titleView

  * [ ] Optional: Infinite scroll for restaurant results

  * [ ] Optional: Implement map view of restaurant results

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

Walkthrough of all user stories:

![Video Walkthrough](anim_rotten_tomatoes.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

Add:
- Installation instructions
- A description of the project
- Add a LICENSE to the repository
- Add a acknowledging the open-source libraries used

### Next steps

- Check out `BusinessesViewController.swift` to see how to use the `Business` model.

### Sample request

**Basic search with query**

```
Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
    self.businesses = businesses

    for business in businesses {
        print(business.name!)
        print(business.address!)
    }
})
```

**Advanced search with categories, sort, and deal filters**

```
Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in

    for business in businesses {
        print(business.name!)
        print(business.address!)
    }
}
```

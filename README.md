# TO DO
- Remove the hosts_events field from the Amenities view and put it in its own section
- Fix the password confirmation bug (it doesn't require a confirmation!) in the devise view
- Pricing will need to be much more flexible.
- Eventually, the images will be stored on Amazon S3.
- Refactor the active logic on the _venue_menu page and put it inside a controller
- Make geocoder.rb flexible so that you can easily change from km to miles depending on your configuration
- Make the AJAX calls in the search function indipendent from pressing Search

# VENUE MODEL
The current state of the Venue Model

VENUE
    listing_name: string -
    venue_type: private home, concert hall, church, garage, recording studio, rehearsal venue -
    description: text -
    address: string -
    max_guests: integer -
    instruments: none, piano, drums, organ, harp, double bass -
    preferred_style: any, classical, chamber, rock, metal, pop -
    hosts_events: boolean
    has_recording: boolean -
    has_wifi: boolean  -
    has_heating: boolean -
    has_conditioning: boolean -
    price: integer -
    active: boolean -
    user: references


# TO DO
- Remove the hosts_events field from the Amenities view and put it in its own section
- Fix the password confirmation bug (it doesn't require a confirmation!) in the devise view
- Pricing will need to be much more flexible.

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


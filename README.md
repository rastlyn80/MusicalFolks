# VENUE MODEL

The current state of the Venue Model

VENUE
    listing_name: string
    type: private home, concert hall, church, garage, recording studio, rehearsal venue
    description: text
    address: string
    max_guests: integer
    instruments: none, piano, drums, organ, harp, double bass
    preferred_style: any, classical, chamber, rock, metal, pop
    hosts_events: boolean
    has_recording: boolean
    has_wifi: boolean
    has_heating: boolean
    has_conditioning: boolean
    price: integer
    active: boolean
    user: references


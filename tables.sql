CREATE TABLE IF NOT EXISTS host_dim (
  host_id bigint NOT NULL PRIMARY KEY,
  host_name varchar(100),
  host_since date,
  host_location varchar(50),
  host_response_time varchar(25),
  host_response_rate decimal(3,2),
  host_acceptance_rate decimal(3,2),
  host_total_listings smallint,
  host_is_superhost bool,
  host_identity_verified bool
);

CREATE TABLE IF NOT EXISTS amenity_dim (
  amenity_id SERIAL PRIMARY KEY,
  amenity TEXT UNIQUE
);

CREATE TABLE IF NOT EXISTS listing_amenity_brg (
  amenity_id integer,
  listing_id bigint,
  PRIMARY KEY (amenity_id, listing_id)
);

CREATE TABLE IF NOT EXISTS listing_fact (
    listing_id bigint NOT NULL PRIMARY KEY,
    minimum_nights integer,
    maximum_nights integer,
    has_availability bool,
    instant_bookable bool,
    price money,
    accommodates smallint,
    number_of_reviews integer,
    review_scores_rating decimal(3,2),
    review_scores_accuracy decimal(3,2),
    review_scores_cleanliness decimal(3,2),
    review_scores_checkin decimal(3,2),
    review_scores_communication decimal(3,2),
    review_scores_location decimal(3,2),
    review_scores_value decimal(3,2),
    neighbourhood varchar(50),
    beds smallint,
    bedrooms smallint,
    bathrooms decimal(5,1),
    bathroom_type varchar(25),
    latitude  decimal(9,6),
    longitude decimal(9,6),
    property_type varchar(100),
    room_type varchar(50),
    host_id bigint NOT NULL,
    CONSTRAINT fk_host FOREIGN KEY (host_id)
    REFERENCES host_dim(host_id)
);

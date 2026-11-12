-- Find OpenStreetMap nodes tagged as veterinary
-- within the selected latitude/longitude bounding box.
SELECT *
FROM planet
WHERE type = 'node'
  AND tags['amenity'] IN ('veterinary')
  AND lat BETWEEN -27.8 AND -27.3
  AND lon BETWEEN 152.2 AND 153.5;

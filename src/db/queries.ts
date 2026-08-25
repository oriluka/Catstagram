// query library, may be moved to routes later
//JWT for authentication
//look into how to infinite scroll and how to query database to enable that functionality 

/* --------- FEED / Photos ------------*/
// display home feed of cat photos in descending order by date created
"SELECT * FROM photos ORDER BY created_at DESC LIMIT 100"

// Display user's posted photos 
"SELECT * from photos WHERE posterID = ? ORDER BY created_at DESC LIMIT 100"

// Display tags alongside photo
"SELECT tagName FROM tags WHERE photoID = ?"
// Search photos via tags
"SELECT photoID FROM tags WHERE tagName = ?"

// Create Photo
"INSERT INTO photos (link, catUID, posterID) VALUES (?, ?, ?)"

/* --------- USERS ------------*/
// get user info by userID 
"SELECT * FROM users WHERE userID =?"
// Update user info
"UPDATE users SET displayName = ?, displayPic = ?, tag =?, email = ?, password = ? WHERE userID = ?"
// CREATE user 
"INSERT INTO users (userID, displayName, displayPic, userName, tag, email, password) VALUES (?, ?, ?, ?, ?, ?, ?)"

/* --------- CATS ------------*/
// get cat info
"SELECT * FROM cats WHERE catID = ?"
// update cat info
"UPDATE cats SET catName = ?, ownerID = ?, likes = ?, dislikes = ? WHERE catID = ?"
// get cat photos of one type of cat 
"SELECT * FROM photos WHERE catUID = ? ORDER BY created_at DESC LIMIT 100"

/* --------- LIKES ------------*/
// ADD like
"INSERT INTO favorites (userID, photoID) VALUES (?, ?)"

// REMOVE like
"DELETE FROM favorites WHERE userID = ? AND photoID = ?"

// Get all likes from a user 
"SELECT * FROM favorites WHERE userID =?"

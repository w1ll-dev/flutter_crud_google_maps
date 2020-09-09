const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 5000;
const routes = require('./routes');

app.use(express.json());
app.use(cors());
app.use(routes);

// not found error
app.use((req, res, next) => {
    const error = new Error('Not Found');
    error.status = 404;
    next(error);
})

// catch all errors
app.use((error, req, res, next) => {
    res.status(error.status || 500);
    res.json({ error: error.message });
})

app.listen(PORT, () => console.log(`backend is running on port ${PORT}`));
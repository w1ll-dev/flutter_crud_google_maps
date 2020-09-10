const crypto = require('crypto');
const { Buffer } = require('buffer');
const encrypt = (password) => {
    const algorithm = 'aes-192-cbc';
    const key = crypto.scryptSync(password, 'salt', 24);

    const iv = Buffer.alloc(16, 0);

    const cipher = crypto.createCipheriv(algorithm, key, iv);

    let encrypted = cipher.update('sangati machines form', 'utf8', 'hex');
    encrypted += cipher.final('hex');

    return encrypted;
}

module.exports = encrypt;
const fs = require('fs');
const { generateKeyPairSync } = require('crypto');
const privateKeyPath = process.argv[2]
const publicKeyPath = process.argv[3]
const passphrase = process.argv[4]

console.log("Creating key pair public", publicKeyPath, "private", privateKeyPath, "passphrase", passphrase)

const {publicKey, privateKey} = generateKeyPairSync('rsa', {
      modulusLength: 4096,
      publicKeyEncoding: {
        type: 'spki',
        format: 'pem'
      },
      privateKeyEncoding: {
        type: 'pkcs8',
        format: 'pem',
        cipher: 'aes-256-cbc',
        passphrase: passphrase
      }
    })

fs.writeFileSync(publicKeyPath, publicKey);
fs.writeFileSync(privateKeyPath, privateKey);

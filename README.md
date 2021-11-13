# fluttertwo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## API

### How to start the API
```
cd API
npm start
```

### Register API call
```
http://localhost:8000/user/register
{
  "email": test@example.com,
  "pseudo": test,
  "password": 1234,
}
```
Response
```
{
  "message": Account created
}
```

### Login API call
```
http://localhost:8000/user/login
{
  "email": test@example.com,
  "password": 1234,
}
```
Response
```
{
  "id": id,
  "pseudo": test,
  "email": test@example.com,
  "password": hidden,
}
```


### Get NFTsImage
```
http://localhost:8000/user/getNFTs
{
  "id": id,
}
```
Response
```
{
  "id": id,
  "NFTs": [
    {
      "id": id,
      "url": url
    }
  ]
}
```

### Get NFTsDetails
```
http://localhost:8000/user/getNFT
{
  "id": id,
  "url": https://example.com,
}
```
Response
```
{
  "name": test,
  "description": blabla
}
```

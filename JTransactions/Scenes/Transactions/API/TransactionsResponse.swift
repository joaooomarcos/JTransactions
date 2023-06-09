import Foundation

struct TransactionsResponse: Decodable {
    let transactions: [Transaction]
}

/*
 {
    "transactions": [
       {
          "name": "Restos du coeur",
          "type": "donation",
          "date": "2021-03-07T14:04:45.000+01:00",
          "message": "Don à l'arrondi",
          "amount": {
             "value": -0.07,
             "currency": {
                "iso_3": "EUR",
                "symbol": "€",
                "title": "Euro"
             }
          },
          "small_icon": {
             "url": null,
             "category": "meal_voucher"
          },
          "large_icon": {
             "url": "https://...",
             "category": "donation"
          }
       },
       {
          "name": "Sushi WA",
          "type": "meal_voucher",
          "date": "2021-03-07T12:04:45.000+01:00",
          "message": null,
          "amount": {
             "value": -18.63,
             "currency": {
                "iso_3": "EUR",
                "symbol": "€",
                "title": "Euro"
             }
          },
          "small_icon": {
             "url": null,
             "category": "meal_voucher"
          },
          "large_icon": {
             "url": null,
             "category": "sushi"
          }
       },
       {
          "name": "FNAC",
          "type": "gift",
          "date": "2021-03-07T10:04:45.000+01:00",
          "message": null,
          "amount": {
             "value": -49.9,
             "currency": {
                "iso_3": "EUR",
                "symbol": "€",
                "title": "Euro"
             }
          },
          "small_icon": {
             "url": null,
             "category": "gift"
          },
          "large_icon": {
             "url": null,
             "category": "computer"
          }
       },
       {
          "name": "RATP",
          "type": "mobility",
          "date": "2021-03-06T09:34:45.000+01:00",
          "message": null,
          "amount": {
             "value": -75.2,
             "currency": {
                "iso_3": "EUR",
                "symbol": "€",
                "title": "Euro"
             }
          },
          "small_icon": {
             "url": null,
             "category": "mobility"
          },
          "large_icon": {
             "url": null,
             "category": "train"
          }
       },
       {
          "name": "Big Fernand",
          "type": "meal_voucher",
          "date": "2021-02-23T09:34:45.000+01:00",
          "message": null,
          "amount": {
             "value": -26.9,
             "currency": {
                "iso_3": "EUR",
                "symbol": "€",
                "title": "Euro"
             }
          },
          "small_icon": {
             "url": null,
             "category": "meal_voucher"
          },
          "large_icon": {
             "url": null,
             "category": "burger"
          }
       },
       {
          "name": "Mamiche",
          "type": "meal_voucher",
          "date": "2021-02-12T08:45:45.000+01:00",
          "message": null,
          "amount": {
             "value": -11.3,
             "currency": {
                "iso_3": "EUR",
                "symbol": "€",
                "title": "Euro"
             }
          },
          "small_icon": {
             "url": null,
             "category": "meal_voucher"
          },
          "large_icon": {
             "url": null,
             "category": "bakery"
          }
       },
       {
          "name": "Monoprix",
          "type": "meal_voucher",
          "date": "2021-02-11T10:23:45.000+01:00",
          "message": null,
          "amount": {
             "value": -112.2,
             "currency": {
                "iso_3": "EUR",
                "symbol": "€",
                "title": "Euro"
             }
          },
          "small_icon": {
             "url": null,
             "category": "meal_voucher"
          },
          "large_icon": {
             "url": null,
             "category": "supermarket"
          }
       },
       {
          "name": "Jean-Michel",
          "type": "payment",
          "date": "2021-01-01T18:34:45.000+01:00",
          "message": "Remboursement du repas d'hier",
          "amount": {
             "value": 15,
             "currency": {
                "iso_3": "EUR",
                "symbol": "€",
                "title": "Euro"
             }
          },
          "small_icon": {
             "url": "https://...",
             "category": "payment"
          },
          "large_icon": {
             "url": "https://...",
             "category": "payment"
          }
       }
    ]
 }
 */

import 'dart:collection';
import 'package:eco_commerce_app/core/model/image.dart';
import 'package:eco_commerce_app/core/model/product.dart';

abstract class ProductLoader {
  static HashMap<String, Product> _cashedProducts =
      new HashMap<String, Product>();
  static List response = [
    {
      "images": [
        {
          "_id": "5ee28f75f2e2d8224311edc9",
          "name": "mugs",
          "alternativeText": "",
          "caption": "",
          "hash": "mugs_eb94d10351",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 30.77,
          "width": 640,
          "height": 512,
          "url": "/uploads/mugs_eb94d10351.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_mugs_eb94d10351",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 195,
              "height": 156,
              "size": 4.73,
              "path": null,
              "url": "/uploads/thumbnail_mugs_eb94d10351.jpeg"
            },
            "small": {
              "hash": "small_mugs_eb94d10351",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 400,
              "size": 20.94,
              "path": null,
              "url": "/uploads/small_mugs_eb94d10351.jpeg"
            }
          },
          "provider": "local",
          "related": [
            "5ee2904cf2e2d8224311edde",
            "5ee509920e493c0017e05563",
            "5ee934e3fdf1dd0017fac521",
            "5ee93502fdf1dd0017fac523",
            "5ee93588fdf1dd0017fac525"
          ],
          "createdAt": "2020-06-11T20:09:25.229Z",
          "updatedAt": "2020-06-16T21:11:36.848Z",
          "__v": 0,
          "id": "5ee28f75f2e2d8224311edc9"
        }
      ],
      "users": [
        {
          "confirmed": true,
          "blocked": false,
          "_id": "5ee94f48fdf1dd0017fac529",
          "username": "Abhay",
          "email": "maurya.abhay30@gmail.com",
          "orgemail": "maurya.abhay30@gmail.com",
          "organisation": "Hash Studios",
          "phone": "9027398389",
          "provider": "local",
          "createdAt": "2020-06-16T23:01:28.421Z",
          "updatedAt": "2020-06-17T22:21:01.236Z",
          "__v": 0,
          "role": "5ee27f5571b6f621619a7963",
          "id": "5ee94f48fdf1dd0017fac529"
        }
      ],
      "_id": "5ee2904cf2e2d8224311edde",
      "reviews": null,
      "name": "White Ceramic Mug",
      "price": 250,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "rating": null,
      "createdAt": "2020-06-11T20:13:00.730Z",
      "updatedAt": "2020-06-17T22:25:27.838Z",
      "__v": 0,
      "tags": "mug,white mug,ceramic,crockery",
      "categories": [
        {
          "products": [
            "5ee2904cf2e2d8224311edde",
            "5ee509920e493c0017e05563",
            "5ee934e3fdf1dd0017fac521",
            "5ee93502fdf1dd0017fac523",
            "5ee93588fdf1dd0017fac525"
          ],
          "_id": "5ee28fcbf2e2d8224311edd8",
          "name": "mugs",
          "createdAt": "2020-06-11T20:10:51.192Z",
          "updatedAt": "2020-06-17T20:35:49.772Z",
          "__v": 0,
          "id": "5ee28fcbf2e2d8224311edd8"
        }
      ],
      "id": "5ee2904cf2e2d8224311edde"
    },
    {
      "images": [
        {
          "_id": "5ee28f74f2e2d8224311edc2",
          "name": "cups",
          "alternativeText": "",
          "caption": "",
          "hash": "cups_f80fca7673",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 35.7,
          "width": 640,
          "height": 427,
          "url": "/uploads/cups_f80fca7673.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_cups_f80fca7673",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 234,
              "height": 156,
              "size": 6.81,
              "path": null,
              "url": "/uploads/thumbnail_cups_f80fca7673.jpeg"
            },
            "small": {
              "hash": "small_cups_f80fca7673",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 334,
              "size": 23.71,
              "path": null,
              "url": "/uploads/small_cups_f80fca7673.jpeg"
            }
          },
          "provider": "local",
          "related": ["5ee2906ef2e2d8224311ede0"],
          "createdAt": "2020-06-11T20:09:24.091Z",
          "updatedAt": "2020-06-11T20:13:35.153Z",
          "__v": 0,
          "id": "5ee28f74f2e2d8224311edc2"
        }
      ],
      "users": [],
      "_id": "5ee2906ef2e2d8224311ede0",
      "reviews": null,
      "name": "White Coffee Cups (Set of 2)",
      "price": 350,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "createdAt": "2020-06-11T20:13:34.106Z",
      "updatedAt": "2020-06-17T20:26:59.853Z",
      "__v": 0,
      "tags": "cup,white cup,ceramic,crockery,coffee",
      "categories": [
        {
          "products": ["5ee2906ef2e2d8224311ede0"],
          "_id": "5ee28fd1f2e2d8224311edd9",
          "name": "cups",
          "createdAt": "2020-06-11T20:10:57.484Z",
          "updatedAt": "2020-06-17T20:26:59.639Z",
          "__v": 0,
          "id": "5ee28fd1f2e2d8224311edd9"
        }
      ],
      "id": "5ee2906ef2e2d8224311ede0"
    },
    {
      "images": [
        {
          "_id": "5ee28f75f2e2d8224311edcb",
          "name": "pencils",
          "alternativeText": "",
          "caption": "",
          "hash": "pencils_324a6c3a62",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 39.71,
          "width": 640,
          "height": 427,
          "url": "/uploads/pencils_324a6c3a62.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_pencils_324a6c3a62",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 234,
              "height": 156,
              "size": 9.16,
              "path": null,
              "url": "/uploads/thumbnail_pencils_324a6c3a62.jpeg"
            },
            "small": {
              "hash": "small_pencils_324a6c3a62",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 334,
              "size": 27.71,
              "path": null,
              "url": "/uploads/small_pencils_324a6c3a62.jpeg"
            }
          },
          "provider": "local",
          "related": ["5ee29090f2e2d8224311ede2"],
          "createdAt": "2020-06-11T20:09:25.382Z",
          "updatedAt": "2020-06-11T20:14:08.619Z",
          "__v": 0,
          "id": "5ee28f75f2e2d8224311edcb"
        }
      ],
      "users": [
        {
          "confirmed": true,
          "blocked": false,
          "_id": "5ee68d6e6465270017589fe4",
          "username": "AKSHAY MAURYA",
          "email": "akshaym.ec18@nsut.ac.in",
          "orgemail": "wyshdh@dge.iv",
          "organisation": "Arduino",
          "phone": "1254872580",
          "provider": "local",
          "createdAt": "2020-06-14T20:49:50.730Z",
          "updatedAt": "2020-06-16T18:41:01.229Z",
          "__v": 0,
          "role": "5ee27f5571b6f621619a7963",
          "id": "5ee68d6e6465270017589fe4"
        }
      ],
      "_id": "5ee29090f2e2d8224311ede2",
      "reviews": null,
      "name": "Color Pencils (Set of 24)",
      "price": 120,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "createdAt": "2020-06-11T20:14:08.379Z",
      "updatedAt": "2020-06-17T22:24:45.888Z",
      "__v": 0,
      "tags": "colour,pencils,sketch,art,color,pens",
      "categories": [
        {
          "products": ["5ee29090f2e2d8224311ede2"],
          "_id": "5ee28fdff2e2d8224311eddb",
          "name": "pencils",
          "createdAt": "2020-06-11T20:11:11.508Z",
          "updatedAt": "2020-06-17T20:27:53.173Z",
          "__v": 0,
          "id": "5ee28fdff2e2d8224311eddb"
        }
      ],
      "id": "5ee29090f2e2d8224311ede2"
    },
    {
      "images": [
        {
          "_id": "5ee28f75f2e2d8224311edcd",
          "name": "pens",
          "alternativeText": "",
          "caption": "",
          "hash": "pens_4dbbc0dbf5",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 15.2,
          "width": 640,
          "height": 640,
          "url": "/uploads/pens_4dbbc0dbf5.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_pens_4dbbc0dbf5",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 156,
              "height": 156,
              "size": 2.03,
              "path": null,
              "url": "/uploads/thumbnail_pens_4dbbc0dbf5.jpeg"
            },
            "small": {
              "hash": "small_pens_4dbbc0dbf5",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 500,
              "size": 10.92,
              "path": null,
              "url": "/uploads/small_pens_4dbbc0dbf5.jpeg"
            }
          },
          "provider": "local",
          "related": [
            "5ee290b6f2e2d8224311ede4",
            "5ee509c90e493c0017e05565",
            "5ee93473fdf1dd0017fac51b",
            "5ee93492fdf1dd0017fac51d",
            "5ee934bbfdf1dd0017fac51f"
          ],
          "createdAt": "2020-06-11T20:09:25.569Z",
          "updatedAt": "2020-06-16T21:08:11.985Z",
          "__v": 0,
          "id": "5ee28f75f2e2d8224311edcd"
        }
      ],
      "users": [],
      "_id": "5ee290b6f2e2d8224311ede4",
      "reviews": null,
      "name": "Slick Blue Pens (Pack of 5)",
      "price": 45,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "createdAt": "2020-06-11T20:14:46.322Z",
      "updatedAt": "2020-06-17T22:24:45.888Z",
      "__v": 0,
      "tags": "pens,blue,black pen,blue pen,gel pens",
      "categories": [
        {
          "products": [
            "5ee290b6f2e2d8224311ede4",
            "5ee509c90e493c0017e05565",
            "5ee93473fdf1dd0017fac51b",
            "5ee93492fdf1dd0017fac51d",
            "5ee934bbfdf1dd0017fac51f"
          ],
          "_id": "5ee28fe5f2e2d8224311eddc",
          "name": "pens",
          "createdAt": "2020-06-11T20:11:17.220Z",
          "updatedAt": "2020-06-17T20:33:43.615Z",
          "__v": 0,
          "id": "5ee28fe5f2e2d8224311eddc"
        }
      ],
      "id": "5ee290b6f2e2d8224311ede4"
    },
    {
      "images": [
        {
          "_id": "5ee28f73f2e2d8224311edc1",
          "name": "erasers",
          "alternativeText": "",
          "caption": "",
          "hash": "erasers_8e801c102b",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 15.44,
          "width": 640,
          "height": 427,
          "url": "/uploads/erasers_8e801c102b.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_erasers_8e801c102b",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 234,
              "height": 156,
              "size": 3.66,
              "path": null,
              "url": "/uploads/thumbnail_erasers_8e801c102b.jpeg"
            },
            "small": {
              "hash": "small_erasers_8e801c102b",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 334,
              "size": 10.9,
              "path": null,
              "url": "/uploads/small_erasers_8e801c102b.jpeg"
            }
          },
          "provider": "local",
          "related": ["5ee290d2f2e2d8224311ede6", "5ee935c3fdf1dd0017fac527"],
          "createdAt": "2020-06-11T20:09:23.880Z",
          "updatedAt": "2020-06-16T21:12:36.335Z",
          "__v": 0,
          "id": "5ee28f73f2e2d8224311edc1"
        }
      ],
      "users": [
        {
          "confirmed": true,
          "blocked": false,
          "_id": "5ee68d6e6465270017589fe4",
          "username": "AKSHAY MAURYA",
          "email": "akshaym.ec18@nsut.ac.in",
          "orgemail": "wyshdh@dge.iv",
          "organisation": "Arduino",
          "phone": "1254872580",
          "provider": "local",
          "createdAt": "2020-06-14T20:49:50.730Z",
          "updatedAt": "2020-06-16T18:41:01.229Z",
          "__v": 0,
          "role": "5ee27f5571b6f621619a7963",
          "id": "5ee68d6e6465270017589fe4"
        }
      ],
      "_id": "5ee290d2f2e2d8224311ede6",
      "reviews": null,
      "name": "Blue Eraser (Large)",
      "price": 10,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "createdAt": "2020-06-11T20:15:14.929Z",
      "updatedAt": "2020-06-17T22:24:45.888Z",
      "__v": 0,
      "tags": "rubber,eraser,blue,red,pencil",
      "categories": [
        {
          "products": ["5ee290d2f2e2d8224311ede6", "5ee935c3fdf1dd0017fac527"],
          "_id": "5ee28fecf2e2d8224311eddd",
          "name": "erasers",
          "createdAt": "2020-06-11T20:11:24.219Z",
          "updatedAt": "2020-06-17T20:37:11.232Z",
          "__v": 0,
          "id": "5ee28fecf2e2d8224311eddd"
        }
      ],
      "id": "5ee290d2f2e2d8224311ede6"
    },
    {
      "images": [
        {
          "_id": "5ee28f75f2e2d8224311edc9",
          "name": "mugs",
          "alternativeText": "",
          "caption": "",
          "hash": "mugs_eb94d10351",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 30.77,
          "width": 640,
          "height": 512,
          "url": "/uploads/mugs_eb94d10351.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_mugs_eb94d10351",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 195,
              "height": 156,
              "size": 4.73,
              "path": null,
              "url": "/uploads/thumbnail_mugs_eb94d10351.jpeg"
            },
            "small": {
              "hash": "small_mugs_eb94d10351",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 400,
              "size": 20.94,
              "path": null,
              "url": "/uploads/small_mugs_eb94d10351.jpeg"
            }
          },
          "provider": "local",
          "related": [
            "5ee2904cf2e2d8224311edde",
            "5ee509920e493c0017e05563",
            "5ee934e3fdf1dd0017fac521",
            "5ee93502fdf1dd0017fac523",
            "5ee93588fdf1dd0017fac525"
          ],
          "createdAt": "2020-06-11T20:09:25.229Z",
          "updatedAt": "2020-06-16T21:11:36.848Z",
          "__v": 0,
          "id": "5ee28f75f2e2d8224311edc9"
        }
      ],
      "users": [
        {
          "confirmed": true,
          "blocked": false,
          "_id": "5ee68d6e6465270017589fe4",
          "username": "AKSHAY MAURYA",
          "email": "akshaym.ec18@nsut.ac.in",
          "orgemail": "wyshdh@dge.iv",
          "organisation": "Arduino",
          "phone": "1254872580",
          "provider": "local",
          "createdAt": "2020-06-14T20:49:50.730Z",
          "updatedAt": "2020-06-16T18:41:01.229Z",
          "__v": 0,
          "role": "5ee27f5571b6f621619a7963",
          "id": "5ee68d6e6465270017589fe4"
        }
      ],
      "_id": "5ee509920e493c0017e05563",
      "reviews": null,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "name": "Coffee Mug Set",
      "price": 599,
      "createdAt": "2020-06-13T17:14:58.835Z",
      "updatedAt": "2020-06-17T20:30:31.967Z",
      "__v": 0,
      "tags": "coffee mug,coffee,mug,crockery,ceramic",
      "categories": [
        {
          "products": [
            "5ee2904cf2e2d8224311edde",
            "5ee509920e493c0017e05563",
            "5ee934e3fdf1dd0017fac521",
            "5ee93502fdf1dd0017fac523",
            "5ee93588fdf1dd0017fac525"
          ],
          "_id": "5ee28fcbf2e2d8224311edd8",
          "name": "mugs",
          "createdAt": "2020-06-11T20:10:51.192Z",
          "updatedAt": "2020-06-17T20:35:49.772Z",
          "__v": 0,
          "id": "5ee28fcbf2e2d8224311edd8"
        }
      ],
      "id": "5ee509920e493c0017e05563"
    },
    {
      "images": [
        {
          "_id": "5ee28f75f2e2d8224311edcd",
          "name": "pens",
          "alternativeText": "",
          "caption": "",
          "hash": "pens_4dbbc0dbf5",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 15.2,
          "width": 640,
          "height": 640,
          "url": "/uploads/pens_4dbbc0dbf5.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_pens_4dbbc0dbf5",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 156,
              "height": 156,
              "size": 2.03,
              "path": null,
              "url": "/uploads/thumbnail_pens_4dbbc0dbf5.jpeg"
            },
            "small": {
              "hash": "small_pens_4dbbc0dbf5",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 500,
              "size": 10.92,
              "path": null,
              "url": "/uploads/small_pens_4dbbc0dbf5.jpeg"
            }
          },
          "provider": "local",
          "related": [
            "5ee290b6f2e2d8224311ede4",
            "5ee509c90e493c0017e05565",
            "5ee93473fdf1dd0017fac51b",
            "5ee93492fdf1dd0017fac51d",
            "5ee934bbfdf1dd0017fac51f"
          ],
          "createdAt": "2020-06-11T20:09:25.569Z",
          "updatedAt": "2020-06-16T21:08:11.985Z",
          "__v": 0,
          "id": "5ee28f75f2e2d8224311edcd"
        }
      ],
      "users": [],
      "_id": "5ee509c90e493c0017e05565",
      "reviews": null,
      "name": "Assorted Highlighter Set",
      "price": 89,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "createdAt": "2020-06-13T17:15:53.141Z",
      "updatedAt": "2020-06-17T20:32:10.132Z",
      "__v": 0,
      "tags":
          "colour,pencils,sketch,art,color,pens,marker,permanent,highlighter",
      "categories": [
        {
          "products": [
            "5ee290b6f2e2d8224311ede4",
            "5ee509c90e493c0017e05565",
            "5ee93473fdf1dd0017fac51b",
            "5ee93492fdf1dd0017fac51d",
            "5ee934bbfdf1dd0017fac51f"
          ],
          "_id": "5ee28fe5f2e2d8224311eddc",
          "name": "pens",
          "createdAt": "2020-06-11T20:11:17.220Z",
          "updatedAt": "2020-06-17T20:33:43.615Z",
          "__v": 0,
          "id": "5ee28fe5f2e2d8224311eddc"
        }
      ],
      "id": "5ee509c90e493c0017e05565"
    },
    {
      "images": [
        {
          "_id": "5ee28f75f2e2d8224311edcd",
          "name": "pens",
          "alternativeText": "",
          "caption": "",
          "hash": "pens_4dbbc0dbf5",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 15.2,
          "width": 640,
          "height": 640,
          "url": "/uploads/pens_4dbbc0dbf5.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_pens_4dbbc0dbf5",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 156,
              "height": 156,
              "size": 2.03,
              "path": null,
              "url": "/uploads/thumbnail_pens_4dbbc0dbf5.jpeg"
            },
            "small": {
              "hash": "small_pens_4dbbc0dbf5",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 500,
              "size": 10.92,
              "path": null,
              "url": "/uploads/small_pens_4dbbc0dbf5.jpeg"
            }
          },
          "provider": "local",
          "related": [
            "5ee290b6f2e2d8224311ede4",
            "5ee509c90e493c0017e05565",
            "5ee93473fdf1dd0017fac51b",
            "5ee93492fdf1dd0017fac51d",
            "5ee934bbfdf1dd0017fac51f"
          ],
          "createdAt": "2020-06-11T20:09:25.569Z",
          "updatedAt": "2020-06-16T21:08:11.985Z",
          "__v": 0,
          "id": "5ee28f75f2e2d8224311edcd"
        }
      ],
      "users": [],
      "_id": "5ee93473fdf1dd0017fac51b",
      "reviews": null,
      "name": "Blue Gel Pen",
      "price": 5,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "createdAt": "2020-06-16T21:06:59.204Z",
      "updatedAt": "2020-06-17T22:24:45.888Z",
      "__v": 0,
      "tags": "gel pens,blue,black,red,green,pen,pencil,whitener",
      "categories": [
        {
          "products": [
            "5ee290b6f2e2d8224311ede4",
            "5ee509c90e493c0017e05565",
            "5ee93473fdf1dd0017fac51b",
            "5ee93492fdf1dd0017fac51d",
            "5ee934bbfdf1dd0017fac51f"
          ],
          "_id": "5ee28fe5f2e2d8224311eddc",
          "name": "pens",
          "createdAt": "2020-06-11T20:11:17.220Z",
          "updatedAt": "2020-06-17T20:33:43.615Z",
          "__v": 0,
          "id": "5ee28fe5f2e2d8224311eddc"
        }
      ],
      "id": "5ee93473fdf1dd0017fac51b"
    },
    {
      "images": [
        {
          "_id": "5ee28f75f2e2d8224311edcd",
          "name": "pens",
          "alternativeText": "",
          "caption": "",
          "hash": "pens_4dbbc0dbf5",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 15.2,
          "width": 640,
          "height": 640,
          "url": "/uploads/pens_4dbbc0dbf5.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_pens_4dbbc0dbf5",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 156,
              "height": 156,
              "size": 2.03,
              "path": null,
              "url": "/uploads/thumbnail_pens_4dbbc0dbf5.jpeg"
            },
            "small": {
              "hash": "small_pens_4dbbc0dbf5",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 500,
              "size": 10.92,
              "path": null,
              "url": "/uploads/small_pens_4dbbc0dbf5.jpeg"
            }
          },
          "provider": "local",
          "related": [
            "5ee290b6f2e2d8224311ede4",
            "5ee509c90e493c0017e05565",
            "5ee93473fdf1dd0017fac51b",
            "5ee93492fdf1dd0017fac51d",
            "5ee934bbfdf1dd0017fac51f"
          ],
          "createdAt": "2020-06-11T20:09:25.569Z",
          "updatedAt": "2020-06-16T21:08:11.985Z",
          "__v": 0,
          "id": "5ee28f75f2e2d8224311edcd"
        }
      ],
      "users": [],
      "_id": "5ee93492fdf1dd0017fac51d",
      "reviews": null,
      "name": "Fountain Pen",
      "price": 120,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "createdAt": "2020-06-16T21:07:30.435Z",
      "updatedAt": "2020-06-17T20:33:13.515Z",
      "__v": 0,
      "tags": "ink,fountain,gel pens,blue,black,red,green,pen,pencil,whitener",
      "categories": [
        {
          "products": [
            "5ee290b6f2e2d8224311ede4",
            "5ee509c90e493c0017e05565",
            "5ee93473fdf1dd0017fac51b",
            "5ee93492fdf1dd0017fac51d",
            "5ee934bbfdf1dd0017fac51f"
          ],
          "_id": "5ee28fe5f2e2d8224311eddc",
          "name": "pens",
          "createdAt": "2020-06-11T20:11:17.220Z",
          "updatedAt": "2020-06-17T20:33:43.615Z",
          "__v": 0,
          "id": "5ee28fe5f2e2d8224311eddc"
        }
      ],
      "id": "5ee93492fdf1dd0017fac51d"
    },
    {
      "images": [
        {
          "_id": "5ee28f75f2e2d8224311edcd",
          "name": "pens",
          "alternativeText": "",
          "caption": "",
          "hash": "pens_4dbbc0dbf5",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 15.2,
          "width": 640,
          "height": 640,
          "url": "/uploads/pens_4dbbc0dbf5.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_pens_4dbbc0dbf5",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 156,
              "height": 156,
              "size": 2.03,
              "path": null,
              "url": "/uploads/thumbnail_pens_4dbbc0dbf5.jpeg"
            },
            "small": {
              "hash": "small_pens_4dbbc0dbf5",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 500,
              "size": 10.92,
              "path": null,
              "url": "/uploads/small_pens_4dbbc0dbf5.jpeg"
            }
          },
          "provider": "local",
          "related": [
            "5ee290b6f2e2d8224311ede4",
            "5ee509c90e493c0017e05565",
            "5ee93473fdf1dd0017fac51b",
            "5ee93492fdf1dd0017fac51d",
            "5ee934bbfdf1dd0017fac51f"
          ],
          "createdAt": "2020-06-11T20:09:25.569Z",
          "updatedAt": "2020-06-16T21:08:11.985Z",
          "__v": 0,
          "id": "5ee28f75f2e2d8224311edcd"
        }
      ],
      "users": [],
      "_id": "5ee934bbfdf1dd0017fac51f",
      "reviews": null,
      "name": "Blue Ball Pens (Pack of 5)",
      "price": 25,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "createdAt": "2020-06-16T21:08:11.423Z",
      "updatedAt": "2020-06-17T20:33:43.823Z",
      "__v": 0,
      "tags":
          "ball pen,marker,gel pens,blue,black,red,green,pen,pencil,whitener",
      "categories": [
        {
          "products": [
            "5ee290b6f2e2d8224311ede4",
            "5ee509c90e493c0017e05565",
            "5ee93473fdf1dd0017fac51b",
            "5ee93492fdf1dd0017fac51d",
            "5ee934bbfdf1dd0017fac51f"
          ],
          "_id": "5ee28fe5f2e2d8224311eddc",
          "name": "pens",
          "createdAt": "2020-06-11T20:11:17.220Z",
          "updatedAt": "2020-06-17T20:33:43.615Z",
          "__v": 0,
          "id": "5ee28fe5f2e2d8224311eddc"
        }
      ],
      "id": "5ee934bbfdf1dd0017fac51f"
    },
    {
      "images": [
        {
          "_id": "5ee28f75f2e2d8224311edc9",
          "name": "mugs",
          "alternativeText": "",
          "caption": "",
          "hash": "mugs_eb94d10351",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 30.77,
          "width": 640,
          "height": 512,
          "url": "/uploads/mugs_eb94d10351.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_mugs_eb94d10351",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 195,
              "height": 156,
              "size": 4.73,
              "path": null,
              "url": "/uploads/thumbnail_mugs_eb94d10351.jpeg"
            },
            "small": {
              "hash": "small_mugs_eb94d10351",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 400,
              "size": 20.94,
              "path": null,
              "url": "/uploads/small_mugs_eb94d10351.jpeg"
            }
          },
          "provider": "local",
          "related": [
            "5ee2904cf2e2d8224311edde",
            "5ee509920e493c0017e05563",
            "5ee934e3fdf1dd0017fac521",
            "5ee93502fdf1dd0017fac523",
            "5ee93588fdf1dd0017fac525"
          ],
          "createdAt": "2020-06-11T20:09:25.229Z",
          "updatedAt": "2020-06-16T21:11:36.848Z",
          "__v": 0,
          "id": "5ee28f75f2e2d8224311edc9"
        }
      ],
      "users": [],
      "_id": "5ee934e3fdf1dd0017fac521",
      "reviews": null,
      "name": "The Champ Mug",
      "price": 999,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "createdAt": "2020-06-16T21:08:51.112Z",
      "updatedAt": "2020-06-17T20:34:03.568Z",
      "__v": 0,
      "tags": "coffee mug,coffee,mug,crockery,ceramic",
      "categories": [
        {
          "products": [
            "5ee2904cf2e2d8224311edde",
            "5ee509920e493c0017e05563",
            "5ee934e3fdf1dd0017fac521",
            "5ee93502fdf1dd0017fac523",
            "5ee93588fdf1dd0017fac525"
          ],
          "_id": "5ee28fcbf2e2d8224311edd8",
          "name": "mugs",
          "createdAt": "2020-06-11T20:10:51.192Z",
          "updatedAt": "2020-06-17T20:35:49.772Z",
          "__v": 0,
          "id": "5ee28fcbf2e2d8224311edd8"
        }
      ],
      "id": "5ee934e3fdf1dd0017fac521"
    },
    {
      "images": [
        {
          "_id": "5ee28f75f2e2d8224311edc9",
          "name": "mugs",
          "alternativeText": "",
          "caption": "",
          "hash": "mugs_eb94d10351",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 30.77,
          "width": 640,
          "height": 512,
          "url": "/uploads/mugs_eb94d10351.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_mugs_eb94d10351",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 195,
              "height": 156,
              "size": 4.73,
              "path": null,
              "url": "/uploads/thumbnail_mugs_eb94d10351.jpeg"
            },
            "small": {
              "hash": "small_mugs_eb94d10351",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 400,
              "size": 20.94,
              "path": null,
              "url": "/uploads/small_mugs_eb94d10351.jpeg"
            }
          },
          "provider": "local",
          "related": [
            "5ee2904cf2e2d8224311edde",
            "5ee509920e493c0017e05563",
            "5ee934e3fdf1dd0017fac521",
            "5ee93502fdf1dd0017fac523",
            "5ee93588fdf1dd0017fac525"
          ],
          "createdAt": "2020-06-11T20:09:25.229Z",
          "updatedAt": "2020-06-16T21:11:36.848Z",
          "__v": 0,
          "id": "5ee28f75f2e2d8224311edc9"
        }
      ],
      "users": [],
      "_id": "5ee93502fdf1dd0017fac523",
      "reviews": null,
      "name": "Red Mug",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "price": 250,
      "createdAt": "2020-06-16T21:09:22.148Z",
      "updatedAt": "2020-06-17T20:34:42.690Z",
      "__v": 0,
      "tags": "mug,red mug,white mug,red,utensils,ceramic,crockery,coffee",
      "categories": [
        {
          "products": [
            "5ee2904cf2e2d8224311edde",
            "5ee509920e493c0017e05563",
            "5ee934e3fdf1dd0017fac521",
            "5ee93502fdf1dd0017fac523",
            "5ee93588fdf1dd0017fac525"
          ],
          "_id": "5ee28fcbf2e2d8224311edd8",
          "name": "mugs",
          "createdAt": "2020-06-11T20:10:51.192Z",
          "updatedAt": "2020-06-17T20:35:49.772Z",
          "__v": 0,
          "id": "5ee28fcbf2e2d8224311edd8"
        }
      ],
      "id": "5ee93502fdf1dd0017fac523"
    },
    {
      "images": [
        {
          "_id": "5ee28f75f2e2d8224311edc9",
          "name": "mugs",
          "alternativeText": "",
          "caption": "",
          "hash": "mugs_eb94d10351",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 30.77,
          "width": 640,
          "height": 512,
          "url": "/uploads/mugs_eb94d10351.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_mugs_eb94d10351",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 195,
              "height": 156,
              "size": 4.73,
              "path": null,
              "url": "/uploads/thumbnail_mugs_eb94d10351.jpeg"
            },
            "small": {
              "hash": "small_mugs_eb94d10351",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 400,
              "size": 20.94,
              "path": null,
              "url": "/uploads/small_mugs_eb94d10351.jpeg"
            }
          },
          "provider": "local",
          "related": [
            "5ee2904cf2e2d8224311edde",
            "5ee509920e493c0017e05563",
            "5ee934e3fdf1dd0017fac521",
            "5ee93502fdf1dd0017fac523",
            "5ee93588fdf1dd0017fac525"
          ],
          "createdAt": "2020-06-11T20:09:25.229Z",
          "updatedAt": "2020-06-16T21:11:36.848Z",
          "__v": 0,
          "id": "5ee28f75f2e2d8224311edc9"
        }
      ],
      "users": [],
      "_id": "5ee93588fdf1dd0017fac525",
      "reviews": null,
      "name": "Brown Mug",
      "price": 245,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "createdAt": "2020-06-16T21:11:36.282Z",
      "updatedAt": "2020-06-17T20:35:49.980Z",
      "__v": 0,
      "tags": "coffee mug,coffee,mug,crockery,ceramic,utensils,red,brown,tea",
      "categories": [
        {
          "products": [
            "5ee2904cf2e2d8224311edde",
            "5ee509920e493c0017e05563",
            "5ee934e3fdf1dd0017fac521",
            "5ee93502fdf1dd0017fac523",
            "5ee93588fdf1dd0017fac525"
          ],
          "_id": "5ee28fcbf2e2d8224311edd8",
          "name": "mugs",
          "createdAt": "2020-06-11T20:10:51.192Z",
          "updatedAt": "2020-06-17T20:35:49.772Z",
          "__v": 0,
          "id": "5ee28fcbf2e2d8224311edd8"
        }
      ],
      "id": "5ee93588fdf1dd0017fac525"
    },
    {
      "images": [
        {
          "_id": "5ee28f73f2e2d8224311edc1",
          "name": "erasers",
          "alternativeText": "",
          "caption": "",
          "hash": "erasers_8e801c102b",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 15.44,
          "width": 640,
          "height": 427,
          "url": "/uploads/erasers_8e801c102b.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_erasers_8e801c102b",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 234,
              "height": 156,
              "size": 3.66,
              "path": null,
              "url": "/uploads/thumbnail_erasers_8e801c102b.jpeg"
            },
            "small": {
              "hash": "small_erasers_8e801c102b",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 334,
              "size": 10.9,
              "path": null,
              "url": "/uploads/small_erasers_8e801c102b.jpeg"
            }
          },
          "provider": "local",
          "related": ["5ee290d2f2e2d8224311ede6", "5ee935c3fdf1dd0017fac527"],
          "createdAt": "2020-06-11T20:09:23.880Z",
          "updatedAt": "2020-06-16T21:12:36.335Z",
          "__v": 0,
          "id": "5ee28f73f2e2d8224311edc1"
        }
      ],
      "users": [],
      "_id": "5ee935c3fdf1dd0017fac527",
      "reviews": null,
      "name": "Magic Eraser",
      "price": 45,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "createdAt": "2020-06-16T21:12:35.773Z",
      "updatedAt": "2020-06-17T20:37:11.439Z",
      "__v": 0,
      "tags": "rubber,eraser,blue,red,pencil,non dust",
      "categories": [
        {
          "products": ["5ee290d2f2e2d8224311ede6", "5ee935c3fdf1dd0017fac527"],
          "_id": "5ee28fecf2e2d8224311eddd",
          "name": "erasers",
          "createdAt": "2020-06-11T20:11:24.219Z",
          "updatedAt": "2020-06-17T20:37:11.232Z",
          "__v": 0,
          "id": "5ee28fecf2e2d8224311eddd"
        }
      ],
      "id": "5ee935c3fdf1dd0017fac527"
    },
    {
      "images": [
        {
          "_id": "5ee28f73f2e2d8224311edbf",
          "name": "diaries",
          "alternativeText": "",
          "caption": "",
          "hash": "diaries_5003836df7",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 30.02,
          "width": 640,
          "height": 427,
          "url": "/uploads/diaries_5003836df7.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_diaries_5003836df7",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 234,
              "height": 156,
              "size": 6.81,
              "path": null,
              "url": "/uploads/thumbnail_diaries_5003836df7.jpeg"
            },
            "small": {
              "hash": "small_diaries_5003836df7",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 334,
              "size": 21.51,
              "path": null,
              "url": "/uploads/small_diaries_5003836df7.jpeg"
            }
          },
          "provider": "local",
          "related": ["5ee9f11d5b2f13001723e2ff"],
          "createdAt": "2020-06-11T20:09:23.756Z",
          "updatedAt": "2020-06-17T10:31:57.705Z",
          "__v": 0,
          "id": "5ee28f73f2e2d8224311edbf"
        }
      ],
      "users": [],
      "_id": "5ee9f11d5b2f13001723e2ff",
      "reviews": null,
      "name": "Regular Mini Diary",
      "desc":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
      "features":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
      "price": 399,
      "createdAt": "2020-06-17T10:31:57.100Z",
      "updatedAt": "2020-06-17T22:19:48.232Z",
      "__v": 0,
      "tags": "diary,journal,notes,notepad,sticky,organiser,office",
      "categories": [
        {
          "products": ["5ee9f11d5b2f13001723e2ff"],
          "_id": "5ee9f0cc5b2f13001723e2fe",
          "name": "diaries",
          "createdAt": "2020-06-17T10:30:36.973Z",
          "updatedAt": "2020-06-17T20:37:45.518Z",
          "__v": 0,
          "id": "5ee9f0cc5b2f13001723e2fe"
        }
      ],
      "id": "5ee9f11d5b2f13001723e2ff"
    },
    {
      "images": [
        {
          "_id": "5ee28f73f2e2d8224311edb9",
          "name": "calendars",
          "alternativeText": "",
          "caption": "",
          "hash": "calendars_50fb8e7454",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 22.84,
          "width": 640,
          "height": 427,
          "url": "/uploads/calendars_50fb8e7454.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_calendars_50fb8e7454",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 234,
              "height": 156,
              "size": 5.31,
              "path": null,
              "url": "/uploads/thumbnail_calendars_50fb8e7454.jpeg"
            },
            "small": {
              "hash": "small_calendars_50fb8e7454",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 334,
              "size": 16.21,
              "path": null,
              "url": "/uploads/small_calendars_50fb8e7454.jpeg"
            }
          },
          "provider": "local",
          "related": ["5ee9f2045b2f13001723e301"],
          "createdAt": "2020-06-11T20:09:23.107Z",
          "updatedAt": "2020-06-17T10:35:48.933Z",
          "__v": 0,
          "id": "5ee28f73f2e2d8224311edb9"
        }
      ],
      "users": [],
      "_id": "5ee9f2045b2f13001723e301",
      "reviews": null,
      "name": "Vintage Calendar (Set of 2)",
      "price": 259,
      "desc":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
      "features":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
      "createdAt": "2020-06-17T10:35:48.365Z",
      "updatedAt": "2020-06-17T20:38:36.767Z",
      "__v": 0,
      "tags": "calendar,journal,organiser,desk accessories,table,",
      "categories": [
        {
          "products": ["5ee9f2045b2f13001723e301"],
          "_id": "5ee9f0415b2f13001723e2fd",
          "name": "calendars",
          "createdAt": "2020-06-17T10:28:17.607Z",
          "updatedAt": "2020-06-17T20:38:36.557Z",
          "__v": 0,
          "id": "5ee9f0415b2f13001723e2fd"
        }
      ],
      "id": "5ee9f2045b2f13001723e301"
    },
    {
      "images": [
        {
          "_id": "5ee28f73f2e2d8224311edbb",
          "name": "bags",
          "alternativeText": "",
          "caption": "",
          "hash": "bags_20d8619373",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 35.08,
          "width": 640,
          "height": 427,
          "url": "/uploads/bags_20d8619373.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_bags_20d8619373",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 234,
              "height": 156,
              "size": 7.6,
              "path": null,
              "url": "/uploads/thumbnail_bags_20d8619373.jpeg"
            },
            "small": {
              "hash": "small_bags_20d8619373",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 334,
              "size": 24.14,
              "path": null,
              "url": "/uploads/small_bags_20d8619373.jpeg"
            }
          },
          "provider": "local",
          "related": ["5ee9f4d05b2f13001723e303"],
          "createdAt": "2020-06-11T20:09:23.146Z",
          "updatedAt": "2020-06-17T10:47:45.145Z",
          "__v": 0,
          "id": "5ee28f73f2e2d8224311edbb"
        }
      ],
      "users": [],
      "_id": "5ee9f4d05b2f13001723e303",
      "reviews": null,
      "name": "All Natural Travel Bag (Black/Brown)",
      "price": 2599,
      "desc":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
      "features":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
      "createdAt": "2020-06-17T10:47:44.581Z",
      "updatedAt": "2020-06-17T20:39:23.634Z",
      "__v": 0,
      "tags": "leather,bag,carry,accessories,travel",
      "categories": [
        {
          "products": ["5ee9f4d05b2f13001723e303"],
          "_id": "5ee9f4df5b2f13001723e305",
          "name": "bags",
          "createdAt": "2020-06-17T10:47:59.531Z",
          "updatedAt": "2020-06-17T20:39:23.426Z",
          "__v": 0,
          "id": "5ee9f4df5b2f13001723e305"
        }
      ],
      "id": "5ee9f4d05b2f13001723e303"
    }
  ];
  static Future<Product> loadProductById(String id) async {
    if (!_cashedProducts.containsKey(id)) {
      await _loader(id: id).then((value) {
        return _cashedProducts[id];
      });
    }
    return _cashedProducts[id];
  }

  static Future<List<Product>> loadProducts() async {
    List<Product> _products = new List();
    if (_cashedProducts.length == 0) {
      await _loader().then((value) {
        _cashedProducts.forEach((key, value) {
          _products.add(value);
        });
      });
    } else {
      _cashedProducts.forEach((key, value) {
        _products.add(value);
      });
    }
    return _products;
  }

  static _loader({String id}) async {
    for (int i = 0; i < response.length; i++) {
      _cashedProducts[response[i]["id"]] = Product(
        id: response[i]["id"],
        name: response[i]["name"],
        price: response[i]["price"].toString(),
        images: new List<ProductImage>.generate(response[i]["images"].length,
            (image) {
          return ProductImage(
              id: response[i]["images"][image]["id"],
              name: response[i]["images"][image]["name"],
              ext: response[i]["images"][image]["ext"],
              size: response[i]["images"][image]["size"].toString(),
              width: response[i]["images"][image]["width"].toString(),
              height: response[i]["images"][image]["height"].toString(),
              url: response[i]["images"][image]["url"],
              thumbnailUrl: response[i]["images"][image]["formats"]["thumbnail"]
                  ["url"],
              smallUrl: response[i]["images"][image]["formats"]["small"]["url"],
              createdAt: response[i]["images"][image]["createdAt"]);
        }),
        category: response[i]["categories"][0]["name"],
        desc: response[i]["desc"],
        features: response[i]["features"],
        createdAt: response[i]["createdAt"],
      );
    }
  }
}

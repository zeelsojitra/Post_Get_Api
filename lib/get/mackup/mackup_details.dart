import 'package:flutter/material.dart';

class Mackup_Details extends StatefulWidget {
  final id;
  final brand;
  final name;
  final price;
  final pricesign;
  final currency;
  final imagelink;
  final productLink;
  final websiteLink;
  final description;
  final rating;
  final category;
  final productType;
  final createdAt;
  final updatedAt;
  final productApiUrl;
  final apiFeaturedImage;

  const Mackup_Details(
      {Key? key,
      this.name,
      this.id,
      this.brand,
      this.price,
      this.pricesign,
      this.currency,
      this.imagelink,
      this.productLink,
      this.websiteLink,
      this.description,
      this.rating,
      this.category,
      this.productType,
      this.createdAt,
      this.updatedAt,
      this.productApiUrl,
      this.apiFeaturedImage})
      : super(key: key);

  @override
  State<Mackup_Details> createState() => _Mackup_DetailsState();
}

class _Mackup_DetailsState extends State<Mackup_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mackup Details"),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("${widget.imagelink.toString()}"),
              ),
            ),
          ),
          Text("${widget.name}"),
          Text("${widget.currency}"),
          Text("${widget.price.toString()}"),
        ],
      ),
    );
  }
}

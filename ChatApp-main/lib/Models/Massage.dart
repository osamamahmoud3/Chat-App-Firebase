import 'package:flutter/foundation.dart';

class massage 
{
  final String Massage;
  final String id;

  massage(this.Massage, this.id);
  factory massage.fromjson( jsondata)
  {
    return massage(jsondata['massage'],jsondata['id']);
  }
}
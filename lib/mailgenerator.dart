import 'mailcontent.dart';

class MailGenerator {
  static var mailList = [
    MailContent("Mail Subject", "Sender", "date",
        "Mail Body..."),
    MailContent("Mail Subject", "Sender", "date",
        "Mail Body..."),
    MailContent("Mail Subject", "Sender", "date",
        "Mail Body..."),

  ];

  static MailContent getMailContent(int position) => mailList[position];
  static int mailListLength = mailList.length;
}
import smtplib
import getpass

HOST = "smtp-mail.outlook.com"
PORT = 587
# PASSWORD = getpass.getpass("Enter Password: ")

smtp = smtplib.SMTP(HOST, PORT)
status_code, response = smtp.ehlo()
print(f"Echoing the server {status_code} {response}")
status_code, response = smtp.starttls()
print(f"Start TLS Connection {status_code} {response}")

class Email:
    def __init__(self, sender_email, recipient_email, subject, message):
        self.sender_email = sender_email
        self.recipient_email = recipient_email
        self.subject = subject
        self.message = message

    def display_email(self):
        print(f"from: {self.sender_email}")
        print(f"to: {self.recipient_email}")
        print(f"subject : {self.subject}")
        print(f"{self.message}")

    def return_email(self):
        return self.sender_email

class AutomateEmail(Email):
    def __init__(self, sender_email, recipient_email, subject, message, schedule_time):
        super().__init__(sender_email, recipient_email, subject, message)
        self.schedule_time = schedule_time

    def send_email(self):
        print(f"""

        From: {self.sender_email}
        To: {self.recipient_email}
        Subject: {self.subject}
        Message: {self.message}
        Schdule time: {self.schedule_time}
        Simulating email sending
""")
        # smtp.sendmail(self.sender_email, self.recipient_email, self.message)
        # print(f"Email sent to {self.recipient_email}")

    def return_email(self):
        return self.sender_email

email = AutomateEmail("mesirebo@outlook.com", "meshagwe@icloud.com", "Greetings", "How are you?", "10:00 AM")

# status_code, response = smtp.login(email.return_email(), PASSWORD)
# print(f"Logging in: {status_code} {response}")


email.send_email()


smtp.quit()
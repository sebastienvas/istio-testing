// Copyright 2018 Istio Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package sisyphus

import (
	"fmt"
	"log"
	"net/smtp"
)

const (
	gmailSMTPServer = "smtp.gmail.com"
	gmailSMTPPort   = 587
)

type alert struct {
	gmailAppPass  string
	identity      string
	senderAddr    string
	receiverAddrs []string
}

// function signature guarantees at least one receiver
func newAlert(gmailAppPass, identity, senderAddr, receiverAddr string) *alert {
	return &Alert{
		gmailAppPass:  gmailAppPass,
		identity:      identity,
		senderAddr:    senderAddr,
		receiverAddrs: []string{receiverAddr},
	}
}

func (a *Alert) subscribe(receiverAddrs ...string) {
	a.receiverAddrs = append(a.receiverAddrs, receivers...)
}

// Use gmail smtp server to send out email.
func (a *Alert) send(subject, body string) error {
	msg := fmt.Sprintf("From: %s\nTo: %s\nSubject: %s\n\n%s\n",
		a.senderAddr, a.receiverAddrs, subject, body)
	gmailSMTPAddr := fmt.Sprintf("%s:%d", gmailSMTPServer, gmailSMTPPort)
	smtpAuth := smtp.PlainAuth(a.identity, a.senderAddr, a.gmailAppPass, gmailSMTPServer)
	err := smtp.SendMail(gmailSMTPAddr, smtpAuth, a.senderAddr, a.receiverAddrs, []byte(msg))
	if err != nil {
		log.Printf("Alert failed to be sent\n")
		return err
	}
	log.Printf("Alert successfully sent\n")
}

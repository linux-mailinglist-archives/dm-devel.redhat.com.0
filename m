Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC0505AC
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:30:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B33D308339E;
	Mon, 24 Jun 2019 09:30:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89AB119C69;
	Mon, 24 Jun 2019 09:29:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE91F1806B1A;
	Mon, 24 Jun 2019 09:29:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9SwOC004461 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:28:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 08F185C225; Mon, 24 Jun 2019 09:28:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCF4B5C22E;
	Mon, 24 Jun 2019 09:28:55 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0630DB2DC4;
	Mon, 24 Jun 2019 09:28:51 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:28:40 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:26 +0200
Message-Id: <20190624092756.7769-2-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Mon, 24 Jun 2019 09:28:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Mon, 24 Jun 2019 09:28:52 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 01/30] kpartx: dasd: fix
	-Waddress-of-packed-member warning from gcc9
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 24 Jun 2019 09:30:15 +0000 (UTC)

Rml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgoKZGFzZC5jOiBJbiBmdW5jdGlvbiDigJhyZWFk
X2Rhc2RfcHTigJk6CmRhc2QuYzoyMDY6Mzogd2FybmluZzogY29udmVydGluZyBhIHBhY2tlZCDi
gJh2b2x1bWVfbGFiZWxfdOKAmSB7YWthIOKAmHN0cnVjdAp2b2x1bWVfbGFiZWzigJl9IHBvaW50
ZXIgKGFsaWdubWVudCAxKSB0byBhIOKAmGxhYmVsX2ludHNfdOKAmSB7YWthIOKAmHVuc2lnbmVk
IGludOKAmX0KcG9pbnRlciAoYWxpZ25tZW50IDQpIG1heSByZXN1bHQgaW4gYW4gdW5hbGlnbmVk
IHBvaW50ZXIgdmFsdWUKWy1XYWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVyXQogIDIwNiB8ICAgbGFi
ZWxfaW50c190ICpsYWJlbCA9IChsYWJlbF9pbnRzX3QgKikgJnZsYWJlbDsKICAgICAgfCAgIF5+
fn5+fn5+fn5+fgoKQXMgdm9sdW1lX2xhYmVsX3QgaXMgb25seSB1c2VkIGluIHJlYWRfZGFzZF9w
dCgpLCBhbmQgZmlsbGVkIHdpdGggbWVtY3B5KCksCmluY3JlYXNpbmcgaXRzIGFsaWdubWVudCBz
aG91bGQgYmUgc2FmZS4KClNpZ25lZC1vZmYtYnk6IE1hcnRpbiBXaWxjayA8bXdpbGNrQHN1c2Uu
Y29tPgotLS0KIGtwYXJ0eC9kYXNkLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9rcGFydHgvZGFzZC5oIGIva3BhcnR4
L2Rhc2QuaAppbmRleCA3NDlhZjQ5YS4uOGFkNWQ2MjAgMTAwNjQ0Ci0tLSBhL2twYXJ0eC9kYXNk
LmgKKysrIGIva3BhcnR4L2Rhc2QuaApAQCAtNjgsNyArNjgsNyBAQCB0eXBlZGVmIHN0cnVjdCB2
b2x1bWVfbGFiZWwKIAljaGFyIHJlczNbMjhdOwkgICAgICAgIC8qIHJlc2VydmVkICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICovCiAJdWludDhfdCBsZGxfdmVyc2lvbjsgICAgLyog
dmVyc2lvbiBudW1iZXIsIHZhbGlkIGZvciBsZGwgZm9ybWF0ICAgICAgKi8KIAl1aW50NjRfdCBm
b3JtYXR0ZWRfYmxvY2tzOyAvKiB2YWxpZCB3aGVuIGxkbF92ZXJzaW9uID49IGYyICAgICAgICAg
ICAqLwotfSBfX2F0dHJpYnV0ZV9fICgocGFja2VkKSkgdm9sdW1lX2xhYmVsX3Q7Cit9IF9fYXR0
cmlidXRlX18gKChwYWNrZWQsIGFsaWduZWQoX19hbGlnbm9mX18oaW50KSkpKSB2b2x1bWVfbGFi
ZWxfdDsKIAogCiB0eXBlZGVmIHN0cnVjdCBleHRlbnQKLS0gCjIuMjEuMAoKLS0KZG0tZGV2ZWwg
bWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

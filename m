Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B0A38AF8
	for <lists+dm-devel@lfdr.de>; Fri,  7 Jun 2019 15:10:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48C9030872E9;
	Fri,  7 Jun 2019 13:09:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F18082268;
	Fri,  7 Jun 2019 13:09:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AAF3318433A0;
	Fri,  7 Jun 2019 13:09:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x57D6rJn000404 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Jun 2019 09:06:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E27E58189F; Fri,  7 Jun 2019 13:06:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBAB282703;
	Fri,  7 Jun 2019 13:06:49 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 226EF3082145;
	Fri,  7 Jun 2019 13:06:14 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 07 Jun 2019 07:06:06 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  7 Jun 2019 15:05:23 +0200
Message-Id: <20190607130552.13203-2-mwilck@suse.com>
In-Reply-To: <20190607130552.13203-1-mwilck@suse.com>
References: <20190607130552.13203-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Fri, 07 Jun 2019 13:06:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 07 Jun 2019 13:06:40 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 01/30] kpartx: dasd: fix
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 07 Jun 2019 13:10:02 +0000 (UTC)

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

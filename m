Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0100A1540D0
	for <lists+dm-devel@lfdr.de>; Thu,  6 Feb 2020 10:01:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580979710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=iubABbBwuuJNxlPlxCSI4QzrN8sl5R8YAK4qzwJhJfQ=;
	b=EL4tiFDzZv32vYHgq8IeFoV6eCaVUMPG4z/Cs12tCNY3Oi+DoFKBGS9Exf8QkEDm5XMXfM
	kSiSmfbO1+XpX4AV01Hrz8Aopoa6fyV0h6QRbs4Nz1NPh8mo1YZDn+n/NoOf4uYw0PcglL
	N/91Qr0B3VPmQc5y4cMogaH68EsK4TY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-u7b4gmq7MB60Wn5q0hTlBQ-1; Thu, 06 Feb 2020 04:01:48 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64A90DB2A;
	Thu,  6 Feb 2020 09:01:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 119091001B07;
	Thu,  6 Feb 2020 09:01:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A26C8173C;
	Thu,  6 Feb 2020 09:01:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015BHvSO003516 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 06:17:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5588D1C94B; Wed,  5 Feb 2020 11:17:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8F3819C7F;
	Wed,  5 Feb 2020 11:17:52 +0000 (UTC)
Received: from zmail22.collab.prod.int.phx2.redhat.com
	(zmail22.collab.prod.int.phx2.redhat.com [10.5.83.26])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F97781744;
	Wed,  5 Feb 2020 11:17:52 +0000 (UTC)
Date: Wed, 5 Feb 2020 06:17:51 -0500 (EST)
Message-ID: <1468edc8-257f-4ded-b61d-5f488266e136@email.android.com>
X-Android-Message-ID: <1468edc8-257f-4ded-b61d-5f488266e136@email.android.com>
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Importance: Normal
X-Priority: 3
X-MSMail-Priority: Normal
MIME-Version: 1.0
Thread-Topic: dm-writecache: fix allocation of devices on writecache tests
Thread-Index: ve9eVmNHheXUBjGB2eT0zwZ6WZAQJA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 06 Feb 2020 04:01:12 -0500
Cc: msnitzer@redhat.com, Joe Thornber <thornber@redhat.com>,
	Nikhil Kshirsagar <nkshirsa@redhat.com>, ejt@redhat.com,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-writecache: fix allocation of devices on
 writecache tests
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: u7b4gmq7MB60Wn5q0hTlBQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5592692372100254805=="

--===============5592692372100254805==
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9J2F1dG8nPkhhLCBuaWNlIGNhdGNoIE1pa3VsYXMhISBXaGV3IHdoYXQgYSByZWxp
ZWYuLi48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5Kb2U6IHdheSB0
byB0aXAgdGhlIHNjYWxlcyBpbiBkbS1jYWNoZSdzIGZhdm9yISA6KTwvZGl2PjwvZGl2PjxkaXYg
Y2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIEZlYiA1
LCAyMDIwIDQ6MTcgQU0sIE1pa3VsYXMgUGF0b2NrYSAmbHQ7bXBhdG9ja2FAcmVkaGF0LmNvbSZn
dDsgd3JvdGU6PGJyIHR5cGU9ImF0dHJpYnV0aW9uIiAvPjxibG9ja3F1b3RlIGNsYXNzPSJxdW90
ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3Bh
ZGRpbmctbGVmdDoxZXgiPjxwIGRpcj0ibHRyIj5IZXJlIEknbSBzZW5kaW5nIGEgcGF0Y2ggZm9y
IGRldmljZSBtYXBwZXIgdGVzdHMgc3VpdGUuIFdpdGggdGhpcyBwYXRjaCwgJiMxMzs8YnI+CnRo
ZSBjYWNoZSBpcyBhbGxvY2F0ZWQgb24gdGhlIGZhc3QgZGV2aWNlLiBJdCBwZXJmb3JtcyBzbGln
aHRseSBiZXR0ZXIgJiMxMzs8YnI+CnRoYW4gZG0tY2FjaGUgb24gdGhlIGdpdC1jaGVja291dCBi
ZW5jaG1hcms6JiMxMzs8YnI+CiYjMTM7PGJyPgpETS1DQUNIRSBnaXQgdGVzdHM6JiMxMzs8YnI+
ClNNUUNvbXBhcmlzb25UZXN0cyYjMTM7PGJyPgombmJzcDsgZ2l0X2V4dHJhY3Rfb25seV9hY3Jv
c3NfY2FjaGVfc2l6ZV9zbXEuLi5mb3JtYXR0aW5nIC4uLiYjMTM7PGJyPgpnZXR0aW5nIHJlcG8g
Li4uJiMxMzs8YnI+CkVsYXBzZWQgODkuMDcxNjU2NDogZ2l0X3ByZXBhcmUmIzEzOzxicj4KQ2hl
Y2tpbmcgb3V0IHYyLjYuMTIgLi4uJiMxMzs8YnI+CkNoZWNraW5nIG91dCB2Mi42LjEzIC4uLiYj
MTM7PGJyPgpDaGVja2luZyBvdXQgdjIuNi4xNCAuLi4mIzEzOzxicj4KRWxhcHNlZCA5OC43ODIz
Njk1NjogZXh0cmFjdCBhbGwgdmVyc2lvbnMmIzEzOzxicj4KQ2hlY2tpbmcgb3V0IHYyLjYuMTIg
Li4uJiMxMzs8YnI+CkNoZWNraW5nIG91dCB2Mi42LjEzIC4uLiYjMTM7PGJyPgpDaGVja2luZyBv
dXQgdjIuNi4xNCAuLi4mIzEzOzxicj4KRWxhcHNlZCA4MS4yNTMzOTk4NDogZXh0cmFjdCBhbGwg
dmVyc2lvbnMmIzEzOzxicj4KRWxhcHNlZCAyNzEuMjc5MDEzMDg6IGNhY2hlIHNpemUgPSAyNTYs
IHBvbGljeSA9IHNtcSYjMTM7PGJyPgpmb3JtYXR0aW5nIC4uLiYjMTM7PGJyPgpnZXR0aW5nIHJl
cG8gLi4uJiMxMzs8YnI+CkVsYXBzZWQgODAuMDU4OTIyMTI6IGdpdF9wcmVwYXJlJiMxMzs8YnI+
CkNoZWNraW5nIG91dCB2Mi42LjEyIC4uLiYjMTM7PGJyPgpDaGVja2luZyBvdXQgdjIuNi4xMyAu
Li4mIzEzOzxicj4KQ2hlY2tpbmcgb3V0IHYyLjYuMTQgLi4uJiMxMzs8YnI+CkVsYXBzZWQgODQu
OTc5MzIxNzI6IGV4dHJhY3QgYWxsIHZlcnNpb25zJiMxMzs8YnI+CiYjMTM7PGJyPgomIzEzOzxi
cj4KRE0tV1JJVEVDQUNIRSBnaXQgdGVzdHM6JiMxMzs8YnI+CkxvYWRlZCBzdWl0ZSB3cml0ZWNh
Y2hlJiMxMzs8YnI+CldyaXRlQ2FjaGVCZW5jaG1hcmtzJiMxMzs8YnI+CiZuYnNwOyBnaXRfZXh0
cmFjdF9vbmx5X2Fjcm9zc19jYWNoZV9zaXplLi4uZm9ybWF0dGluZyAuLi4mIzEzOzxicj4KZ2V0
dGluZyByZXBvIC4uLiYjMTM7PGJyPgpFbGFwc2VkIDgxLjk3NTQwNTE2OiBnaXRfcHJlcGFyZSYj
MTM7PGJyPgpDaGVja2luZyBvdXQgdjIuNi4xMiAuLi4mIzEzOzxicj4KQ2hlY2tpbmcgb3V0IHYy
LjYuMTMgLi4uJiMxMzs8YnI+CkNoZWNraW5nIG91dCB2Mi42LjE0IC4uLiYjMTM7PGJyPgpFbGFw
c2VkIDc5LjU4OTM4OTE2OiBleHRyYWN0IGFsbCB2ZXJzaW9ucyYjMTM7PGJyPgpDaGVja2luZyBv
dXQgdjIuNi4xMiAuLi4mIzEzOzxicj4KQ2hlY2tpbmcgb3V0IHYyLjYuMTMgLi4uJiMxMzs8YnI+
CkNoZWNraW5nIG91dCB2Mi42LjE0IC4uLiYjMTM7PGJyPgpFbGFwc2VkIDczLjQyMzUxODMyOiBl
eHRyYWN0IGFsbCB2ZXJzaW9ucyYjMTM7PGJyPgpFbGFwc2VkIDI0MS40NjUwMDc2ODogY2FjaGUg
c2l6ZSA9IDI1NiYjMTM7PGJyPgpmb3JtYXR0aW5nIC4uLiYjMTM7PGJyPgpnZXR0aW5nIHJlcG8g
Li4uJiMxMzs8YnI+CkVsYXBzZWQgODkuMjE3NDU4MDg6IGdpdF9wcmVwYXJlJiMxMzs8YnI+CkNo
ZWNraW5nIG91dCB2Mi42LjEyIC4uLiYjMTM7PGJyPgpDaGVja2luZyBvdXQgdjIuNi4xMyAuLi4m
IzEzOzxicj4KQ2hlY2tpbmcgb3V0IHYyLjYuMTQgLi4uJiMxMzs8YnI+CkVsYXBzZWQgNzQuNDk2
Mjg4MDQ6IGV4dHJhY3QgYWxsIHZlcnNpb25zJiMxMzs8YnI+CiYjMTM7PGJyPgomIzEzOzxicj4K
RnJvbTogTWlrdWxhcyBQYXRvY2thICZsdDttcGF0b2NrYUByZWRoYXQuY29tJmd0OyYjMTM7PGJy
PgomIzEzOzxicj4KV3JpdGVjYWNoZSB0ZXN0cyB1c2VkIHRoZSBzbG93IGRldmljZSBmb3IgYm90
aCBkYXRhIGFuZCBjYWNoZSBkZXZpY2UgLSYjMTM7PGJyPgp0aGlzIHJlc3VsdGVkIGluIGhvcnJp
YmxlIHBlcmZvcm1hbmNlLiYjMTM7PGJyPgomIzEzOzxicj4KVGhpcyBwYXRjaCBmaXhlcyBpdCwg
c28gdGhhdCB0aGUgZmFzdCBkZXZpY2UgaXMgdXNlZCBmb3IgdGhlIGNhY2hlLiYjMTM7PGJyPgom
IzEzOzxicj4KU2lnbmVkLW9mZi1ieTogTWlrdWxhcyBQYXRvY2thICZsdDttcGF0b2NrYUByZWRo
YXQuY29tJmd0OyYjMTM7PGJyPgomIzEzOzxicj4KLS0tJiMxMzs8YnI+CiBsaWIvZG10ZXN0L3dy
aXRlY2FjaGUtc3RhY2sucmIgfCZuYnNwOyZuYnNwOyAxMiArKysrKy0tLS0tLS0mIzEzOzxicj4K
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pJiMxMzs8YnI+
CiYjMTM7PGJyPgpJbmRleDogZGV2aWNlLW1hcHBlci10ZXN0LXN1aXRlL2xpYi9kbXRlc3Qvd3Jp
dGVjYWNoZS1zdGFjay5yYiYjMTM7PGJyPgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09JiMxMzs8YnI+Ci0tLSBkZXZpY2Ut
bWFwcGVyLXRlc3Qtc3VpdGUub3JpZy9saWIvZG10ZXN0L3dyaXRlY2FjaGUtc3RhY2sucmImIzk7
MjAyMC0wMi0wNSAxMDowMjo0MS4wMDAwMDAwMDAgKzAxMDAmIzEzOzxicj4KKysrIGRldmljZS1t
YXBwZXItdGVzdC1zdWl0ZS9saWIvZG10ZXN0L3dyaXRlY2FjaGUtc3RhY2sucmImIzk7MjAyMC0w
Mi0wNSAxMDowMjo0MS4wMDAwMDAwMDAgKzAxMDAmIzEzOzxicj4KQEAgLTI5LDE0ICsyOSwxMiBA
QCBjbGFzcyBXcml0ZUNhY2hlU3RhY2smIzEzOzxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IEBjYWNoZSA9IG5pbCYjMTM7PGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgQG9wdHMgPSBv
cHRzJiMxMzs8YnI+CiAmIzEzOzxicj4KLSZuYnNwOyZuYnNwOyZuYnNwOyAjQHR2bSA9IFRpbnlW
b2x1bWVNYW5hZ2VyOjpWTS5uZXcmIzEzOzxicj4KLSZuYnNwOyZuYnNwOyZuYnNwOyAjQHR2bS5h
ZGRfYWxsb2NhdGlvbl92b2x1bWUoc3NkX2RldikmIzEzOzxicj4KLSZuYnNwOyZuYnNwOyZuYnNw
OyAjQHR2bS5hZGRfdm9sdW1lKGxpbmVhcl92b2woJ3NzZCcsIGNhY2hlX3NpemUgPT0gOmFsbCA/
IEB0dm0uZnJlZV9zcGFjZSA6IGNhY2hlX3NpemUpKSYjMTM7PGJyPgorJm5ic3A7Jm5ic3A7Jm5i
c3A7IEB0dm0gPSBUaW55Vm9sdW1lTWFuYWdlcjo6Vk0ubmV3JiMxMzs8YnI+CismbmJzcDsmbmJz
cDsmbmJzcDsgQHR2bS5hZGRfYWxsb2NhdGlvbl92b2x1bWUoc3NkX2RldikmIzEzOzxicj4KKyZu
YnNwOyZuYnNwOyZuYnNwOyBAdHZtLmFkZF92b2x1bWUobGluZWFyX3ZvbCgnc3NkJywgY2FjaGVf
c2l6ZSA9PSA6YWxsID8gQHR2bS5mcmVlX3NwYWNlIDogY2FjaGVfc2l6ZSkpJiMxMzs8YnI+CiAm
IzEzOzxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEBkYXRhX3R2bSA9IFRpbnlWb2x1bWVN
YW5hZ2VyOjpWTS5uZXcmIzEzOzxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEBkYXRhX3R2
bS5hZGRfYWxsb2NhdGlvbl92b2x1bWUoc3BpbmRsZV9kZXYpJiMxMzs8YnI+Ci0mIzEzOzxicj4K
LSZuYnNwOyZuYnNwOyZuYnNwOyBAZGF0YV90dm0uYWRkX3ZvbHVtZShsaW5lYXJfdm9sKCdzc2Qn
LCBjYWNoZV9zaXplID09IDphbGwgPyBAdHZtLmZyZWVfc3BhY2UgOiBjYWNoZV9zaXplKSkmIzEz
Ozxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEBkYXRhX3R2bS5hZGRfdm9sdW1lKGxpbmVh
cl92b2woJ29yaWdpbicsIG9yaWdpbl9zaXplID09IDphbGwgPyBAZGF0YV90dm0uZnJlZV9zcGFj
ZSA6IG9yaWdpbl9zaXplKSkmIzEzOzxicj4KJm5ic3A7Jm5ic3A7IGVuZCYjMTM7PGJyPgogJiMx
Mzs8YnI+CkBAIC01Myw3ICs1MSw3IEBAIGNsYXNzIFdyaXRlQ2FjaGVTdGFjayYjMTM7PGJyPgom
bmJzcDsmbmJzcDsgZW5kJiMxMzs8YnI+CiAmIzEzOzxicj4KJm5ic3A7Jm5ic3A7IGRlZiBhY3Rp
dmF0ZV9zdXBwb3J0X2RldnMoJmFtcDtibG9jaykmIzEzOzxicj4KLSZuYnNwOyZuYnNwOyZuYnNw
OyB3aXRoX2RldnMoQGRhdGFfdHZtLnRhYmxlKCdzc2QnKSwmIzEzOzxicj4KKyZuYnNwOyZuYnNw
OyZuYnNwOyB3aXRoX2RldnMoQHR2bS50YWJsZSgnc3NkJyksJiMxMzs8YnI+CiZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyBAZGF0YV90dm0udGFibGUoJ29yaWdpbicpKSBkbyB8c3NkLCBvcmln
aW58JiMxMzs8YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBAc3NkID0g
c3NkJiMxMzs8YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBAb3JpZ2lu
ID0gb3JpZ2luJiMxMzs8YnI+CkBAIC03MSw3ICs2OSw3IEBAIGNsYXNzIFdyaXRlQ2FjaGVTdGFj
ayYjMTM7PGJyPgombmJzcDsmbmJzcDsgZW5kJiMxMzs8YnI+CiAmIzEzOzxicj4KJm5ic3A7Jm5i
c3A7IGRlZiBhY3RpdmF0ZSgmYW1wO2Jsb2NrKSYjMTM7PGJyPgotJm5ic3A7Jm5ic3A7Jm5ic3A7
IHdpdGhfZGV2cyhAZGF0YV90dm0udGFibGUoJ3NzZCcpLCYjMTM7PGJyPgorJm5ic3A7Jm5ic3A7
Jm5ic3A7IHdpdGhfZGV2cyhAdHZtLnRhYmxlKCdzc2QnKSwmIzEzOzxicj4KJm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IEBkYXRhX3R2bS50YWJsZSgnb3JpZ2luJykpIGRvIHxzc2QsIG9yaWdp
bnwmIzEzOzxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEBzc2QgPSBz
c2QmIzEzOzxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEBvcmlnaW4g
PSBvcmlnaW4mIzEzOzxicj4KPC9wPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2Pg==
--===============5592692372100254805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============5592692372100254805==--


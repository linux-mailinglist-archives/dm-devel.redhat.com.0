Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id DA329191BA1
	for <lists+dm-devel@lfdr.de>; Tue, 24 Mar 2020 22:04:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585083877;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qtWKTZarAqZzl50nB5z+Qvmr8oqG2KFUS9khfYxDxKM=;
	b=CdFrhpWnZpI1VLVyV6ej/aAtEAUrHP8A33j43lkCzFLK3yCD75x9tD63ylcA0dZYUWwwn8
	l11nFBFSgiiT92X696B252mEDeeK3RNgfeZRxRzSCuKrFEo4yC6rTXokK3mntxT0R8xbQC
	kqHFcO8A64kDHbTqOaH3VfosLrf3wq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-NZ3S1axHPKuIairVq2tnwg-1; Tue, 24 Mar 2020 17:04:32 -0400
X-MC-Unique: NZ3S1axHPKuIairVq2tnwg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0908E18B9F73;
	Tue, 24 Mar 2020 21:04:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BA405D9C5;
	Tue, 24 Mar 2020 21:04:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFF0B944B4;
	Tue, 24 Mar 2020 21:04:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02OL3x0X006556 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 17:03:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DE857E324; Tue, 24 Mar 2020 21:03:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89264BBBE5;
	Tue, 24 Mar 2020 21:03:56 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02OL3t7Y014275; 
	Tue, 24 Mar 2020 16:03:55 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02OL3swP014274;
	Tue, 24 Mar 2020 16:03:54 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 24 Mar 2020 16:03:52 -0500
Message-Id: <1585083834-14237-1-git-send-email-bmarzins@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/3] libmultipath: assign variable to make gcc
	happy
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlcmUgaXMgbm90aGluZyB3cm9uZyB3aXRoIGlzX3F1ZXVlaW5nIG5vdCBiZWluZyBzZXQgYXQg
dGhlIHN0YXJ0Cm9mIF9fc2V0X25vX3BhdGhfcmV0cnkoKSwgaXQgd2lsbCBhbHdheXMgZ2V0IHNl
dCBiZWZvcmUgaXQgaXMgYWNjZXNzZWQsCmJ1dCBnY2MgOC4yLjEgaXMgZmFpbGluZyB3aXRoCgpz
dHJ1Y3RzX3ZlYy5jOiBJbiBmdW5jdGlvbiDigJhfX3NldF9ub19wYXRoX3JldHJ54oCZOgpzdHJ1
Y3RzX3ZlYy5jOjMzOTo3OiBlcnJvcjog4oCYaXNfcXVldWVpbmfigJkgbWF5IGJlIHVzZWQgdW5p
bml0aWFsaXplZCBpbgp0aGlzIGZ1bmN0aW9uIFstV2Vycm9yPW1heWJlLXVuaW5pdGlhbGl6ZWRd
CiAgYm9vbCBpc19xdWV1ZWluZzsKICAgICAgIF5+fn5+fn5+fn5+CgpzbywgYXNzaWduIGEgdmFs
dWUgdG8gbWFrZSBpdCBoYXBweS4KClNpZ25lZC1vZmYtYnk6IEJlbmphbWluIE1hcnppbnNraSA8
Ym1hcnppbnNAcmVkaGF0LmNvbT4KLS0tCiBsaWJtdWx0aXBhdGgvc3RydWN0c192ZWMuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2xpYm11bHRpcGF0aC9zdHJ1Y3RzX3ZlYy5jIGIvbGlibXVsdGlwYXRoL3N0cnVjdHNf
dmVjLmMKaW5kZXggM2RiYmFhMGYuLjA3N2YyZTQyIDEwMDY0NAotLS0gYS9saWJtdWx0aXBhdGgv
c3RydWN0c192ZWMuYworKysgYi9saWJtdWx0aXBhdGgvc3RydWN0c192ZWMuYwpAQCAtMzM2LDcg
KzMzNiw3IEBAIHN0YXRpYyB2b2lkIGxlYXZlX3JlY292ZXJ5X21vZGUoc3RydWN0IG11bHRpcGF0
aCAqbXBwKQogCiB2b2lkIF9fc2V0X25vX3BhdGhfcmV0cnkoc3RydWN0IG11bHRpcGF0aCAqbXBw
LCBib29sIGNoZWNrX2ZlYXR1cmVzKQogewotCWJvb2wgaXNfcXVldWVpbmc7CisJYm9vbCBpc19x
dWV1ZWluZyA9IGZhbHNlOyAvKiBhc3NpZ24gYSB2YWx1ZSB0byBtYWtlIGdjYyBoYXBweSAqLwog
CiAJY2hlY2tfZmVhdHVyZXMgPSBjaGVja19mZWF0dXJlcyAmJiBtcHAtPmZlYXR1cmVzICE9IE5V
TEw7CiAJaWYgKGNoZWNrX2ZlYXR1cmVzKQotLSAKMi4xNy4yCgotLQpkbS1kZXZlbCBtYWlsaW5n
IGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vZG0tZGV2ZWw=


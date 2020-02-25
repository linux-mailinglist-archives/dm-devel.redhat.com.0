Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BE07116EC22
	for <lists+dm-devel@lfdr.de>; Tue, 25 Feb 2020 18:10:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582650609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ewfar+rmMMGKoBkSRSrzFNXocYQ7FuqQTONXFIF/Aq8=;
	b=B695Boaw70QM+VMEkK6QLGYxPZaQm2keK8iyv9KIKMEIFvYNqyQNTVVykchVk0JGEml8r8
	4JfkI7/7f6nF/Xi+br3tgEF2rcXbb0WMvsDtLhEr4TECMND4O3RvSdPUd0Ln20jy+Zjkyk
	H7GUC/iICyGF8W1DjltbOkS1PqHd65c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-Q5NAX-vNOXOJmksQF3UN6Q-1; Tue, 25 Feb 2020 12:10:05 -0500
X-MC-Unique: Q5NAX-vNOXOJmksQF3UN6Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8855F108442C;
	Tue, 25 Feb 2020 17:09:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC2265C13D;
	Tue, 25 Feb 2020 17:09:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BB5D1803C37;
	Tue, 25 Feb 2020 17:09:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PH9hjN024957 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 12:09:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D828CF18BE; Tue, 25 Feb 2020 17:09:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4456F496A
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 17:09:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6181101A55D
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 17:09:41 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [188.40.240.192]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-23-P-AJerqAPVmJYhfwedzWzQ-1;
	Tue, 25 Feb 2020 12:09:35 -0500
X-MC-Unique: P-AJerqAPVmJYhfwedzWzQ-1
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id B27595F906;
	Tue, 25 Feb 2020 18:09:32 +0100 (CET)
From: =?UTF-8?q?Daniel=20Gl=C3=B6ckner?= <dg@emlix.com>
To: Mike Snitzer <snitzer@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>
Date: Tue, 25 Feb 2020 18:07:44 +0100
Message-Id: <20200225170744.10485-1-dg@emlix.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01PH9hjN024957
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	=?UTF-8?q?Daniel=20Gl=C3=B6ckner?= <dg@emlix.com>
Subject: [dm-devel] [PATCH] dm integrity: reinitialize __bi_remaining when
	reusing bio
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SW4gY2FzZXMgd2hlcmUgZGVjX2luX2ZsaWdodCBoYXMgdG8gcmVxdWV1ZSB0aGUgaW50ZWdyaXR5
X2Jpb193YWl0IHdvcmsKdG8gdHJhbnNmZXIgdGhlIHJlc3Qgb2YgdGhlIGRhdGEsIHRoZSBfX2Jp
X3JlbWFpbmluZyBmaWVsZCBvZiB0aGUgYmlvCm1pZ2h0IGFscmVhZHkgaGF2ZSBiZWVuIGRlY3Jl
bWVudGVkIHRvIHplcm8uIFJldXNpbmcgdGhlIGJpbyB3aXRob3V0CnJlaW5pdGlhbGl6aW5nIHRo
YXQgY291bnRlciB0byAxIGNhbiB0aGVuIHJlc3VsdCBpbiBpbnRlZ3JpdHlfZW5kX2lvCmJlaW5n
IGNhbGxlZCB0b28gZWFybHkgd2hlbiB0aGUgQklPX0NIQUlOIGZsYWcgaXMgc2V0LCBmLmV4LiBk
dWUgdG8KYmxrX3F1ZXVlX3NwbGl0LiBJbiBvdXIgY2FzZSB0aGlzIHRyaWdnZXJlZCB0aGUgQlVH
KCkgaW4KYmxrX21xX2VuZF9yZXF1ZXN0IHdoZW4gdGhlIGhhcmR3YXJlIHNpZ25hbGxlZCBjb21w
bGV0aW9uIG9mIHRoZSBiaW8KYWZ0ZXIgaW50ZWdyaXR5X2VuZF9pbyBoYWQgbW9kaWZpZWQgaXQu
CgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgR2zDtmNrbmVyIDxkZ0BlbWxpeC5jb20+Ci0tLQogZHJp
dmVycy9tZC9kbS1pbnRlZ3JpdHkuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS1pbnRlZ3JpdHkuYyBiL2RyaXZlcnMvbWQv
ZG0taW50ZWdyaXR5LmMKaW5kZXggYjIyNWIzZTQ0NWZhLi44Y2VhMjk3OGZjMjQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvbWQvZG0taW50ZWdyaXR5LmMKKysrIGIvZHJpdmVycy9tZC9kbS1pbnRlZ3Jp
dHkuYwpAQCAtMTQzOCw2ICsxNDM4LDcgQEAgc3RhdGljIHZvaWQgZGVjX2luX2ZsaWdodChzdHJ1
Y3QgZG1faW50ZWdyaXR5X2lvICpkaW8pCiAJCWlmIChsaWtlbHkoIWJpby0+Ymlfc3RhdHVzKSAm
JiB1bmxpa2VseShiaW9fc2VjdG9ycyhiaW8pICE9IGRpby0+cmFuZ2Uubl9zZWN0b3JzKSkgewog
CQkJZGlvLT5yYW5nZS5sb2dpY2FsX3NlY3RvciArPSBkaW8tPnJhbmdlLm5fc2VjdG9yczsKIAkJ
CWJpb19hZHZhbmNlKGJpbywgZGlvLT5yYW5nZS5uX3NlY3RvcnMgPDwgU0VDVE9SX1NISUZUKTsK
KwkJCWF0b21pY19zZXQoJmJpby0+X19iaV9yZW1haW5pbmcsIDEpOwogCQkJSU5JVF9XT1JLKCZk
aW8tPndvcmssIGludGVncml0eV9iaW9fd2FpdCk7CiAJCQlxdWV1ZV93b3JrKGljLT53YWl0X3dx
LCAmZGlvLT53b3JrKTsKIAkJCXJldHVybjsKLS0gCjIuMTcuMQoKCi0tCmRtLWRldmVsIG1haWxp
bmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kbS1kZXZlbA==


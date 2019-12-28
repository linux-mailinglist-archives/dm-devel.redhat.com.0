Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 69E3F12BBE7
	for <lists+dm-devel@lfdr.de>; Sat, 28 Dec 2019 01:26:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577492790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PqQBdI0NInx0Eb7o/pF75BY/2aK7ZA8UScEM3pd8tJo=;
	b=E6krmChPcEh+Om734kvK/7fhZgN8a1bopwLaIxRziSUHJoUJvlB7oSCk6e6httsQwvVVyu
	ScEqxz9nVJru07+zZypPfY3gmp3GKzhZfQOKH4O+D/cV0vOHF1DTjv5eepuqBplkKW9Nhn
	LQMpyfZxbZQ8MK7xJq0HQ0peLkqFrH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-qY2PvRMkN_ueXCrasD8Fow-1; Fri, 27 Dec 2019 19:26:27 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E92C107ACC4;
	Sat, 28 Dec 2019 00:26:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B005A1081318;
	Sat, 28 Dec 2019 00:26:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF4614E16F;
	Sat, 28 Dec 2019 00:25:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBS0PauM020415 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Dec 2019 19:25:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 21E01B5791; Sat, 28 Dec 2019 00:25:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C75B8FB11
	for <dm-devel@redhat.com>; Sat, 28 Dec 2019 00:25:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B16668F6162
	for <dm-devel@redhat.com>; Sat, 28 Dec 2019 00:25:33 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-425-RjngyTUBOa-2974kQ9e5BA-1; Fri, 27 Dec 2019 19:25:31 -0500
Received: by mail-ed1-f46.google.com with SMTP id c26so26807731eds.8
	for <dm-devel@redhat.com>; Fri, 27 Dec 2019 16:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TJQbbPefZlxS5DcIgEeha7GKHhInYNHL5rPCPokNLcc=;
	b=BGQo4n/iENyRi/Sjcg76omEb2MCN0TVyIA8HgieBH+xf8tnywHXIuuzkPRadVVmnZQ
	v3/QyG/uoSUS4xirbeTO6aF2+es3bwR80e+pHndxzjw93ooSOde2ATNeXJnS4FZlsnze
	4WTwE/Qt2hMxggH8ENZrAzwReUiuzLfzbLUyQeQg+cgi5+Kf1ioaa8pLrMlDfRlTu6eE
	izAmM6GK0MJmzaabNMiYlYco3Jx5Z3Ykx4iVrmKkOEjtSTU8ea/VHiQDoDueg+ucO+lm
	IPG9z0PVH8g7h+OpEr3xVW9rT6IpEEed9PxNUEkYldy3+JlGTkhypJBsDlyXkvyjS3sp
	7d9Q==
X-Gm-Message-State: APjAAAV98XI2gBSJyVHxIYKPDp+BXuSPI/OlyLPXS3LVjZ9ju/tC0ENz
	HEziAVZZrRrugDu45MUaqg==
X-Google-Smtp-Source: APXvYqy0sJx9OS7R9g7nWd2aSM5OUJcSusxBlOtNIWZd4yh9zULLqXMjziAdxecoEcjtbVS37vkMBg==
X-Received: by 2002:a05:6402:1804:: with SMTP id
	g4mr40631554edy.78.1577492730469; 
	Fri, 27 Dec 2019 16:25:30 -0800 (PST)
Received: from localhost (232.red-95-127-150.staticip.rima-tde.net.
	[95.127.150.232]) by smtp.gmail.com with ESMTPSA id
	q11sm4300910ejt.64.2019.12.27.16.25.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 16:25:30 -0800 (PST)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Sat, 28 Dec 2019 01:24:51 +0100
Message-Id: <20191228002451.9536-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-MC-Unique: RjngyTUBOa-2974kQ9e5BA-1
X-MC-Unique: qY2PvRMkN_ueXCrasD8Fow-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBS0PauM020415
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Brian Bunker <brian@purestorage.com>
Subject: [dm-devel] [PATCH resend] ALUA support for PURE FlashArray
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RnJvbTogQnJpYW4gQnVua2VyIDxicmlhbkBwdXJlc3RvcmFnZS5jb20+CgpIZWxsbyBhbGwsCgpJ
dCBoYXMgYmVlbiBzb21lIHRpbWUgc2luY2Ugd2UgdXBkYXRlZCBvdXIgUFVSRSBGbGFzaEFycmF5
CmNvbmZpZ3VyYXRpb24uIFRoZSBMaW51eCB2ZW5kb3JzIHRoYXQgd2UgaGFkIGJlZW4gc2VlaW5n
IGluIHRoZSBmaWVsZAp3ZXJlIHVzaW5nIHZlcnkgb2xkIHZlcnNpb25zIG9mIG11bHRpcGF0aC10
b29scywgc28gd2UgaGF2ZW7igJl0IG5lZWRlZCB0bwpjaGFuZ2UgYW55dGhpbmcgZm9yIHNvbWUg
dGltZS4gV2l0aCB0aGUgcmVsZWFzZSBvZiBSSEVMOCwgc29tZSBvZiBvdXIKZWFybGllciB2YWx1
ZXMgaGF2ZSBiZWVuIGxvc3QgYnkgdXBzdHJlYW0gY2hhbmdlcy4KCkluIGFkZGl0aW9uIHdlIGhh
dmUgb3VyIEFjdGl2ZSBDbHVzdGVyIGZlYXR1cmUgd2hpY2ggbGV2ZXJhZ2VzIEFMVUEKc2luY2Ug
b3VyIGxhc3QgcGF0Y2guIFRoZSBBTFVBIGNvbmZndXJhdGlvbiB3aWxsIHdvcmsgZm9yIGFsbApG
bGFzaEFycmF5cyB3aXRoIG9yIHdpdGhvdXQgQWN0aXZlIENsdXN0ZXIuCgpXZSBhcmUgY2hhbmdp
bmcgMyB0aGluZ3MuCgoxLiBBTFVBIHN1cHBvcnQKMi4gRmFzdCBmYWlsIHRpbWVvdXQgZnJvbSB0
aGUgZGVmYXVsdCBvZiA1IHNlY29uZHMgdG8gMTAgc2Vjb25kcyAoV2UKICAgbmVlZCB0aGlzIGZv
ciBvdXIgRkMgTlBJViBwb3J0IG1pZ3JhdGlvbikuCjMuIE1heGltdW0gc2VjdG9yIHNpemUgb2Yg
NE1CLiBTb21lIExpbnV4IHZlbmRvcnMgZG9u4oCZdCBob25vciB0aGUgYmxvY2sKICAgbGltaXRz
IFZQRCBwYWdlIG9mIElOUVVJUlkpLgoKVGhhbmtzLApCcmlhbgoKQ2M6IENocmlzdG9waGUgVmFy
b3F1aSA8Y2hyaXN0b3BoZS52YXJvcXVpQG9wZW5zdmMuY29tPgpDYzogRE0tREVWRUwgTUwgPGRt
LWRldmVsQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFhvc2UgVmF6cXVleiBQZXJleiA8eG9z
ZS52YXpxdWV6QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogQnJpYW4gQnVua2VyIDxicmlhbkBw
dXJlc3RvcmFnZS5jb20+Ci0tLQogbGlibXVsdGlwYXRoL2h3dGFibGUuYyB8IDcgKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2xpYm11bHRpcGF0aC9od3RhYmxlLmMgYi9saWJtdWx0aXBhdGgvaHd0YWJsZS5jCmluZGV4
IDE2NjI3ZWMuLjliYzU5ZjEgMTAwNjQ0Ci0tLSBhL2xpYm11bHRpcGF0aC9od3RhYmxlLmMKKysr
IGIvbGlibXVsdGlwYXRoL2h3dGFibGUuYwpAQCAtMTAzOSw3ICsxMDM5LDEyIEBAIHN0YXRpYyBz
dHJ1Y3QgaHdlbnRyeSBkZWZhdWx0X2h3W10gPSB7CiAJCS8qIEZsYXNoQXJyYXkgKi8KIAkJLnZl
bmRvciAgICAgICAgPSAiUFVSRSIsCiAJCS5wcm9kdWN0ICAgICAgID0gIkZsYXNoQXJyYXkiLAot
CQkucGdwb2xpY3kgICAgICA9IE1VTFRJQlVTLAorCQkucGdwb2xpY3kgICAgICA9IEdST1VQX0JZ
X1BSSU8sCisJCS5wZ2ZhaWxiYWNrICAgID0gLUZBSUxCQUNLX0lNTUVESUFURSwKKwkJLmh3aGFu
ZGxlciAgICAgPSAiMSBhbHVhIiwKKwkJLnByaW9fbmFtZSAgICAgPSBQUklPX0FMVUEsCisJCS5m
YXN0X2lvX2ZhaWwgID0gMTAsCisJCS5tYXhfc2VjdG9yc19rYiA9IDQwOTYsCiAJfSwKIAkvKgog
CSAqIEh1YXdlaQotLSAKMi4yNC4xCgpCcmlhbiBCdW5rZXIKU1cgRW5nCmJyaWFuQHB1cmVzdG9y
YWdlLmNvbQoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0
dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==


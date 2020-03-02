Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B6C2A175DA4
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 15:54:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583160871;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PqQBdI0NInx0Eb7o/pF75BY/2aK7ZA8UScEM3pd8tJo=;
	b=HW+BlVWbLR9kA4KMSXvcocxs9E5ZraDzcfXHtWW8H9JmmqosOwAT/UuMuqKE/f96NU/H5N
	6h4N4RRCraCUqEbNdBS/eS6LTInkx1nZo1TRK2K0G/lm5esNGwO9Pgprua5Oo+kdQTnts4
	ucbvDg7r9wzNJ+nN4YzriK87qaXa3SU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-QYHtmK1uOLKnQJHwqKl2Ww-1; Mon, 02 Mar 2020 09:54:29 -0500
X-MC-Unique: QYHtmK1uOLKnQJHwqKl2Ww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08928800D4E;
	Mon,  2 Mar 2020 14:54:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 604A65C1B0;
	Mon,  2 Mar 2020 14:54:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80B7035AE1;
	Mon,  2 Mar 2020 14:54:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022Es4ni007866 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 09:54:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1B8262166B2B; Mon,  2 Mar 2020 14:54:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16B752166B2E
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 14:54:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51478185A78E
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 14:54:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-425-pvtnVABUPfy8ArHuYQUmkg-1; Mon, 02 Mar 2020 09:53:58 -0500
X-MC-Unique: pvtnVABUPfy8ArHuYQUmkg-1
Received: by mail-wm1-f49.google.com with SMTP id a141so10940716wme.2
	for <dm-devel@redhat.com>; Mon, 02 Mar 2020 06:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TJQbbPefZlxS5DcIgEeha7GKHhInYNHL5rPCPokNLcc=;
	b=UErxnnPyGS2x/WRUdQrmaWSucNj/tUSXaWEtel0rUCTj2PgfU0vsx/j0tyFuP5y3bY
	s6SZR7G+6IWL3C7rrGXX8zmzRdYeCwmz/0APHv20DSwy/AVjov96okkbYTcmJz3w9xSD
	Ty3cnz7sjigBO/7rEDgk/i0e/bZ7reGN+9BPcQ4Rf7dvlnBf78PZqzINKMxGPSxU5kOf
	qiQH250b9ayNA/ojLvySWc1dyeYLVOI68lB7DygTc/kLuDhGn7I26luS8eElwBB02iKn
	RyOi5M9i+7nDPDqt9taU0D7OL6H5lcCWe0rC+N0Ys4p59r/nCjTQoIRVSGHOOsPTm3Pq
	Ly4w==
X-Gm-Message-State: APjAAAXF/4hm2Q/CMhQ+MIF7JR0dT5PTqx1WrZlwLj8c9TX8Ttfy2hgU
	ewuwnCgxJ5KGolH4jt+7ew==
X-Google-Smtp-Source: APXvYqz9NzJWLArSW4pk5UyQ6aP6W+wTXT7pUnGov3YNyBVtu0ogMGdenBAQVeVeyqw0P7U9VzngAg==
X-Received: by 2002:a1c:f615:: with SMTP id w21mr19889633wmc.152.1583160837586;
	Mon, 02 Mar 2020 06:53:57 -0800 (PST)
Received: from localhost (250.red-83-37-138.dynamicip.rima-tde.net.
	[83.37.138.250]) by smtp.gmail.com with ESMTPSA id
	z12sm2021078wrs.43.2020.03.02.06.53.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Mar 2020 06:53:57 -0800 (PST)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Mon,  2 Mar 2020 15:53:54 +0100
Message-Id: <20200302145354.1352-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 022Es4ni007866
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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


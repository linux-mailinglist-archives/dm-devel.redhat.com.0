Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB0727B7B9
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 01:15:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-BWawCsT0NMuFetgLLbmvWA-1; Mon, 28 Sep 2020 19:15:15 -0400
X-MC-Unique: BWawCsT0NMuFetgLLbmvWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6221100A243;
	Mon, 28 Sep 2020 23:15:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 832DA55780;
	Mon, 28 Sep 2020 23:15:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51C3444A4B;
	Mon, 28 Sep 2020 23:14:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SNEakC006701 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 19:14:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7CEC201E72B; Mon, 28 Sep 2020 23:14:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2FCA2023499
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 23:14:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C8F4800260
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 23:14:33 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-32-xQEqiHzTNdmfVUbSHXCCtg-1; Mon, 28 Sep 2020 19:14:31 -0400
X-MC-Unique: xQEqiHzTNdmfVUbSHXCCtg-1
Received: by mail-pf1-f174.google.com with SMTP id n14so2644275pff.6
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 16:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:to;
	bh=K59fzjkqmCzMscF0LvS8V7/MuYPIxnOxbzGinV4gMoM=;
	b=qv4MTodx/RQgw26s+iwenOrXZfk1Ov8okdzdJ2AyGnnOTZxJAUpPUd50Ca1dt213WT
	9NTvVVfspuGoUWEcKedrab/EWwgwSGHH8QsaAldAjGSDQW2ek+omLWVkj3HpHxcnXdW+
	Uu+cuToVVMx0AM5a/JAneieLE0Fm90ARTZROcBmVQdUuMzDOdrRne6RhgWAY/80kd1Gi
	E6xdw270RlTMSH2d/PmkgbG8HmKNFxGjTQPASGDPgjZrZCCgD+whjP+DhGNU4hJlKiiZ
	ihMLQPz7QhkwG/UPEs7B9O+Z4pjw02yX43Ea+2cewmnwEb5AZI587CP1vcv4u2u9HMN1
	qJLQ==
X-Gm-Message-State: AOAM533ilP4kuRLyNQpkZ/Qc/2VwGPjbdiAptMNih52fMs+niXq9fmVL
	aBoI92D0+pg6qhKQE/wAze9JFrBHINgS4e0UKuyuGyCbLU4VCwxfgF42ZEVGjZryUaw+bPLPj6R
	O6bwJ2dMhKFiWjLkD9Y7CVU+GQrqjjzVA2cSKVN1rftZXjZVJp88qT8YohH7zsaqNpbB2ow==
X-Google-Smtp-Source: ABdhPJz8LkKRnx4sJYSiBr9CtS01RTQYp8WEWxcJWH4zsvvF4DQ7POZyrSeyQegKT2sSb+hV7KnqFQ==
X-Received: by 2002:aa7:8e54:0:b029:142:2501:34d2 with SMTP id
	d20-20020aa78e540000b0290142250134d2mr1411058pfr.43.1601334869197;
	Mon, 28 Sep 2020 16:14:29 -0700 (PDT)
Received: from localhost.localdomain (vpn.purestorage.com. [192.30.189.1])
	by smtp.gmail.com with ESMTPSA id
	w203sm2850421pfc.97.2020.09.28.16.14.28 for <dm-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Sep 2020 16:14:28 -0700 (PDT)
From: Brian Bunker <brian@purestorage.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.0.3.2.33\))
Message-Id: <D7BC3D02-400E-4F70-9A61-6E959F5AE5A5@purestorage.com>
Date: Mon, 28 Sep 2020 16:14:27 -0700
To: device-mapper development <dm-devel@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08SNEakC006701
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] libmultipath: Extract the LUN number for
 peripheral, flat, and logical unit address methods
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rm9yIExVTnMgYmV0d2VlbiAwIGFuZCAyNTUgcGVyaXBoZXJhbCBhZGRyZXNzaW5nIGlzIHVzZWQu
IEZvciBMVU5zIGhpZ2hlciB0aGFuIDI1NSB0aGUgTFVOIGFkZHJlc3NpbmcKc2hvdWxkIHN3aXRj
aCB0byBmbGF0IGFjY29yZGluZyB0byB0aGUgc3BlY2lmaWNhdGlvbi4gSW5zdGVhZCBvZiBwcmlu
dGluZyBvdXQgdGhlIExVTiBudW1iZXIgd2l0aG91dCByZWdhcmQgdG8KdGhlIHNoaWZ0aW5nIG9m
IGFkZHJlc3MgbWV0aG9kLCBkaXNwbGF5IHRoZSBMVU4gYXMgaXQgd2FzIGludGVuZGVkIHRvIGJl
IHRoZSB1c2VyIGNvbm5lY3RpbmcgdGhlIExVTi4gVGhlCmN1cnJlbnQgZGlzcGxheSBsZWF2ZXMg
YSBub24tb2J2aW91cyAxNjM4NCBvZmZzZXQuCgpJbiBzaG9ydCwgYSBMVU4gY29ubmVjdGVkIGFz
IDI1OCB3aWxsIHNob3cgdXAgaW4gbXVsdGlwYXRoIG91dHB1dCBhcyAxNjY0Mi4gSW5zdGVhZCBk
aXNwbGF5IGl0IGFzIHRoZQpleHBlY3RlZCAyNTguIFRoaXMgaXMgZm9yIGRpc3BsYXkgb25seSBh
bmQgZG9lc27igJl0IGNoYW5nZSB0aGUgYWN0dWFsIGNvbnRlbnRzIG9mIHRoZSBMVU4gdmFyaWFi
bGUuCgpTaWduZWQtb2ZmLWJ5OiBCcmlhbiBCdW5rZXIgPGJyaWFuQHB1cmVzdG9yYWdlLmNvbT4K
X19fCmRpZmYgLU5hdXIgYS9tdWx0aXBhdGgtdG9vbHMtMC44LjMvbGlibXVsdGlwYXRoL3ByaW50
LmMgYi9tdWx0aXBhdGgtdG9vbHMtMC44LjMvbGlibXVsdGlwYXRoL3ByaW50LmMKLS0tIGEvbGli
bXVsdGlwYXRoL3ByaW50LmMgICAgICAyMDIwLTA5LTI0IDEzOjUyOjE4LjY2MTgyODAxMSAtMDYw
MAorKysgYi9saWJtdWx0aXBhdGgvcHJpbnQuYyAgICAgIDIwMjAtMDktMjggMTY6NTc6MzcuOTU2
MjIyMjU4IC0wNjAwCkBAIC0yOSw2ICsyOSw3IEBACiAjaW5jbHVkZSAidWV2ZW50LmgiCiAjaW5j
bHVkZSAiZGVidWcuaCIKICNpbmNsdWRlICJkaXNjb3ZlcnkuaCIKKyNpbmNsdWRlICJ1dGlsLmgi
CiAKICNkZWZpbmUgTUFYKHgseSkgKCgoeCkgPiAoeSkpID8gKHgpIDogKHkpKQogI2RlZmluZSBN
SU4oeCx5KSAoKCh4KSA+ICh5KSkgPyAoeSkgOiAoeCkpCkBAIC0zOTAsMTEgKzM5MSwxMiBAQAog
ICAgICAgIGlmICghcHAgfHwgcHAtPnNnX2lkLmhvc3Rfbm8gPCAwKQogICAgICAgICAgICAgICAg
cmV0dXJuIHNucHJpbnRmKGJ1ZmYsIGxlbiwgIiM6IzojOiMiKTsKIAorICAgICAgIGludCBkaXNw
bGF5X2x1biA9IGV4dHJhY3RfbHVuX251bWJlcihwcC0+c2dfaWQubHVuKTsKICAgICAgICByZXR1
cm4gc25wcmludGYoYnVmZiwgbGVuLCAiJWk6JWk6JWk6JWkiLAogICAgICAgICAgICAgICAgICAg
ICAgICBwcC0+c2dfaWQuaG9zdF9ubywKICAgICAgICAgICAgICAgICAgICAgICAgcHAtPnNnX2lk
LmNoYW5uZWwsCiAgICAgICAgICAgICAgICAgICAgICAgIHBwLT5zZ19pZC5zY3NpX2lkLAotICAg
ICAgICAgICAgICAgICAgICAgICBwcC0+c2dfaWQubHVuKTsKKyAgICAgICAgICAgICAgICAgICAg
ICAgZGlzcGxheV9sdW4pOwogfQogCiBzdGF0aWMgaW50CmRpZmYgLU5hdXIgYS9tdWx0aXBhdGgt
dG9vbHMtMC44LjMvbGlibXVsdGlwYXRoL3V0aWwuYyBiL211bHRpcGF0aC10b29scy0wLjguMy9s
aWJtdWx0aXBhdGgvdXRpbC5jCi0tLSBhL211bHRpcGF0aC10b29scy0wLjguMy9saWJtdWx0aXBh
dGgvdXRpbC5jIDIwMTktMTAtMDIgMDE6MTU6MDMuMDAwMDAwMDAwIC0wNjAwCisrKyBiL211bHRp
cGF0aC10b29scy0wLjguMy9saWJtdWx0aXBhdGgvdXRpbC5jIDIwMjAtMDktMjggMTY6NTY6MDAu
ODUxMTY5MDcwIC0wNjAwCkBAIC00NzAsMyArNDcwLDI1IEBACiB7CiAgICAgICAgY2xvc2UoKGxv
bmcpYXJnKTsKIH0KKworLyogRXh0cmFjdHMgdGhlIExVTiBudW1iZXIgZnJvbSB0aGUgYWRkcmVz
c2luZyBtZXRob2QgZm9yCisgICBwZXJpcGhlcmFsLCBmbGF0LCBhbmQgTFVOIGFkZHJlc3Npbmcg
bWV0aG9kcy4KKyAqLworaW50IGV4dHJhY3RfbHVuX251bWJlcihpbnQgbHVuKQoreworICAgICAg
IGlmIChsdW4gPiBVSU5UMTZfTUFYKQorICAgICAgICAgICAgICAgcmV0dXJuIGx1bjsKKworICAg
ICAgIHVpbnQ4X3QgYWRkcmVzc19tZXRob2QgPSAoKGx1biA+PiA4KSAmIDB4QzApID4+IDY7IC8q
IGZpcnN0IHR3byBiaXRzIG9mIHRoZSAxNiBieXRlIExVTiAqLworICAgICAgIHN3aXRjaCAoYWRk
cmVzc19tZXRob2QpIHsKKyAgICAgICAgICAgICAgIGNhc2UgMTogLyogRmxhdCBBZGRyZXNzaW5n
IG1ldGhvZCAoMDFiKSAqLworICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gbHVuIC0gMHg0
MDAwOworICAgICAgICAgICAgICAgY2FzZSAyOiAvKiBMb2dpY2FsIHVuaXQgYWRkcmVzc2luZyAo
MDJiKSAqLworICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gbHVuICYgMHgwMDFGOworICAg
ICAgICAgICAgICAgY2FzZSAwOiAvKiBQZXJpcGhlcmFsIGFkZHJlc3NpbmcgbWV0aG9kICgwMGIp
ICovCisgICAgICAgICAgICAgICAgICAgICAgIGlmIChsdW4gPiAyNTUpCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uZGxvZygzLCAiUGVyaXBoZXJhbCBhZGRyZXNzaW5nIHN1cHBv
cnRzIHVwIHRvIDI1NiBMVU5zIik7CisgICAgICAgICAgICAgICBkZWZhdWx0OgorICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gbHVuOworICAgICAgIH0KK30KZGlmZiAtTmF1ciBhL211bHRp
cGF0aC10b29scy0wLjguMy9saWJtdWx0aXBhdGgvdXRpbC5oIGIvbXVsdGlwYXRoLXRvb2xzLTAu
OC4zL2xpYm11bHRpcGF0aC91dGlsLmgKLS0tIGEvbXVsdGlwYXRoLXRvb2xzLTAuOC4zL2xpYm11
bHRpcGF0aC91dGlsLmggMjAxOS0xMC0wMiAwMToxNTowMy4wMDAwMDAwMDAgLTA2MDAKKysrIGIv
bXVsdGlwYXRoLXRvb2xzLTAuOC4zL2xpYm11bHRpcGF0aC91dGlsLmggMjAyMC0wOS0yOCAxNjo0
MzozMi42MzI4Nzk3NjMgLTA2MDAKQEAgLTIyLDYgKzIyLDcgQEAKIGludCBwYXJzZV9wcmtleV9m
bGFncyhjaGFyICpwdHIsIHVpbnQ2NF90ICpwcmtleSwgdWludDhfdCAqZmxhZ3MpOwogaW50IHNh
ZmVfd3JpdGUoaW50IGZkLCBjb25zdCB2b2lkICpidWYsIHNpemVfdCBjb3VudCk7CiB2b2lkIHNl
dF9tYXhfZmRzKGludCBtYXhfZmRzKTsKK2ludCBleHRyYWN0X2x1bl9udW1iZXIoaW50IGx1bik7
CiAKICNkZWZpbmUgS0VSTkVMX1ZFUlNJT04obWFqLCBtaW4sIHB0YykgKCgoKG1haikgKiAyNTYp
ICsgKG1pbikpICogMjU2ICsgKHB0YykpCiAjZGVmaW5lIEFSUkFZX1NJWkUoeCkgKHNpemVvZih4
KS9zaXplb2YoKHgpWzBdKSkKCkJyaWFuIEJ1bmtlcgpTVyBFbmcKYnJpYW5AcHVyZXN0b3JhZ2Uu
Y29tCgoKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRw
czovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=


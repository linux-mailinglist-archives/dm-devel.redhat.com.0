Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6986C56FB2
	for <lists+dm-devel@lfdr.de>; Wed, 26 Jun 2019 19:38:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A7D2308425B;
	Wed, 26 Jun 2019 17:38:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 157D019723;
	Wed, 26 Jun 2019 17:38:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28B41206D2;
	Wed, 26 Jun 2019 17:38:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QHbsV1009597 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 13:37:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7501B608CA; Wed, 26 Jun 2019 17:37:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BC4260852
	for <dm-devel@redhat.com>; Wed, 26 Jun 2019 17:37:50 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B2F4307D934
	for <dm-devel@redhat.com>; Wed, 26 Jun 2019 17:37:40 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d126so1730530pfd.2
	for <dm-devel@redhat.com>; Wed, 26 Jun 2019 10:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=purestorage.com; s=google;
	h=from:content-transfer-encoding:mime-version:subject:message-id:date
	:to; bh=OOBJN4PqrLyYWFxsz0e4TzPfTO3Vbao9K0PuDZ2bdLc=;
	b=EgiagHZ+WNpEyCEesqf6QYGlT5UmUXPEgeaC2pQCfeA8K5ju2iOclshWNh/Ip5p0h5
	xzl4LNZytA8X5aAoXxOpE5fuohhI5amezF0kHRgjte/smUwyAxbzKf8nVltYdRbxcICF
	D+U75P3mdA1iuQkSpFU4NORekE2qY2CEByvG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:to;
	bh=OOBJN4PqrLyYWFxsz0e4TzPfTO3Vbao9K0PuDZ2bdLc=;
	b=khgS2t9cwoNXO+knCStLP/VN3Uygu5FkT9Kbcn2vjsBlEp7s3VAzwOW4QSuGqDsbTC
	LYfC2UPcxyuF1tK+GoA8jLlrPtC5lFuITHnYq0rl7ppoxlpZsopOP4u29ZR9ro/cqbb8
	KDT4VAfUAAYleY1Esj1tiJP00QLqGT9UtF1YfLLYBoU6K+VAGzFCk0+VeenVVyVaUl2X
	+iuKMwJw3Aza+gZF34KHf2ZeeoUT/QH8pUIbaNpxP7eg75qH1/zUyDIf+9t3qLM7FeRu
	DBlm6bvDFeGjT75Z9oPileaJfItkmbIjW+fyudyjYZGnvSEXh29LsQFbeP+2W3Y1FCdm
	d/UQ==
X-Gm-Message-State: APjAAAVXSt4f+odRwTUdwbyUGFKMDwYAquTa0iJL0vWrkXIchASWsG1U
	je3exz980fT3PIzKbHhiphpeM+NNGIwkBA==
X-Google-Smtp-Source: APXvYqxWfrEmdgiJVhDKD6S1ihaZI54Cb69q9ABadqKfl93joiuF2yJJgmUf8D3jLy+7XB4W7tPylw==
X-Received: by 2002:a17:90a:2228:: with SMTP id c37mr265987pje.9.1561570658952;
	Wed, 26 Jun 2019 10:37:38 -0700 (PDT)
Received: from brians-mbp.purestorage.com ([64.84.68.252])
	by smtp.gmail.com with ESMTPSA id
	201sm27878267pfz.24.2019.06.26.10.37.38 for <dm-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jun 2019 10:37:38 -0700 (PDT)
From: Brian Bunker <brian@purestorage.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3560.7\))
Message-Id: <EF473529-CF81-4AE9-BD96-08624B59BA10@purestorage.com>
Date: Wed, 26 Jun 2019 10:37:37 -0700
To: dm-devel@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 26 Jun 2019 17:37:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Wed, 26 Jun 2019 17:37:40 +0000 (UTC) for IP:'209.85.210.175'
	DOMAIN:'mail-pf1-f175.google.com'
	HELO:'mail-pf1-f175.google.com' FROM:'brian@purestorage.com'
	RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	SPF_PASS) 209.85.210.175 mail-pf1-f175.google.com
	209.85.210.175 mail-pf1-f175.google.com <brian@purestorage.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5QHbsV1009597
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] ALUA support for PURE FlashArray
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Wed, 26 Jun 2019 17:38:55 +0000 (UTC)

SGVsbG8gYWxsLAoKSXQgaGFzIGJlZW4gc29tZSB0aW1lIHNpbmNlIHdlIHVwZGF0ZWQgb3VyIFBV
UkUgRmxhc2hBcnJheSBjb25maWd1cmF0aW9uLiBUaGUgTGludXggdmVuZG9ycyB0aGF0IHdlIGhh
ZCBiZWVuIHNlZWluZyBpbiB0aGUgZmllbGQgd2VyZSB1c2luZyB2ZXJ5IG9sZCB2ZXJzaW9ucyBv
ZiBtdWx0aXBhdGgtdG9vbHMsIHNvIHdlIGhhdmVu4oCZdCBuZWVkZWQgdG8gY2hhbmdlIGFueXRo
aW5nIGZvciBzb21lIHRpbWUuIFdpdGggdGhlIHJlbGVhc2Ugb2YgUkhFTDgsIHNvbWUgb2Ygb3Vy
IGVhcmxpZXIgdmFsdWVzIGhhdmUgYmVlbiBsb3N0IGJ5IHVwc3RyZWFtIGNoYW5nZXMuIAoKSW4g
YWRkaXRpb24gd2UgaGF2ZSBvdXIgQWN0aXZlIENsdXN0ZXIgZmVhdHVyZSB3aGljaCBsZXZlcmFn
ZXMgQUxVQSBzaW5jZSBvdXIgbGFzdCBwYXRjaC4gVGhlIEFMVUEgY29uZmd1cmF0aW9uIHdpbGwg
d29yayBmb3IgYWxsIEZsYXNoQXJyYXlzIHdpdGggb3Igd2l0aG91dCBBY3RpdmUgQ2x1c3Rlci4K
CldlIGFyZSBjaGFuZ2luZyAzIHRoaW5ncy4KCjEuIEFMVUEgc3VwcG9ydAoyLiBGYXN0IGZhaWwg
dGltZW91dCBmcm9tIHRoZSBkZWZhdWx0IG9mIDUgc2Vjb25kcyB0byAxMCBzZWNvbmRzIChXZSBu
ZWVkIHRoaXMgZm9yIG91ciBGQyBOUElWIHBvcnQgbWlncmF0aW9uKS4KMy4gTWF4aW11bSBzZWN0
b3Igc2l6ZSBvZiA0TUIuIFNvbWUgTGludXggdmVuZG9ycyBkb27igJl0IGhvbm9yIHRoZSBibG9j
ayBsaW1pdHMgVlBEIHBhZ2Ugb2YgSU5RVUlSWSkuCgpUaGFua3MsCkJyaWFuCgpkaWZmIC0tZ2l0
IGEvbGlibXVsdGlwYXRoL2h3dGFibGUuYyBiL2xpYm11bHRpcGF0aC9od3RhYmxlLmMKaW5kZXgg
MWQ5NjQzMzMuLjM3ZTk3ZjYwIDEwMDY0NAotLS0gYS9saWJtdWx0aXBhdGgvaHd0YWJsZS5jCisr
KyBiL2xpYm11bHRpcGF0aC9od3RhYmxlLmMKQEAgLTEwMjQsNyArMTAyNCwxMiBAQCBzdGF0aWMg
c3RydWN0IGh3ZW50cnkgZGVmYXVsdF9od1tdID0gewogICAgICAgICAgICAgICAgLyogRmxhc2hB
cnJheSAqLwogICAgICAgICAgICAgICAgLnZlbmRvciAgICAgICAgPSAiUFVSRSIsCiAgICAgICAg
ICAgICAgICAucHJvZHVjdCAgICAgICA9ICJGbGFzaEFycmF5IiwKLSAgICAgICAgICAgICAgIC5w
Z3BvbGljeSAgICAgID0gTVVMVElCVVMsCisgICAgICAgICAgICAgICAucGdwb2xpY3kgICAgICA9
IEdST1VQX0JZX1BSSU8sCisgICAgICAgICAgICAgICAucGdmYWlsYmFjayAgICA9IC1GQUlMQkFD
S19JTU1FRElBVEUsCisgICAgICAgICAgICAgICAuaHdoYW5kbGVyICAgICA9ICIxIGFsdWEiLAor
ICAgICAgICAgICAgICAgLnByaW9fbmFtZSAgICAgPSBQUklPX0FMVUEsCisgICAgICAgICAgICAg
ICAuZmFzdF9pb19mYWlsICA9IDEwLAorICAgICAgICAgICAgICAgLm1heF9zZWN0b3JzX2tiID0g
NDA5NiwKICAgICAgICB9LAogICAgICAgIC8qCiAgICAgICAgICogSHVhd2VpCgoKCkJyaWFuIEJ1
bmtlcgpTVyBFbmcKYnJpYW5AcHVyZXN0b3JhZ2UuY29tCgoKCgotLQpkbS1kZXZlbCBtYWlsaW5n
IGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vZG0tZGV2ZWw=

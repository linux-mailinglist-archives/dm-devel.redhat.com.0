Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A3B95E9913
	for <lists+dm-devel@lfdr.de>; Wed, 30 Oct 2019 10:20:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572427254;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YVKO6pptwAtYe5Pbj8ewZM1p8X9WXL868J93jPYzOoE=;
	b=TpYNCF8dpwIXza2WrrLd9W/HBtRi3jRFvNBIGeGfthMuFoMoBvMVtmUSslThIXeURLjaq6
	5ZnII6Gz43yZAit3lM8VDThLKIU1jNF4rERMlE3C1sIsBeoouI8/i+MiZfupNSybS2OxF6
	As2BqWQgpndIGMCFTzek+bxe1/oghZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-03Igyd-3P72d1dcAkeMszA-1; Wed, 30 Oct 2019 05:20:52 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC0911800D56;
	Wed, 30 Oct 2019 09:20:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8917194B6;
	Wed, 30 Oct 2019 09:20:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 318E13FB41;
	Wed, 30 Oct 2019 09:20:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9TCNDPK004128 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Oct 2019 08:23:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7ED9419C77; Tue, 29 Oct 2019 12:23:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 791AB19C4F
	for <dm-devel@redhat.com>; Tue, 29 Oct 2019 12:23:11 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3ECB308FEC0
	for <dm-devel@redhat.com>; Tue, 29 Oct 2019 12:23:09 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id m7so15042332lji.2
	for <dm-devel@redhat.com>; Tue, 29 Oct 2019 05:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=ufn9ULK4alp8KGYQ8RskQvdcv1NNkrdsXDvgI32jKa8=;
	b=Rl/LTBXr/IB+zD/2ciYdoqLCncb6TScO5Nr6B1w/linf0yK2pE+leLlkZeqJh1K0XO
	i50+l6iurICZow9obWP7IETrZJcaNFTejntON2KD1awpNFeoL1wrF0zMCh6pSqZthfsD
	f0fRyeAkeodCRyRXpvmr/D5rL0GUKfYD547ECN7rPpVV8a82apeBVI9msj3I/9szWJ+w
	PRAjtl/sOjjciEDL2ssWc1UhdVZC/qVxXmTXpknRaGm0yA7wIEkaJZs0KOsF8XahTpd1
	pwi9+yDQEXUORwao7tsH6KNXhk4mVrCs7GwqD8b40UayH6DcBqFsId+Ntvw0NsZ5won0
	m5bg==
X-Gm-Message-State: APjAAAVMUvJiJaqwMJuUui+40om9e++l5ZoHOgvyGrxgkXCXeFKg69bY
	H/6lsmmYDi1HJZZrI1csZZk8wg==
X-Google-Smtp-Source: APXvYqwFY4bAuNFZjlVfT9ZTCXgsa+d/BJsH3OK4suQ/8lncLWjF2JIEbaSZ/oExYCro8OO+kztNzw==
X-Received: by 2002:a2e:868d:: with SMTP id l13mr2499823lji.136.1572351788166; 
	Tue, 29 Oct 2019 05:23:08 -0700 (PDT)
Received: from localhost ([194.62.217.57]) by smtp.gmail.com with ESMTPSA id
	z15sm12034717ljb.24.2019.10.29.05.23.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 05:23:07 -0700 (PDT)
Date: Tue, 29 Oct 2019 13:23:06 +0100
From: Javier =?utf-8?B?R29uesOhbGV6?= <javier@javigon.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20191029122306.aqly5g3xrzndf7cy@MacBook-Pro.gnusmas>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
	<20191027140549.26272-6-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20191027140549.26272-6-damien.lemoal@wdc.com>
User-Agent: NeoMutt/20180716
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 29 Oct 2019 12:23:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Tue, 29 Oct 2019 12:23:10 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'javier@javigon.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <javier@javigon.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 30 Oct 2019 05:20:21 -0400
Cc: Jens Axboe <axboe@kernel.dk>, Ajay Joshi <ajay.joshi@wdc.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Dmitry Fomichev <dmitry.fomichev@wdc.com>,
	Hans Holmberg <Hans.Holmberg@wdc.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
	Matias Bjorling <matias.bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 5/8] block: add zone open,
	close and finish ioctl support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 03Igyd-3P72d1dcAkeMszA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gMjcuMTAuMjAxOSAyMzowNSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj5Gcm9tOiBBamF5IEpv
c2hpIDxhamF5Lmpvc2hpQHdkYy5jb20+Cj4KPkludHJvZHVjZSB0aHJlZSBuZXcgaW9jdGwgY29t
bWFuZHMgQkxLT1BFTlpPTkUsIEJMS0NMT1NFWk9ORSBhbmQKPkJMS0ZJTklTSFpPTkUgdG8gYWxs
b3cgYXBwbGljYXRpb25zIHRvIGNvbnRyb2wgdGhlIGNvbmRpdGlvbiBvZiB6b25lcwo+b24gYSB6
b25lZCBibG9jayBkZXZpY2UgdGhyb3VnaCB0aGUgZXhlY3V0aW9uIG9mIHRoZSBSRVFfT1BfWk9O
RV9PUEVOLAo+UkVRX09QX1pPTkVfQ0xPU0UgYW5kIFJFUV9PUF9aT05FX0ZJTklTSCBvcGVyYXRp
b25zLgo+Cj5Db250YWlucyBjb250cmlidXRpb25zIGZyb20gTWF0aWFzIEJqb3JsaW5nLCBIYW5z
IEhvbG1iZXJnLAo+RG1pdHJ5IEZvbWljaGV2LCBLZWl0aCBCdXNjaCwgRGFtaWVuIExlIE1vYWwg
YW5kIENocmlzdG9waCBIZWxsd2lnLgo+Cj5TaWduZWQtb2ZmLWJ5OiBBamF5IEpvc2hpIDxhamF5
Lmpvc2hpQHdkYy5jb20+Cj5TaWduZWQtb2ZmLWJ5OiBNYXRpYXMgQmpvcmxpbmcgPG1hdGlhcy5i
am9ybGluZ0B3ZGMuY29tPgo+U2lnbmVkLW9mZi1ieTogSGFucyBIb2xtYmVyZyA8aGFucy5ob2xt
YmVyZ0B3ZGMuY29tPgo+U2lnbmVkLW9mZi1ieTogRG1pdHJ5IEZvbWljaGV2IDxkbWl0cnkuZm9t
aWNoZXZAd2RjLmNvbT4KPlNpZ25lZC1vZmYtYnk6IEtlaXRoIEJ1c2NoIDxrYnVzY2hAa2VybmVs
Lm9yZz4KPlNpZ25lZC1vZmYtYnk6IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5j
b20+Cj4tLS0KPiBibG9jay9ibGstem9uZWQuYyAgICAgICAgICAgICB8IDI4ICsrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0KPiBibG9jay9pb2N0bC5jICAgICAgICAgICAgICAgICB8ICA1ICsr
KystCj4gaW5jbHVkZS9saW51eC9ibGtkZXYuaCAgICAgICAgfCAxMCArKysrKy0tLS0tCj4gaW5j
bHVkZS91YXBpL2xpbnV4L2Jsa3pvbmVkLmggfCAxNyArKysrKysrKysrKysrKy0tLQo+IDQgZmls
ZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1n
aXQgYS9ibG9jay9ibGstem9uZWQuYyBiL2Jsb2NrL2Jsay16b25lZC5jCj5pbmRleCBkYWIzNGRj
NDhmYjYuLjQ4MWVhZjdkMDRkNCAxMDA2NDQKPi0tLSBhL2Jsb2NrL2Jsay16b25lZC5jCj4rKysg
Yi9ibG9jay9ibGstem9uZWQuYwo+QEAgLTM1NywxNSArMzU3LDE2IEBAIGludCBibGtkZXZfcmVw
b3J0X3pvbmVzX2lvY3RsKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIGZtb2RlX3QgbW9kZSwK
PiB9Cj4KPiAvKgo+LSAqIEJMS1JFU0VUWk9ORSBpb2N0bCBwcm9jZXNzaW5nLgo+KyAqIEJMS1JF
U0VUWk9ORSwgQkxLT1BFTlpPTkUsIEJMS0NMT1NFWk9ORSBhbmQgQkxLRklOSVNIWk9ORSBpb2N0
bCBwcm9jZXNzaW5nLgo+ICAqIENhbGxlZCBmcm9tIGJsa2Rldl9pb2N0bC4KPiAgKi8KPi1pbnQg
YmxrZGV2X3Jlc2V0X3pvbmVzX2lvY3RsKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIGZtb2Rl
X3QgbW9kZSwKPi0JCQkgICAgIHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVkIGxvbmcgYXJnKQo+
K2ludCBibGtkZXZfem9uZV9tZ210X2lvY3RsKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIGZt
b2RlX3QgbW9kZSwKPisJCQkgICB1bnNpZ25lZCBpbnQgY21kLCB1bnNpZ25lZCBsb25nIGFyZykK
PiB7Cj4gCXZvaWQgX191c2VyICphcmdwID0gKHZvaWQgX191c2VyICopYXJnOwo+IAlzdHJ1Y3Qg
cmVxdWVzdF9xdWV1ZSAqcTsKPiAJc3RydWN0IGJsa196b25lX3JhbmdlIHpyYW5nZTsKPisJZW51
bSByZXFfb3BmIG9wOwo+Cj4gCWlmICghYXJncCkKPiAJCXJldHVybiAtRUlOVkFMOwo+QEAgLTM4
Niw4ICszODcsMjUgQEAgaW50IGJsa2Rldl9yZXNldF96b25lc19pb2N0bChzdHJ1Y3QgYmxvY2tf
ZGV2aWNlICpiZGV2LCBmbW9kZV90IG1vZGUsCj4gCWlmIChjb3B5X2Zyb21fdXNlcigmenJhbmdl
LCBhcmdwLCBzaXplb2Yoc3RydWN0IGJsa196b25lX3JhbmdlKSkpCj4gCQlyZXR1cm4gLUVGQVVM
VDsKPgo+LQlyZXR1cm4gYmxrZGV2X3pvbmVfbWdtdChiZGV2LCBSRVFfT1BfWk9ORV9SRVNFVCwK
Pi0JCQkJenJhbmdlLnNlY3RvciwgenJhbmdlLm5yX3NlY3RvcnMsIEdGUF9LRVJORUwpOwo+Kwlz
d2l0Y2ggKGNtZCkgewo+KwljYXNlIEJMS1JFU0VUWk9ORToKPisJCW9wID0gUkVRX09QX1pPTkVf
UkVTRVQ7Cj4rCQlicmVhazsKPisJY2FzZSBCTEtPUEVOWk9ORToKPisJCW9wID0gUkVRX09QX1pP
TkVfT1BFTjsKPisJCWJyZWFrOwo+KwljYXNlIEJMS0NMT1NFWk9ORToKPisJCW9wID0gUkVRX09Q
X1pPTkVfQ0xPU0U7Cj4rCQlicmVhazsKPisJY2FzZSBCTEtGSU5JU0haT05FOgo+KwkJb3AgPSBS
RVFfT1BfWk9ORV9GSU5JU0g7Cj4rCQlicmVhazsKPisJZGVmYXVsdDoKPisJCXJldHVybiAtRU5P
VFRZOwo+Kwl9Cj4rCj4rCXJldHVybiBibGtkZXZfem9uZV9tZ210KGJkZXYsIG9wLCB6cmFuZ2Uu
c2VjdG9yLCB6cmFuZ2UubnJfc2VjdG9ycywKPisJCQkJR0ZQX0tFUk5FTCk7Cj4gfQo+Cj4gc3Rh
dGljIGlubGluZSB1bnNpZ25lZCBsb25nICpibGtfYWxsb2Nfem9uZV9iaXRtYXAoaW50IG5vZGUs
Cj5kaWZmIC0tZ2l0IGEvYmxvY2svaW9jdGwuYyBiL2Jsb2NrL2lvY3RsLmMKPmluZGV4IDE1YTBl
YjgwYWRhOS4uODc1NmVmYjE0MTllIDEwMDY0NAo+LS0tIGEvYmxvY2svaW9jdGwuYwo+KysrIGIv
YmxvY2svaW9jdGwuYwo+QEAgLTUzMiw3ICs1MzIsMTAgQEAgaW50IGJsa2Rldl9pb2N0bChzdHJ1
Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBmbW9kZV90IG1vZGUsIHVuc2lnbmVkIGNtZCwKPiAJY2Fz
ZSBCTEtSRVBPUlRaT05FOgo+IAkJcmV0dXJuIGJsa2Rldl9yZXBvcnRfem9uZXNfaW9jdGwoYmRl
diwgbW9kZSwgY21kLCBhcmcpOwo+IAljYXNlIEJMS1JFU0VUWk9ORToKPi0JCXJldHVybiBibGtk
ZXZfcmVzZXRfem9uZXNfaW9jdGwoYmRldiwgbW9kZSwgY21kLCBhcmcpOwo+KwljYXNlIEJMS09Q
RU5aT05FOgo+KwljYXNlIEJMS0NMT1NFWk9ORToKPisJY2FzZSBCTEtGSU5JU0haT05FOgo+KwkJ
cmV0dXJuIGJsa2Rldl96b25lX21nbXRfaW9jdGwoYmRldiwgbW9kZSwgY21kLCBhcmcpOwo+IAlj
YXNlIEJMS0dFVFpPTkVTWjoKPiAJCXJldHVybiBwdXRfdWludChhcmcsIGJkZXZfem9uZV9zZWN0
b3JzKGJkZXYpKTsKPiAJY2FzZSBCTEtHRVROUlpPTkVTOgo+ZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvYmxrZGV2LmggYi9pbmNsdWRlL2xpbnV4L2Jsa2Rldi5oCj5pbmRleCBiZjc5N2E2MzM4
OGMuLmRiZWY1NDFjMjUzMCAxMDA2NDQKPi0tLSBhL2luY2x1ZGUvbGludXgvYmxrZGV2LmgKPisr
KyBiL2luY2x1ZGUvbGludXgvYmxrZGV2LmgKPkBAIC0zNjcsOCArMzY3LDggQEAgZXh0ZXJuIGlu
dCBibGtfcmV2YWxpZGF0ZV9kaXNrX3pvbmVzKHN0cnVjdCBnZW5kaXNrICpkaXNrKTsKPgo+IGV4
dGVybiBpbnQgYmxrZGV2X3JlcG9ydF96b25lc19pb2N0bChzdHJ1Y3QgYmxvY2tfZGV2aWNlICpi
ZGV2LCBmbW9kZV90IG1vZGUsCj4gCQkJCSAgICAgdW5zaWduZWQgaW50IGNtZCwgdW5zaWduZWQg
bG9uZyBhcmcpOwo+LWV4dGVybiBpbnQgYmxrZGV2X3Jlc2V0X3pvbmVzX2lvY3RsKHN0cnVjdCBi
bG9ja19kZXZpY2UgKmJkZXYsIGZtb2RlX3QgbW9kZSwKPi0JCQkJICAgIHVuc2lnbmVkIGludCBj
bWQsIHVuc2lnbmVkIGxvbmcgYXJnKTsKPitleHRlcm4gaW50IGJsa2Rldl96b25lX21nbXRfaW9j
dGwoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgZm1vZGVfdCBtb2RlLAo+KwkJCQkgIHVuc2ln
bmVkIGludCBjbWQsIHVuc2lnbmVkIGxvbmcgYXJnKTsKPgo+ICNlbHNlIC8qIENPTkZJR19CTEtf
REVWX1pPTkVEICovCj4KPkBAIC0zODksOSArMzg5LDkgQEAgc3RhdGljIGlubGluZSBpbnQgYmxr
ZGV2X3JlcG9ydF96b25lc19pb2N0bChzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LAo+IAlyZXR1
cm4gLUVOT1RUWTsKPiB9Cj4KPi1zdGF0aWMgaW5saW5lIGludCBibGtkZXZfcmVzZXRfem9uZXNf
aW9jdGwoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwKPi0JCQkJCSAgIGZtb2RlX3QgbW9kZSwg
dW5zaWduZWQgaW50IGNtZCwKPi0JCQkJCSAgIHVuc2lnbmVkIGxvbmcgYXJnKQo+K3N0YXRpYyBp
bmxpbmUgaW50IGJsa2Rldl96b25lX21nbXRfaW9jdGwoc3RydWN0IGJsb2NrX2RldmljZSAqYmRl
diwKPisJCQkJCSBmbW9kZV90IG1vZGUsIHVuc2lnbmVkIGludCBjbWQsCj4rCQkJCQkgdW5zaWdu
ZWQgbG9uZyBhcmcpCj4gewo+IAlyZXR1cm4gLUVOT1RUWTsKPiB9Cj5kaWZmIC0tZ2l0IGEvaW5j
bHVkZS91YXBpL2xpbnV4L2Jsa3pvbmVkLmggYi9pbmNsdWRlL3VhcGkvbGludXgvYmxrem9uZWQu
aAo+aW5kZXggNDk4ZWVjODEzNDk0Li4wY2RlZjY3MTM1ZjAgMTAwNjQ0Cj4tLS0gYS9pbmNsdWRl
L3VhcGkvbGludXgvYmxrem9uZWQuaAo+KysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2Jsa3pvbmVk
LmgKPkBAIC0xMjAsOSArMTIwLDExIEBAIHN0cnVjdCBibGtfem9uZV9yZXBvcnQgewo+IH07Cj4K
PiAvKioKPi0gKiBzdHJ1Y3QgYmxrX3pvbmVfcmFuZ2UgLSBCTEtSRVNFVFpPTkUgaW9jdGwgcmVx
dWVzdAo+LSAqIEBzZWN0b3I6IHN0YXJ0aW5nIHNlY3RvciBvZiB0aGUgZmlyc3Qgem9uZSB0byBp
c3N1ZSByZXNldCB3cml0ZSBwb2ludGVyCj4tICogQG5yX3NlY3RvcnM6IFRvdGFsIG51bWJlciBv
ZiBzZWN0b3JzIG9mIDEgb3IgbW9yZSB6b25lcyB0byByZXNldAo+KyAqIHN0cnVjdCBibGtfem9u
ZV9yYW5nZSAtIEJMS1JFU0VUWk9ORS9CTEtPUEVOWk9ORS8KPisgKiAgICAgICAgICAgICAgICAg
ICAgICAgICBCTEtDTE9TRVpPTkUvQkxLRklOSVNIWk9ORSBpb2N0bAo+KyAqICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlcXVlc3RzCj4rICogQHNlY3RvcjogU3RhcnRpbmcgc2VjdG9yIG9mIHRo
ZSBmaXJzdCB6b25lIHRvIG9wZXJhdGUgb24uCj4rICogQG5yX3NlY3RvcnM6IFRvdGFsIG51bWJl
ciBvZiBzZWN0b3JzIG9mIGFsbCB6b25lcyB0byBvcGVyYXRlIG9uLgo+ICAqLwo+IHN0cnVjdCBi
bGtfem9uZV9yYW5nZSB7Cj4gCV9fdTY0CQlzZWN0b3I7Cj5AQCAtMTM5LDEwICsxNDEsMTkgQEAg
c3RydWN0IGJsa196b25lX3JhbmdlIHsKPiAgKiAgICAgICAgICAgICAgICBzZWN0b3IgcmFuZ2Uu
IFRoZSBzZWN0b3IgcmFuZ2UgbXVzdCBiZSB6b25lIGFsaWduZWQuCj4gICogQEJMS0dFVFpPTkVT
WjogR2V0IHRoZSBkZXZpY2Ugem9uZSBzaXplIGluIG51bWJlciBvZiA1MTIgQiBzZWN0b3JzLgo+
ICAqIEBCTEtHRVROUlpPTkVTOiBHZXQgdGhlIHRvdGFsIG51bWJlciBvZiB6b25lcyBvZiB0aGUg
ZGV2aWNlLgo+KyAqIEBCTEtPUEVOWk9ORTogT3BlbiB0aGUgem9uZXMgaW4gdGhlIHNwZWNpZmll
ZCBzZWN0b3IgcmFuZ2UuCj4rICogICAgICAgICAgICAgICBUaGUgNTEyIEIgc2VjdG9yIHJhbmdl
IG11c3QgYmUgem9uZSBhbGlnbmVkLgo+KyAqIEBCTEtDTE9TRVpPTkU6IENsb3NlIHRoZSB6b25l
cyBpbiB0aGUgc3BlY2lmaWVkIHNlY3RvciByYW5nZS4KPisgKiAgICAgICAgICAgICAgICBUaGUg
NTEyIEIgc2VjdG9yIHJhbmdlIG11c3QgYmUgem9uZSBhbGlnbmVkLgo+KyAqIEBCTEtGSU5JU0ha
T05FOiBNYXJrIHRoZSB6b25lcyBhcyBmdWxsIGluIHRoZSBzcGVjaWZpZWQgc2VjdG9yIHJhbmdl
Lgo+KyAqICAgICAgICAgICAgICAgICBUaGUgNTEyIEIgc2VjdG9yIHJhbmdlIG11c3QgYmUgem9u
ZSBhbGlnbmVkLgo+ICAqLwo+ICNkZWZpbmUgQkxLUkVQT1JUWk9ORQlfSU9XUigweDEyLCAxMzAs
IHN0cnVjdCBibGtfem9uZV9yZXBvcnQpCj4gI2RlZmluZSBCTEtSRVNFVFpPTkUJX0lPVygweDEy
LCAxMzEsIHN0cnVjdCBibGtfem9uZV9yYW5nZSkKPiAjZGVmaW5lIEJMS0dFVFpPTkVTWglfSU9S
KDB4MTIsIDEzMiwgX191MzIpCj4gI2RlZmluZSBCTEtHRVROUlpPTkVTCV9JT1IoMHgxMiwgMTMz
LCBfX3UzMikKPisjZGVmaW5lIEJMS09QRU5aT05FCV9JT1coMHgxMiwgMTM0LCBzdHJ1Y3QgYmxr
X3pvbmVfcmFuZ2UpCj4rI2RlZmluZSBCTEtDTE9TRVpPTkUJX0lPVygweDEyLCAxMzUsIHN0cnVj
dCBibGtfem9uZV9yYW5nZSkKPisjZGVmaW5lIEJMS0ZJTklTSFpPTkUJX0lPVygweDEyLCAxMzYs
IHN0cnVjdCBibGtfem9uZV9yYW5nZSkKPgo+ICNlbmRpZiAvKiBfVUFQSV9CTEtaT05FRF9IICov
Cj4tLSAKPjIuMjEuMAo+CgpMb29rcyBnb29kLgoKUmV2aWV3ZWQtYnk6IEphdmllciBHb256w6Fs
ZXogPGphdmllckBqYXZpZ29uLmNvbT4KCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZl
bEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1k
ZXZlbA==


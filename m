Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ED84BD3E
	for <lists+dm-devel@lfdr.de>; Wed, 19 Jun 2019 17:47:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80C4230654F4;
	Wed, 19 Jun 2019 15:47:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53AA460142;
	Wed, 19 Jun 2019 15:47:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77D133F6E4;
	Wed, 19 Jun 2019 15:46:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5JFjdv9004740 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 11:45:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A3ED819C79; Wed, 19 Jun 2019 15:45:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EAD519C71
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 15:45:35 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F154530C31AA
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 15:45:25 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id u13so39318497iop.0
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YF5GIjRAndHPUW8ip4P0tj5IaS2t9gDC60YoZnzPNZ4=;
	b=qyMSheO71KevECSQ7JG80qKXQs7Bfbce+jbT8oZxikJk8VCooFlY/kWmXAPXhjzykm
	k7GdQP9Z02RRMCxcxrBFlXptVogBZ+wwqaZcQjYkD9x5N1zoA8LwvgYQu2l7xeT2Kbos
	CzQSMHZalIhYyk7LYhiQ/WvGhgWSn76RrVmxXwyuk5sswSy0f7rz8xHGrbGGxgb+GPv+
	Sal6p5jSpvsYC3HOHzquZLweMNwhSBd/+k5ICGwgy6FqfbA+1/vFB+TeUnOBVyAldMG2
	o1XD3gsCV2Qm7XbgtBkh4wXwJUu69UrfLGmsieObNkrmCUNvMIz8dEyKIfZ7x2twDy+E
	3AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YF5GIjRAndHPUW8ip4P0tj5IaS2t9gDC60YoZnzPNZ4=;
	b=DO+gOjGMV6a3irYgJ4SoPvNsM4qX33LgCI/HUcKFx4MPwTHAwmvmpYwFtICScfFL6W
	ukEMPPZRChXDaaWBQNaVe9bZ3KM32xSmU1/ICiV47kDhizUZzSelas6WW+kcMiDvxpdN
	zLOJvBdytdxkDbtDvDFRcnXglXvXauis/OH66GXXjmRRRh9+s6UUyXOszln5zMzfeGlF
	TvO5GVa2UL1/JlanykQSE96LF5WocyIbZjHy7Xa/ukWO5mi1qhKRCARinHl5f4JVHq9f
	OuKLWXAzjFfDHe4qcWtU/8AoTvAaTWwp5SR41I5kGeLVfIumQPQz/3fwxz/JqQPUG8h6
	/hXA==
X-Gm-Message-State: APjAAAX3xuyzKAvL3hQae281H4invXCNhEL3IGFRw9fUMGbZxkD6R1fK
	lEJmsx1+DgEe6bSmPNvhOSYcF1vfc9zJFre4rPLNDg==
X-Google-Smtp-Source: APXvYqxwFPYbyCqSLmVnqyo/+MkmgWGDZGE2ADYFN7l3/kxmvwG6feuxxKVJIhuSoPfd2X6vWA46PHWbG+hjdjvwSYo=
X-Received: by 2002:a02:5a89:: with SMTP id v131mr6696187jaa.130.1560959125252;
	Wed, 19 Jun 2019 08:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190618212749.8995-1-ard.biesheuvel@linaro.org>
	<20190618212749.8995-2-ard.biesheuvel@linaro.org>
	<CAAUqJDsi_acZj09xiimYGfyJVPt0zo=3-2PHuGnSKSaq82-RQA@mail.gmail.com>
In-Reply-To: <CAAUqJDsi_acZj09xiimYGfyJVPt0zo=3-2PHuGnSKSaq82-RQA@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 19 Jun 2019 17:45:13 +0200
Message-ID: <CAKv+Gu_okSc=Ep9nbdqnbB1hVRmr8O4tChDPm+m7O+jb1pBD_A@mail.gmail.com>
To: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 19 Jun 2019 15:45:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 19 Jun 2019 15:45:26 +0000 (UTC) for IP:'209.85.166.65'
	DOMAIN:'mail-io1-f65.google.com' HELO:'mail-io1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.65 mail-io1-f65.google.com 209.85.166.65
	mail-io1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5JFjdv9004740
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v2 1/4] crypto: essiv - create wrapper
	template for ESSIV generation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 19 Jun 2019 15:47:54 +0000 (UTC)

T24gV2VkLCAxOSBKdW4gMjAxOSBhdCAxNzoxOCwgT25kcmVqIE1vc27DocSNZWsgPG9tb3NuYWNl
a0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQXJkLAo+Cj4gdXQgMTguIDYuIDIwMTkgbyAyMzoy
OCBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4gbmFww61zYWwoYSk6
Cj4gPiBJbXBsZW1lbnQgYSB0ZW1wbGF0ZSB0aGF0IHdyYXBzIGEgKHNrY2lwaGVyLGNpcGhlcixz
aGFzaCkgb3IKPiA+IChhZWFkLGNpcGhlcixzaGFzaCkgdHVwbGUgc28gdGhhdCB3ZSBjYW4gY29u
c29saWRhdGUgdGhlIEVTU0lWIGhhbmRsaW5nCj4gPiBpbiBmc2NyeXB0IGFuZCBkbS1jcnlwdCBh
bmQgbW92ZSBpdCBpbnRvIHRoZSBjcnlwdG8gQVBJLiBUaGlzIHdpbGwgcmVzdWx0Cj4gPiBpbiBi
ZXR0ZXIgdGVzdCBjb3ZlcmFnZSwgYW5kIHdpbGwgYWxsb3cgZnV0dXJlIGNoYW5nZXMgdG8gbWFr
ZSB0aGUgYmFyZQo+ID4gY2lwaGVyIGludGVyZmFjZSBpbnRlcm5hbCB0byB0aGUgY3J5cHRvIHN1
YnN5c3RlbSwgaW4gb3JkZXIgdG8gaW5jcmVhc2UKPiA+IHJvYnVzdG5lc3Mgb2YgdGhlIEFQSSBh
Z2FpbnN0IG1pc3VzZS4KPiA+Cj4gPiBOb3RlIHRoYXQgZXNwZWNpYWxseSB0aGUgQUVBRCBoYW5k
bGluZyBpcyBhIGJpdCBjb21wbGV4LCBhbmQgaXMgdGlnaHRseQo+ID4gY291cGxlZCB0byB0aGUg
d2F5IGRtLWNyeXB0IGNvbWJpbmVzIEFFQUQgYmFzZWQgb24gdGhlIGF1dGhlbmMoKSB0ZW1wbGF0
ZQo+ID4gd2l0aCB0aGUgRVNTSVYgaGFuZGxpbmcuCj4KPiBXb3VsZG4ndCBpdCB3b3JrIGJldHRl
ciB0byBoYXZlIGEgdGVtcGxhdGUgb25seSBmb3Igc2tjaXBoZXIgYW5kIGluCj4gZG0tY3J5cHQg
anVzdCBpbmplY3QgdGhlIGVzc2l2KCkgdGVtcGxhdGUgaW50byB0aGUgY2lwaGVyIHN0cmluZz8g
Rm9yCj4gZXhhbXBsZTogImF1dGhlbmMoaG1hYyhzaGEyNTYpLGNiYyhhZXMpKS1lc3NpdjpzaGEy
NTYiIC0+Cj4gImF1dGhlbmMoaG1hYyhzaGEyNTYpLGVzc2l2KGNiYyhhZXMpLGFlcyxzaGEyNTYp
KSIuIFRoYXQgc2VlbXMgdG8gbWUgYQo+IG11Y2ggc2ltcGxlciBoYWNrLiAoQnV0IG1heWJlIEkn
bSBtaXNzaW5nIHNvbWUgaXNzdWUgaW4gdGhhdAo+IGFwcHJvYWNoLi4uKQo+CgpVbmZvcnR1bmF0
ZWx5LCB0aGF0IGRvZXNuJ3Qgd29yay4gV2hlbiB1c2luZyBBRUFEcywgZG0tY3J5cHQgYWxzbyBw
dXRzCnRoZSBJViBpbiB0aGUgQUFEIGFyZWEuCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0t
ZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
ZG0tZGV2ZWw=

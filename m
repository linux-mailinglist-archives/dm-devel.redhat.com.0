Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2D21D175C9D
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 15:10:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583158252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WZYNrXU4A/sU4vc9VBBtovaFABc7FHknc+9pHRyJcHI=;
	b=cWQ4Kij+sqMjA+enuBbmwzfkHWhe4k+hJwHCUz1MVlyC9SthyEkR65/A6pCSLG84cRj4md
	tSgYr0RXZJd/qrLZx7aKKed1V58tHckiWZKnFyKBmx8o6AkmnrnvjC88gBW1BqCn5K64yy
	QfBgowjriyH2DGqh7DwBvAQEkkBd8eM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-DNmVLelZNp29NqsLL7gQUg-1; Mon, 02 Mar 2020 09:10:46 -0500
X-MC-Unique: DNmVLelZNp29NqsLL7gQUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 392DD1922961;
	Mon,  2 Mar 2020 14:10:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 906FC38F;
	Mon,  2 Mar 2020 14:10:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8851F84460;
	Mon,  2 Mar 2020 14:10:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022EAFSU004453 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 09:10:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0DFE910EE6CC; Mon,  2 Mar 2020 14:10:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0934710EE79F
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 14:10:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 184B5185A791
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 14:10:13 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-426-p43_fDUhMWqTUw0mKGyWuQ-1; Mon, 02 Mar 2020 09:10:11 -0500
X-MC-Unique: p43_fDUhMWqTUw0mKGyWuQ-1
Received: by mail-ed1-f66.google.com with SMTP id m13so13462626edb.6
	for <dm-devel@redhat.com>; Mon, 02 Mar 2020 06:10:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:cc:references:from:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9PZ3JfDCWBto5yc01CCuP4W2nthk7YOQw9IYPPcYRsQ=;
	b=GS31IY2iqxK5vs13s573Y/+TxbvT8HIN0iae94/5G8Tk65YYJj23zdhqnRjz7o6I+G
	4mwIJWW3Oz0fuLmtMfNAkFqywTDXAMCQxS2dSREBlZE532owmkOTUtNJ15Cv0EgADJwD
	LEER6aP+6Mj9zFh8C1Lmqs8Wk8Mh69ryPdiOdxQ8do+RubW0ERZuTIKVKLFOfNaj/OBJ
	eQ02ywvDhNNg34KLDau0xcC5KgBdI7xXc8mIP3fZ6/7VEbbnJ7SgwROsLnMagBt5GdsU
	Zz4x6mJdCSFkD7pU/FI/9Wppglj2WozLFqctzMUPlYGD4YCYjIL5wVHjMnU2/4lhJE6j
	37UQ==
X-Gm-Message-State: ANhLgQ1NNwuzNvhOBkdwgskYAOdZTeuOuSQzj72hcea1XXJoWpH73KOj
	wJjXpZTXxxvZDqM3nRjh2jT05SI=
X-Google-Smtp-Source: ADFU+vua6eCLHUyOMiiX+TcGFo0MdHkrVmeyccgfS/vtI0H+Mm+/rc46LjwlEJV7F7csxWOAjTeciw==
X-Received: by 2002:a17:906:f90b:: with SMTP id
	lc11mr2565845ejb.169.1583158209675; 
	Mon, 02 Mar 2020 06:10:09 -0800 (PST)
Received: from localhost (250.red-83-37-138.dynamicip.rima-tde.net.
	[83.37.138.250]) by smtp.gmail.com with ESMTPSA id
	ch6sm1183952edb.87.2020.03.02.06.10.09
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 02 Mar 2020 06:10:09 -0800 (PST)
References: <20191228002451.9536-1-xose.vazquez@gmail.com>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <f4b9152e-bce3-5ad8-7f2d-8b0220c2b472@gmail.com>
Date: Mon, 2 Mar 2020 15:10:08 +0100
MIME-Version: 1.0
In-Reply-To: <20191228002451.9536-1-xose.vazquez@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 022EAFSU004453
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>, Brian Bunker <brian@purestorage.com>
Subject: Re: [dm-devel] [PATCH resend] ALUA support for PURE FlashArray
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
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gMTIvMjgvMTkgMToyNCBBTSwgWG9zZSBWYXpxdWV6IFBlcmV6IHdyb3RlOgoKSGkgQ2hyaXN0
b3BoZSwKClRoaXMgb25lIGlzIG1pc3NpbmcuCgpUaGFuayB5b3UuCgo+IEZyb206IEJyaWFuIEJ1
bmtlciA8YnJpYW5AcHVyZXN0b3JhZ2UuY29tPgo+IAo+IEhlbGxvIGFsbCwKPiAKPiBJdCBoYXMg
YmVlbiBzb21lIHRpbWUgc2luY2Ugd2UgdXBkYXRlZCBvdXIgUFVSRSBGbGFzaEFycmF5Cj4gY29u
ZmlndXJhdGlvbi4gVGhlIExpbnV4IHZlbmRvcnMgdGhhdCB3ZSBoYWQgYmVlbiBzZWVpbmcgaW4g
dGhlIGZpZWxkCj4gd2VyZSB1c2luZyB2ZXJ5IG9sZCB2ZXJzaW9ucyBvZiBtdWx0aXBhdGgtdG9v
bHMsIHNvIHdlIGhhdmVu4oCZdCBuZWVkZWQgdG8KPiBjaGFuZ2UgYW55dGhpbmcgZm9yIHNvbWUg
dGltZS4gV2l0aCB0aGUgcmVsZWFzZSBvZiBSSEVMOCwgc29tZSBvZiBvdXIKPiBlYXJsaWVyIHZh
bHVlcyBoYXZlIGJlZW4gbG9zdCBieSB1cHN0cmVhbSBjaGFuZ2VzLgo+IAo+IEluIGFkZGl0aW9u
IHdlIGhhdmUgb3VyIEFjdGl2ZSBDbHVzdGVyIGZlYXR1cmUgd2hpY2ggbGV2ZXJhZ2VzIEFMVUEK
PiBzaW5jZSBvdXIgbGFzdCBwYXRjaC4gVGhlIEFMVUEgY29uZmd1cmF0aW9uIHdpbGwgd29yayBm
b3IgYWxsCj4gRmxhc2hBcnJheXMgd2l0aCBvciB3aXRob3V0IEFjdGl2ZSBDbHVzdGVyLgo+IAo+
IFdlIGFyZSBjaGFuZ2luZyAzIHRoaW5ncy4KPiAKPiAxLiBBTFVBIHN1cHBvcnQKPiAyLiBGYXN0
IGZhaWwgdGltZW91dCBmcm9tIHRoZSBkZWZhdWx0IG9mIDUgc2Vjb25kcyB0byAxMCBzZWNvbmRz
IChXZQo+ICAgICBuZWVkIHRoaXMgZm9yIG91ciBGQyBOUElWIHBvcnQgbWlncmF0aW9uKS4KPiAz
LiBNYXhpbXVtIHNlY3RvciBzaXplIG9mIDRNQi4gU29tZSBMaW51eCB2ZW5kb3JzIGRvbuKAmXQg
aG9ub3IgdGhlIGJsb2NrCj4gICAgIGxpbWl0cyBWUEQgcGFnZSBvZiBJTlFVSVJZKS4KPiAKPiBU
aGFua3MsCj4gQnJpYW4KPiAKPiBDYzogQ2hyaXN0b3BoZSBWYXJvcXVpIDxjaHJpc3RvcGhlLnZh
cm9xdWlAb3BlbnN2Yy5jb20+Cj4gQ2M6IERNLURFVkVMIE1MIDxkbS1kZXZlbEByZWRoYXQuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFhvc2UgVmF6cXVleiBQZXJleiA8eG9zZS52YXpxdWV6QGdtYWls
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBCdW5rZXIgPGJyaWFuQHB1cmVzdG9yYWdlLmNv
bT4KPiAtLS0KPiAgIGxpYm11bHRpcGF0aC9od3RhYmxlLmMgfCA3ICsrKysrKy0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvbGlibXVsdGlwYXRoL2h3dGFibGUuYyBiL2xpYm11bHRpcGF0aC9od3RhYmxlLmMKPiBpbmRl
eCAxNjYyN2VjLi45YmM1OWYxIDEwMDY0NAo+IC0tLSBhL2xpYm11bHRpcGF0aC9od3RhYmxlLmMK
PiArKysgYi9saWJtdWx0aXBhdGgvaHd0YWJsZS5jCj4gQEAgLTEwMzksNyArMTAzOSwxMiBAQCBz
dGF0aWMgc3RydWN0IGh3ZW50cnkgZGVmYXVsdF9od1tdID0gewo+ICAgCQkvKiBGbGFzaEFycmF5
ICovCj4gICAJCS52ZW5kb3IgICAgICAgID0gIlBVUkUiLAo+ICAgCQkucHJvZHVjdCAgICAgICA9
ICJGbGFzaEFycmF5IiwKPiAtCQkucGdwb2xpY3kgICAgICA9IE1VTFRJQlVTLAo+ICsJCS5wZ3Bv
bGljeSAgICAgID0gR1JPVVBfQllfUFJJTywKPiArCQkucGdmYWlsYmFjayAgICA9IC1GQUlMQkFD
S19JTU1FRElBVEUsCj4gKwkJLmh3aGFuZGxlciAgICAgPSAiMSBhbHVhIiwKPiArCQkucHJpb19u
YW1lICAgICA9IFBSSU9fQUxVQSwKPiArCQkuZmFzdF9pb19mYWlsICA9IDEwLAo+ICsJCS5tYXhf
c2VjdG9yc19rYiA9IDQwOTYsCj4gICAJfSwKPiAgIAkvKgo+ICAgCSAqIEh1YXdlaQo+IAoKCi0t
CmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJl
ZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 776EE1B2FAE
	for <lists+dm-devel@lfdr.de>; Tue, 21 Apr 2020 21:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587495628;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KtUbOIoXO1rGckRmliL1iQ9S0yAYzecE+RgcOSe4Lhs=;
	b=hBAXltbiyKwchQC1pwnfSAsYqQ0ts7hd3flHdiEkC2V6RAHaL8hzx4Cp1W3RXQlTMPzUii
	yP8JtL5dORfHkCfL+n1oiHfh61uBcV9O2QS4w09iLHX7+jmiBVVmwlM1XJ+G/CeUNY4u95
	eR/6NVC+Tm7Got9ufaMM+Y6GwE84ghg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-sicNrL4qMq6v_E1LpQw5Pg-1; Tue, 21 Apr 2020 15:00:25 -0400
X-MC-Unique: sicNrL4qMq6v_E1LpQw5Pg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BB781084426;
	Tue, 21 Apr 2020 19:00:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4900DA0988;
	Tue, 21 Apr 2020 19:00:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0C3C941A3;
	Tue, 21 Apr 2020 19:00:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LIxu34031085 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 14:59:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FDCA1134CC1; Tue, 21 Apr 2020 18:59:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C1D61134CBF
	for <dm-devel@redhat.com>; Tue, 21 Apr 2020 18:59:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3905D800297
	for <dm-devel@redhat.com>; Tue, 21 Apr 2020 18:59:54 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-143-D07M2fLuOFa5vcycuOfW0w-1; Tue, 21 Apr 2020 14:59:51 -0400
X-MC-Unique: D07M2fLuOFa5vcycuOfW0w-1
Received: by mail-qk1-f176.google.com with SMTP id 20so15636319qkl.10;
	Tue, 21 Apr 2020 11:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to;
	bh=pec3sGvGCvfxKZtNfXrnKeZFAjAMFZ4/V+GJPKSadQU=;
	b=tNR1WC7vxbirlU+TewQvNZyef5qpkMAWW+GwibjGomfvBW4uoB/rBKilaTCkznBD3l
	hAurNHZM7/Ccmm3E21SJ/LPpIr3Udh71GYNAG6NPFa4kGnlSrt8vzMdnnmkUA4QDaFeF
	pcleRX5icR0/2AsP1tVh2nLJ3+GB5/w/pkhE2VoKwFBtVtxJHj53Mhg3ddeI0XKyTE1Y
	x2Ngbdx4xkltkNMjiQJX7vCs106gHzSdvxJF+QyratbZZQ1q6ioUgGijqgKR49zsVst3
	srd21BQwFl/WitbPfupJQwnimlrPLiT8NT8lbvaezLYNFZG1btwfXf1gqKSmADZXY8Di
	CJIg==
X-Gm-Message-State: AGi0PuYJ7cdaDcHXcipTvpTqIWIb8iEaTI/lCe3VkOOIl09cq4jlIUEL
	MTNezV+J17/WvqYouxnTe3Jr47tB4WQ=
X-Google-Smtp-Source: APiQypLQaE1RpmFqlGy4nj+XrCV+bNYJhO+FyEimDzBzOziYAMS6dXzm0CiK3LcYUoxwpKpLrfb6fg==
X-Received: by 2002:a37:6697:: with SMTP id
	a145mr23126095qkc.479.1587495591000; 
	Tue, 21 Apr 2020 11:59:51 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	y10sm2314355qki.63.2020.04.21.11.59.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Apr 2020 11:59:50 -0700 (PDT)
Date: Tue, 21 Apr 2020 14:59:49 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Message-ID: <20200421185949.GA52939@lobo>
References: <20200420134659.1640089-1-dbaryshkov@gmail.com>
	<20200421182754.GA49104@lobo>
	<CALT56yMxxCFX_j=A9YKysPcuBWs2a0iJbCXuE2q1iqy3irOxdA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALT56yMxxCFX_j=A9YKysPcuBWs2a0iJbCXuE2q1iqy3irOxdA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03LIxu34031085
X-loop: dm-devel@redhat.com
Cc: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm-crypt: support using encrypted keys
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gVHVlLCBBcHIgMjEgMjAyMCBhdCAgMjozMlAgLTA0MDAsCkRtaXRyeSBCYXJ5c2hrb3YgPGRi
YXJ5c2hrb3ZAZ21haWwuY29tPiB3cm90ZToKCj4g0LLRgiwgMjEg0LDQv9GALiAyMDIwINCzLiDQ
siAyMToyNywgTWlrZSBTbml0emVyIDxzbml0emVyQHJlZGhhdC5jb20+Ogo+ID4KPiA+IE9uIE1v
biwgQXByIDIwIDIwMjAgYXQgIDk6NDZQIC0wNDAwLAo+ID4gRG1pdHJ5IEJhcnlzaGtvdiA8ZGJh
cnlzaGtvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+ID4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5X2JhcnlzaGtvdkBtZW50b3IuY29tPgo+ID4gPgo+ID4gPiBBbGxvdyBvbmUgdG8g
dXNlIGVuY3J5cHRlZCBpbiBhZGRpdGlvbiB0byB1c2VyIGFuZCBsb2dpbiBrZXkgdHlwZXMgZm9y
Cj4gPiA+IGRldmljZSBlbmNyeXB0aW9uLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEbWl0
cnkgQmFyeXNoa292IDxkbWl0cnlfYmFyeXNoa292QG1lbnRvci5jb20+Cj4gPgo+ID4gSSBmaXhl
ZCB1cCBzb21lIGlzc3VlcywgcGxlYXNlIHNlZSB0aGUgZm9sbG93aW5nIGluY3JlbWVudGFsIHBh
dGNoLAo+ID4gSSdsbCBnZXQgdGhpcyBmb2xkZWQgaW4gYW5kIHN0YWdlZCBmb3IgNS44Lgo+IAo+
IFRoYW5rIHlvdSEKCkFjdHVhbGx5LCBJIHRoaW5rIHRoaXMgaXMgbmVlZGVkIHRvbyAtLSBidXQg
cGxlYXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nOgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWQv
ZG0tY3J5cHQuYyBiL2RyaXZlcnMvbWQvZG0tY3J5cHQuYwppbmRleCBhNGM0YWZjNjdhM2QuLmJh
NGQxNTQ3Njg2MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZC9kbS1jcnlwdC5jCisrKyBiL2RyaXZl
cnMvbWQvZG0tY3J5cHQuYwpAQCAtMjIzNSw4ICsyMjM1LDkgQEAgc3RhdGljIGludCBzZXRfa2V5
X3VzZXIoc3RydWN0IGNyeXB0X2NvbmZpZyAqY2MsIHN0cnVjdCBrZXkgKmtleSkKIAogc3RhdGlj
IGludCBzZXRfa2V5X2VuY3J5cHRlZChzdHJ1Y3QgY3J5cHRfY29uZmlnICpjYywgc3RydWN0IGtl
eSAqa2V5KQogewotCXN0cnVjdCBlbmNyeXB0ZWRfa2V5X3BheWxvYWQgKmVrcCA9IGtleS0+cGF5
bG9hZC5kYXRhWzBdOworCWNvbnN0IHN0cnVjdCBlbmNyeXB0ZWRfa2V5X3BheWxvYWQgKmVrcDsK
IAorCWVrcCA9IGRlcmVmZXJlbmNlX2tleV9sb2NrZWQoa2V5KTsKIAlpZiAoIWVrcCkKIAkJcmV0
dXJuIC1FS0VZUkVWT0tFRDsKIAoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEBy
ZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZl
bA==


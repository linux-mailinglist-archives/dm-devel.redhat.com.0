Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1512C6884CB
	for <lists+dm-devel@lfdr.de>; Thu,  2 Feb 2023 17:50:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675356656;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xSBVDvzpmg3Nfzc+wbV/iX0gvakx5Fz1a4YQWJosTIk=;
	b=FDQ2xyo0/zCKZUBYzxrKVw3WHtmf1Xl5vl20UrgWpPxF+307cLudmIrH/sIT4OC4/UopOG
	ab/Um2UDQ9Rq92Hj9XFDXHAm0i0u8KdPu22F1PT6KCEBW9iAi3qNjmYEzkiNbau5so9c5y
	KgBbv/9JtDRkx32vIntZ/9CU+9PzNSM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-e11pD0kLOAyoG1-X5xq_2w-1; Thu, 02 Feb 2023 11:50:54 -0500
X-MC-Unique: e11pD0kLOAyoG1-X5xq_2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 381F53806710;
	Thu,  2 Feb 2023 16:50:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 376F5140EBF6;
	Thu,  2 Feb 2023 16:50:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A02FF19465B8;
	Thu,  2 Feb 2023 16:50:42 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6B1DA1946586
 for <dm-devel@listman.corp.redhat.com>; Thu,  2 Feb 2023 16:50:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4D6B62026D76; Thu,  2 Feb 2023 16:50:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45D0F2026D68
 for <dm-devel@redhat.com>; Thu,  2 Feb 2023 16:50:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2526C29AA387
 for <dm-devel@redhat.com>; Thu,  2 Feb 2023 16:50:41 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-N32QzFHlPQqKY_UmfcwKzQ-1; Thu, 02 Feb 2023 11:50:39 -0500
X-MC-Unique: N32QzFHlPQqKY_UmfcwKzQ-1
Received: by mail-qt1-f169.google.com with SMTP id h24so2585551qtr.0
 for <dm-devel@redhat.com>; Thu, 02 Feb 2023 08:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1tztcBchRZ+ahQ+Rv8slGEZ3rlEReGoboay+wBElNpk=;
 b=Eb/D4GrYB8MJmHqNIE/vpCwVfJPSkGOEH8U3KAYgOZ2+rRfuPrmPYqmmkMGtPQiTb3
 4fgi1IRo7OccnjSvnKG937VIfKsDpz1c/+QKvCLfEuAJhwGQ5LUhfHSje8oilHkHe908
 0ryrZfgBfY+8U065oJKJly/qgJ+RuHxoAcAP3Hqo1oQLLnfA+T+hAbjqBhRKRfApbKBL
 TM9I9a81By4Uj3R0PLbez/TLZgK9+mGiHJLhqF1hC6ys/5fuCEX8l4u7dVQI2Rrpm7y8
 Lh/l6oua/gyWe9UcqGMBVoR0X0rEtJMxNg4adx/WPd3YCqeiDLJVXwU2ySaGRMNQ7thE
 m6Qg==
X-Gm-Message-State: AO0yUKUGrULQF+i60fmIJ//KjwNhDL51mblcsfvhe8FXf9ihR+Lx9XiU
 bNllwEPNHulXRXoFRA4VSqd3Z/o=
X-Google-Smtp-Source: AK7set+4Pyeb5ompgmUg0JYUv54bCb2ceknHgU0XW/UAy594tQAOCFstY5279x2+bA/W3Ae7xhvLGQ==
X-Received: by 2002:a05:622a:1788:b0:3b8:2ea9:a093 with SMTP id
 s8-20020a05622a178800b003b82ea9a093mr13141578qtk.1.1675356639078; 
 Thu, 02 Feb 2023 08:50:39 -0800 (PST)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net.
 [68.160.166.30]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05620a034900b0071eddd3bebbsm31687qkm.81.2023.02.02.08.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 08:50:38 -0800 (PST)
Date: Thu, 2 Feb 2023 11:50:37 -0500
From: Mike Snitzer <snitzer@kernel.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Message-ID: <Y9vp3XDEQAl7TLND@redhat.com>
References: <20230126033358.1880-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
In-Reply-To: <20230126033358.1880-1-demi@invisiblethingslab.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] [RFC PATCH 0/7] Allow race-free block device handling
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 xen-devel@lists.xenproject.org, Alasdair Kergon <agk@redhat.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBKYW4gMjUgMjAyMyBhdCAxMDozM1AgLTA1MDAsCkRlbWkgTWFyaWUgT2Jlbm91ciA8
ZGVtaUBpbnZpc2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToKCj4gVGhpcyB3b3JrIGFpbXMgdG8g
YWxsb3cgdXNlcnNwYWNlIHRvIGNyZWF0ZSBhbmQgZGVzdHJveSBibG9jayBkZXZpY2VzCj4gaW4g
YSByYWNlLWZyZWUgYW5kIGxlYWstZnJlZSB3YXksCgoicmFjZS1mcmVlIGFuZCBsZWFrLWZyZWUg
d2F5IiBpbXBsaWVzIHRoZXJlIGJvdGggcmFjZXMgYW5kIGxlYWtzIGluCmV4aXN0aW5nIGNvZGUu
IFlvdSdyZSBtYWtpbmcgY2xhaW1zIHRoYXQgYXJlIGxpa2VseSB2ZXJ5IHNwZWNpZmljIHRvCnlv
dXIgWGVuIHVzZS1jYXNlLiAgUGxlYXNlIGV4cGxhaW4gbW9yZSBjYXJlZnVsbHkuCgo+IGFuZCB0
byBhbGxvdyB0aGVtIHRvIGJlIGV4cG9zZWQgdG8KPiBvdGhlciBYZW4gVk1zIHZpYSBibGtiYWNr
IHdpdGhvdXQgbGVha3Mgb3IgcmFjZXMuICBJdOKAmXMgbWFya2VkIGFzIFJGQwo+IGZvciBhIGZl
dyByZWFzb25zOgo+IAo+IC0gVGhlIGNvZGUgaGFzIGJlZW4gb25seSBsaWdodGx5IHRlc3RlZC4g
IEl0IG1pZ2h0IGJlIHVuc3RhYmxlIG9yCj4gICBpbnNlY3VyZS4KPiAKPiAtIFRoZSBETV9ERVZf
Q1JFQVRFIGlvY3RsIGdhaW5zIGEgbmV3IGZsYWcuICBVbmtub3duIGZsYWdzIHdlcmUKPiAgIHBy
ZXZpb3VzbHkgaWdub3JlZCwgc28gdGhpcyBjb3VsZCB0aGVvcmV0aWNhbGx5IGJyZWFrIGJ1Z2d5
IHVzZXJzcGFjZQo+ICAgdG9vbHMuCgpOb3Qgc2VlaW5nIGEgcmVhc29uIHRoYXQgdHlwZSBvZiBE
TSBjaGFuZ2UgaXMgbmVlZGVkLiBJZiB5b3UgZmVlbApzdHJvbmdseSBhYm91dCBpdCBzZW5kIGEg
c2VwYXJhdGUgcGF0Y2ggYW5kIHdlIGNhbiBkaXNjdXNzIGl0LgoKPiAtIEkgaGF2ZSBubyBpZGVh
IGlmIEkgZ290IHRoZSBibG9jayBkZXZpY2UgcmVmZXJlbmNlIGNvdW50aW5nIGFuZAo+ICAgbG9j
a2luZyBjb3JyZWN0LgoKWW91ciBoZWFkZXJzIGFuZCBqdXN0aWZjYXRpb24gZm9yIHRoaXMgbGlu
ZSBvZiB3b3JrIGFyZSByZWFsbHkgd2F5IHRvbwp0ZXJzZS4gUGxlYXNlIHRha2UgdGhlIHRpbWUg
dG8gY2xlYXJseSBtYWtlIHRoZSBjYXNlIGZvciB5b3VyIGNoYW5nZXMKaW4gYm90aCB0aGUgcGF0
Y2ggaGVhZGVycyBhbmQgY29kZS4KCk1pa2UKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1k
ZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGlu
Zm8vZG0tZGV2ZWwK


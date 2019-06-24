Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD7751B9B
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 21:45:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F1A581F25;
	Mon, 24 Jun 2019 19:45:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E05925B687;
	Mon, 24 Jun 2019 19:45:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6823B3D87;
	Mon, 24 Jun 2019 19:44:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5OJhjwo002685 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 15:43:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 23AE910027C4; Mon, 24 Jun 2019 19:43:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3C44100033E;
	Mon, 24 Jun 2019 19:43:40 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC8ABF0D13;
	Mon, 24 Jun 2019 19:43:22 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z75so5052522pgz.5;
	Mon, 24 Jun 2019 12:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7R7Jgd9WydHhug2XxYGNEVBmO/kY+JWSP4a6RvRNEUc=;
	b=mSonZi44nqFi6TTFQ76DS9Svchi6OG5LbkZXoLHjY7JoTiJbqqaCChVwCiTHAubMQl
	SxeizBqeIdeTPpw3Lvnj9jtvIHUX1ZzevSMVBS9FnPwoDzGgQwjS8HeTUtkzr9WgOCFp
	cpBrkqYzPL0RW9XYPctYtfvAxOX14YkkY4KxauLrOXwN73IvwL3pyrjt4LyUOKiGdJlh
	6UjF/jm5/srik758Tp/MDUtrsJHaqsarlpG1aVfGCHQzD/cGDimCfBXyfJ6y4gGdUDrG
	uPbLHKTPet1DczA+tua7rOVZloEoK6kjsdyBaBUaZwXeg9+z4h1e8KbUpNfcXjinblHR
	YmFA==
X-Gm-Message-State: APjAAAVkfhTNAjVZm7hYvtsztIwst9nZJkaxAseHOBNQXmqdv0Aar5oN
	KceUPexRKfE2GXCB1XSHnfA=
X-Google-Smtp-Source: APXvYqx4wwT4Vt+pefHMuYP0ynmzYuda85cfUyWcxolPX1QkAjR+jUxtY+0qzRZkpI1GHqDtXPxO8w==
X-Received: by 2002:a63:4105:: with SMTP id o5mr35523361pga.308.1561405402022; 
	Mon, 24 Jun 2019 12:43:22 -0700 (PDT)
Received: from desktop-bart.svl.corp.google.com
	([2620:15c:2cd:202:4308:52a3:24b6:2c60])
	by smtp.gmail.com with ESMTPSA id c9sm12988231pfn.3.2019.06.24.12.43.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2019 12:43:21 -0700 (PDT)
To: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <mb@lightnvm.io>, axboe@fb.com,
	hch@lst.de, damien.lemoal@wdc.com, chaitanya.kulkarni@wdc.com,
	dmitry.fomichev@wdc.com, ajay.joshi@wdc.com, aravind.ramesh@wdc.com,
	martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
	agk@redhat.com, snitzer@redhat.com
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-2-mb@lightnvm.io>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <ee5764fb-473a-f118-eaac-95478d885f6f@acm.org>
Date: Mon, 24 Jun 2019 12:43:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190621130711.21986-2-mb@lightnvm.io>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 24 Jun 2019 19:43:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Mon, 24 Jun 2019 19:43:23 +0000 (UTC) for IP:'209.85.215.193'
	DOMAIN:'mail-pg1-f193.google.com'
	HELO:'mail-pg1-f193.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.491  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.215.193 mail-pg1-f193.google.com 209.85.215.193
	mail-pg1-f193.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	=?UTF-8?Q?Matias_Bj=c3=b8rling?= <matias.bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 1/4] block: add zone open,
	close and finish support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 24 Jun 2019 19:45:32 +0000 (UTC)

T24gNi8yMS8xOSA2OjA3IEFNLCBNYXRpYXMgQmrDuHJsaW5nIHdyb3RlOgo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2Jsa190eXBlcy5oIGIvaW5jbHVkZS9saW51eC9ibGtfdHlwZXMuaAo+
IGluZGV4IDk1MjAyZjgwNjc2Yy4uMDY3ZWY5MjQyMjc1IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
bGludXgvYmxrX3R5cGVzLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2Jsa190eXBlcy5oCj4gQEAg
LTI4NCwxMyArMjg0LDIwIEBAIGVudW0gcmVxX29wZiB7Cj4gICAJUkVRX09QX0RJU0NBUkQJCT0g
MywKPiAgIAkvKiBzZWN1cmVseSBlcmFzZSBzZWN0b3JzICovCj4gICAJUkVRX09QX1NFQ1VSRV9F
UkFTRQk9IDUsCj4gLQkvKiByZXNldCBhIHpvbmUgd3JpdGUgcG9pbnRlciAqLwo+IC0JUkVRX09Q
X1pPTkVfUkVTRVQJPSA2LAo+ICAgCS8qIHdyaXRlIHRoZSBzYW1lIHNlY3RvciBtYW55IHRpbWVz
ICovCj4gICAJUkVRX09QX1dSSVRFX1NBTUUJPSA3LAo+ICAgCS8qIHdyaXRlIHRoZSB6ZXJvIGZp
bGxlZCBzZWN0b3IgbWFueSB0aW1lcyAqLwo+ICAgCVJFUV9PUF9XUklURV9aRVJPRVMJPSA5LAo+
ICAgCj4gKwkvKiByZXNldCBhIHpvbmUgd3JpdGUgcG9pbnRlciAqLwo+ICsJUkVRX09QX1pPTkVf
UkVTRVQJPSAxNiwKPiArCS8qIE9wZW4gem9uZShzKSAqLwo+ICsJUkVRX09QX1pPTkVfT1BFTgk9
IDE3LAo+ICsJLyogQ2xvc2Ugem9uZShzKSAqLwo+ICsJUkVRX09QX1pPTkVfQ0xPU0UJPSAxOCwK
PiArCS8qIEZpbmlzaCB6b25lKHMpICovCj4gKwlSRVFfT1BfWk9ORV9GSU5JU0gJPSAxOSwKPiAr
Cj4gICAJLyogU0NTSSBwYXNzdGhyb3VnaCB1c2luZyBzdHJ1Y3Qgc2NzaV9yZXF1ZXN0ICovCj4g
ICAJUkVRX09QX1NDU0lfSU4JCT0gMzIsCj4gICAJUkVRX09QX1NDU0lfT1VUCQk9IDMzLAo+IEBA
IC0zNzUsNiArMzgyLDIyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBiaW9fc2V0X29wX2F0dHJzKHN0
cnVjdCBiaW8gKmJpbywgdW5zaWduZWQgb3AsCj4gICAJYmlvLT5iaV9vcGYgPSBvcCB8IG9wX2Zs
YWdzOwo+ICAgfQoKQXJlIHRoZSBuZXcgb3BlcmF0aW9uIHR5cGVzIGV2ZXIgcGFzc2VkIHRvIG9w
X2lzX3dyaXRlKCk/IFRoZSBkZWZpbml0aW9uIApvZiB0aGF0IGZ1bmN0aW9uIGlzIGFzIGZvbGxv
d3M6CgpzdGF0aWMgaW5saW5lIGJvb2wgb3BfaXNfd3JpdGUodW5zaWduZWQgaW50IG9wKQp7Cgly
ZXR1cm4gKG9wICYgMSk7Cn0KCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRo
YXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

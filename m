Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E21351BA0
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 21:47:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3927881DEB;
	Mon, 24 Jun 2019 19:47:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8A96608BA;
	Mon, 24 Jun 2019 19:47:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0BF23D87;
	Mon, 24 Jun 2019 19:47:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5OJknhR007025 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 15:46:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A569A600D1; Mon, 24 Jun 2019 19:46:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24C31600C1;
	Mon, 24 Jun 2019 19:46:45 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCDD53086218;
	Mon, 24 Jun 2019 19:46:38 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id c85so8119400pfc.1;
	Mon, 24 Jun 2019 12:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ifvZwjPwDnekn88v2jZcVDzNwUQkndcGRvqJLqxCMJM=;
	b=AeHACpC8SOOAJ0hWaheYoWQV836djB956Fw+ZsUsLGq0f1AzOyfJ8ALTeYWVjKEoEe
	365Dk9BIk9GyUnvEUbGccFso3Fs2d/zs7wcFTEuRBQguIBRzvOV3BDhAh88++qbUaT38
	GoJn2GrN2mdr3Z3bfC9VTCk69fgP1biiLpgWOmHELhTUIGLcifrLfo5c08XX9SLsfXv1
	J2/5q/hEWbzBJQi4eDKBM4sT00hysYCplANJO56QPFXROx8fLQ/PXWd73uhvaQlnufeL
	wiglkmT6dT8MeVFZeW4ka9Mkd2kFXaz+vZU37DD9uWCY5ldh4fMmsT/m6CkSr2a3lHKD
	gSSw==
X-Gm-Message-State: APjAAAU88BylW5/vnhAykVMW13ic3r72qRbBPhgqvqEvjlr4a4oLOrNC
	JKUwIAn9Re2xViHfzMZnrR4nhwGK16k=
X-Google-Smtp-Source: APXvYqyXexiRyLBKCch3RWNo/gEJaD46Zv3bDfNy7281rA63x0CF2GMKqklJcpXfrfIGHJ+S0upenA==
X-Received: by 2002:a17:90a:2648:: with SMTP id
	l66mr26400820pje.65.1561405597532; 
	Mon, 24 Jun 2019 12:46:37 -0700 (PDT)
Received: from desktop-bart.svl.corp.google.com
	([2620:15c:2cd:202:4308:52a3:24b6:2c60])
	by smtp.gmail.com with ESMTPSA id
	r15sm17932733pfc.162.2019.06.24.12.46.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2019 12:46:36 -0700 (PDT)
To: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <mb@lightnvm.io>, axboe@fb.com,
	hch@lst.de, damien.lemoal@wdc.com, chaitanya.kulkarni@wdc.com,
	dmitry.fomichev@wdc.com, ajay.joshi@wdc.com, aravind.ramesh@wdc.com,
	martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
	agk@redhat.com, snitzer@redhat.com
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-4-mb@lightnvm.io>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <db952c97-b5c9-9276-ea51-c14064c5a093@acm.org>
Date: Mon, 24 Jun 2019 12:46:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190621130711.21986-4-mb@lightnvm.io>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 24 Jun 2019 19:46:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Mon, 24 Jun 2019 19:46:38 +0000 (UTC) for IP:'209.85.210.182'
	DOMAIN:'mail-pf1-f182.google.com'
	HELO:'mail-pf1-f182.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.491  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.182 mail-pf1-f182.google.com 209.85.210.182
	mail-pf1-f182.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 3/4] scsi: sd_zbc: add zone open, close,
 and finish support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 24 Jun 2019 19:47:22 +0000 (UTC)

T24gNi8yMS8xOSA2OjA3IEFNLCBNYXRpYXMgQmrDuHJsaW5nIHdyb3RlOgo+ICsgKiBAb3A6IE9w
ZXJhdGlvbiB0byBiZSBwZXJmb3JtZWQKClRoaXMgZGVzY3JpcHRpb24gY291bGQgYmUgbW9yZSBj
bGVhci4KClRoYW5rcywKCkJhcnQuCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxA
cmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2
ZWw=

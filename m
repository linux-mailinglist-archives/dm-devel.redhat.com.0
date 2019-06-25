Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A070A550D2
	for <lists+dm-devel@lfdr.de>; Tue, 25 Jun 2019 15:53:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CAFF7EBDC;
	Tue, 25 Jun 2019 13:53:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84B98600CD;
	Tue, 25 Jun 2019 13:52:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7EC1D206D1;
	Tue, 25 Jun 2019 13:51:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PAWtVX030585 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 06:32:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A892219723; Tue, 25 Jun 2019 10:32:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A33C819936
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 10:32:53 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F220D307D85E
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 10:32:27 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id x144so4804865lfa.9
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 03:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lightnvm-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=A7lYOmGKBkEXMqKZhONBq/XEaw9Zk9p1Ct3xBmeHS1o=;
	b=g4myPHik/VDVtLYpxVZL5RmDDlI748sNxEFtnxOyRqNQdNghngq96pMu24m6LN4TWz
	GonPpoTK5itnyXQQyE83fhudsB690BoHPguK4Lwx5RXl27eKbV+MeR76wLmrRnxb2y4x
	uV1Z52olMUY95shBxscd0ndg3Il8MB9Tm0mU/CY4lBWvA4EQMYZ5cRyiJ7tkY/CekrtW
	AwqyWRnOilwi85lJcX5SQe2EE8h44SvQ+ffNpyt5G1VfPbTco3XQLlOArMc1BU87OYP3
	2bZvaAPuKqcN8V4Ivv5uTZJ1wQyEoniDqYNwbkfkXLpg2IXhOR9Rja/D39MIOKpiLOnr
	ljCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=A7lYOmGKBkEXMqKZhONBq/XEaw9Zk9p1Ct3xBmeHS1o=;
	b=li2TuVBzQNV11IvnHnolReT86s99izPGjFHhTq/colqf5L2dDTiktoAVHvX6BNm3hn
	ngVN8ePO0PphaL+uQGpak5qMeCAw7vOPXhdtrarnJxdp61SPolLmN0TXhPCX0Kj+3qXu
	FMJUuBCXaplk7/aXgHctmrMGV068qYf2ZSAVZRiwkQXjQe/KhiE4IL6F6Irnmf+qRe0Y
	HtT+L0q06hJaXN+P40wIGLQxHJsB3yAutJ42Fk8b3qEdcYAZ0bGzxpAA7K9e0n0xSqCQ
	aYIf/ra0M9wZ8puX4qvvBqsv4YbnLRkCeS+e9SHeJhdRC827TfO4vOh2R/k+H2Cu52fm
	80hg==
X-Gm-Message-State: APjAAAX+7BipnIwSyMGLPveSYp1WIaT6OdzIFMF8SOCCjQTyMiVhJCiY
	igAZXZCJA53Bvu3Ti+gjUFyM4m63QC4=
X-Google-Smtp-Source: APXvYqzBmDbBn4uaSRgOejv0dCMXCDPGoGCJEE71DIMwwmCQk8qQYYktGIfIGht24KxyuAfH1v5KOw==
X-Received: by 2002:ac2:5609:: with SMTP id v9mr21659830lfd.27.1561458746106; 
	Tue, 25 Jun 2019 03:32:26 -0700 (PDT)
Received: from [192.168.0.36] (2-111-91-225-cable.dk.customer.tdc.net.
	[2.111.91.225]) by smtp.googlemail.com with ESMTPSA id
	d15sm1867200lfq.76.2019.06.25.03.32.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jun 2019 03:32:25 -0700 (PDT)
To: Bart Van Assche <bvanassche@acm.org>, axboe@fb.com, hch@lst.de,
	damien.lemoal@wdc.com, chaitanya.kulkarni@wdc.com,
	dmitry.fomichev@wdc.com, ajay.joshi@wdc.com, aravind.ramesh@wdc.com,
	martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
	agk@redhat.com, snitzer@redhat.com
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-4-mb@lightnvm.io>
	<db952c97-b5c9-9276-ea51-c14064c5a093@acm.org>
From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <mb@lightnvm.io>
Message-ID: <62457020-b543-e08d-54fe-e8dc92d94e47@lightnvm.io>
Date: Tue, 25 Jun 2019 12:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <db952c97-b5c9-9276-ea51-c14064c5a093@acm.org>
Content-Language: en-GB
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 25 Jun 2019 10:32:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Tue, 25 Jun 2019 10:32:33 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'mb@lightnvm.io' RCPT:''
X-RedHat-Spam-Score: -0.009  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <mb@lightnvm.io>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 25 Jun 2019 09:50:33 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 25 Jun 2019 13:53:34 +0000 (UTC)

T24gNi8yNC8xOSA5OjQ2IFBNLCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6Cj4gT24gNi8yMS8xOSA2
OjA3IEFNLCBNYXRpYXMgQmrDuHJsaW5nIHdyb3RlOgo+PiArICogQG9wOiBPcGVyYXRpb24gdG8g
YmUgcGVyZm9ybWVkCj4gCj4gVGhpcyBkZXNjcmlwdGlvbiBjb3VsZCBiZSBtb3JlIGNsZWFyLgo+
IAo+IFRoYW5rcywKPiAKPiBCYXJ0LgoKVGhhbmtzIEJhcnQuIEknbGwgdXBkYXRlIGl0LgoKLS0K
ZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5D56E2E6A9C
	for <lists+dm-devel@lfdr.de>; Mon, 28 Dec 2020 21:42:49 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-LKYnqwGLMuanA89nau6ziA-1; Mon, 28 Dec 2020 15:42:46 -0500
X-MC-Unique: LKYnqwGLMuanA89nau6ziA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 599E7800D53;
	Mon, 28 Dec 2020 20:42:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEA455D9DC;
	Mon, 28 Dec 2020 20:42:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF3AB4A7C6;
	Mon, 28 Dec 2020 20:42:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BSKfuun007621 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Dec 2020 15:41:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5C07D2026D11; Mon, 28 Dec 2020 20:41:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 571CC2026D47
	for <dm-devel@redhat.com>; Mon, 28 Dec 2020 20:41:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDFB8185A794
	for <dm-devel@redhat.com>; Mon, 28 Dec 2020 20:41:53 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-195-MI7JVBDeOQy4rGgMZCXVmQ-1; Mon, 28 Dec 2020 15:41:51 -0500
X-MC-Unique: MI7JVBDeOQy4rGgMZCXVmQ-1
Received: by mail-ed1-f43.google.com with SMTP id b73so10806206edf.13;
	Mon, 28 Dec 2020 12:41:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3gSrhQoyjQju9qDav/WHe/GE6e0QH8DMA0EyuNL8kic=;
	b=gTp3snacx2x/SlkZwBrPncbjw8Q2kmAIKruuKXQZze6FREqK6e3JoBXNoAPHTIGsv2
	sM+Nf401tpj1RArKGm8YIN3Sg9kq2ZrLNYusx+oal6pf5DqzA7rFejzE8g2dmqylIYvP
	jXof+LZ/62v/3X2uOPPymOWfjN9GmHFabqm3gy1ZUSOYw8R/96WAnQIvVhSQTahjg73h
	ZWuw7JbXz6AHz4E8gmU1KdJAW1+BiCwQE9mKuuWtZonHxAFg+ukpNkTZuAf17Qg2Oy+T
	Qni9yTFAeRo9c6RmsOTvRtLLDNMMXOQTklvvt07eWfOG8+GwjCahqffkGOyvLdSbD83d
	sgqA==
X-Gm-Message-State: AOAM531DdkQcWac5mxPq7BZ0tZu7zd0ihg65TM+t1jcBFs0eca+pQMzM
	a22/JuQl6ijn7A8O+wBAP54neodzkTo=
X-Google-Smtp-Source: ABdhPJxTa3GyCmRkc4xN25QUjka2wOx3SEZRj4MnvkjjnSdPrwmGOqOBGu0VyGmSI0A1jUL7NhvR5g==
X-Received: by 2002:a05:6402:312c:: with SMTP id
	dd12mr44462139edb.327.1609188110160; 
	Mon, 28 Dec 2020 12:41:50 -0800 (PST)
Received: from [192.168.8.100] (37-48-11-100.nat.epc.tmcz.cz. [37.48.11.100])
	by smtp.gmail.com with ESMTPSA id
	w20sm37130541edi.12.2020.12.28.12.41.48
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 28 Dec 2020 12:41:49 -0800 (PST)
To: Ignat Korchagin <ignat@cloudflare.com>,
	device-mapper development <dm-devel@redhat.com>,
	jefflexu@linux.alibaba.com, Mike Snitzer <snitzer@redhat.com>
References: <CALrw=nGkAgqPDCaYLKreD3+6MGZOW1krAfVfvV0mKH-rjHriFQ@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Message-ID: <40ea029b-a2ab-ae8f-8541-df19f49420b8@gmail.com>
Date: Mon, 28 Dec 2020 21:41:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CALrw=nGkAgqPDCaYLKreD3+6MGZOW1krAfVfvV0mKH-rjHriFQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Ondrej Kozina <okozina@redhat.com>,
	kernel-team <kernel-team@cloudflare.com>
Subject: Re: [dm-devel] dm crypt: export sysfs of kcryptd workqueue - broken
 dmsetup reload
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 23/12/2020 22:48, Ignat Korchagin wrote:
> Hi,
> 
> Looks like a2b8b2d975673b1a50ab0bcce5d146b9335edfad broke the ability
> to reload dm-crypt targets.

Hi,

yes, and it breaks completely cryptsetup reencryption and many other
functions in cryptsetup.

Nobody apparently tried cryptsetup tests that has a lot of dm-crypt
regression tests. It easily detects this problem (at least 4 tests fail now).

Mike, I think the patch above need to be reverted or fixed ASAP.
(Also note that this is now part of API, see WQ_SYSFS doc!)

You can easily reproduce this problem with recent cryptsetup (2.3.4
supports mentioned flags already - but it is generic problem with reload):

# echo password | cryptsetup --type plain open <device> test
# echo password | cryptsetup refresh --perf-no_read_workqueue test
device-mapper: reload ioctl on   failed: Cannot allocate memory

While with WQ_SYSFS flag removed (in principle revert of the patch):

# echo password | cryptsetup --type plain open <device> test
# echo password | cryptsetup refresh --perf-no_read_workqueue test
# cryptsetup status test
/dev/mapper/test is active.
  type:    PLAIN
...
  flags:   no_read_workqueue 

...
> Seems we're missing a clean-up somewhere, so it tries to create multiple queues.

I am afraid it is not so simple, during reload we have two DM table instances
(active and inactive), seems both create workqueues and conflicts
on sysfs kobject. No idea if there is a WQ API to solve this...

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


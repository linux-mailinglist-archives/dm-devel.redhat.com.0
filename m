Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 780631B023C
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 09:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587366447;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VcN4aR2Af+9epgjpAm9wuprLZZXElxeCl7Q+QxeHwYc=;
	b=XHHG43WzvL1ExIwMCkdMYn9DAyWz07DLHvW+/2rGzBM5SxYBRhJfV+SDu8vSTtMZ2KxjCk
	8yvDYKWvdvb+0z6DkYeB3URBqGpIXfktljl3xRlSD6+GrMBIecPdGCKuzojSxMm8JpwW8g
	Li8+8KT+oljTBVenvKLaECdBVvL0F7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-TDhI1UwzM1CvXSdKko2urg-1; Mon, 20 Apr 2020 03:07:24 -0400
X-MC-Unique: TDhI1UwzM1CvXSdKko2urg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDB19801E6C;
	Mon, 20 Apr 2020 07:07:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B43512B479;
	Mon, 20 Apr 2020 07:07:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FB7993902;
	Mon, 20 Apr 2020 07:07:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03IDS3hl028624 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 18 Apr 2020 09:28:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A2CCC104949C; Sat, 18 Apr 2020 13:28:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EDB1104949A
	for <dm-devel@redhat.com>; Sat, 18 Apr 2020 13:28:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB355800294
	for <dm-devel@redhat.com>; Sat, 18 Apr 2020 13:28:00 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [146.101.78.151]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-19-477etdm-O1-ie6WKBj59_A-1;
	Sat, 18 Apr 2020 09:27:58 -0400
X-MC-Unique: 477etdm-O1-ie6WKBj59_A-1
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-163-iEq3HNYPO8Gv4ZuIWssZ0w-1; Sat, 18 Apr 2020 14:27:54 +0100
X-MC-Unique: iEq3HNYPO8Gv4ZuIWssZ0w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Sat, 18 Apr 2020 14:27:54 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Sat, 18 Apr 2020 14:27:54 +0100
From: David Laight <David.Laight@aculab.com>
To: "'Mikulas Patocka'" <mpatocka@redhat.com>, Dan Williams
	<dan.j.williams@intel.com>
Thread-Topic: [PATCH] x86: introduce memcpy_flushcache_clflushopt
Thread-Index: AQHWFLZf1uwJ38llN06XsGw6srhIuah+3wRg
Date: Sat, 18 Apr 2020 13:27:53 +0000
Message-ID: <69c2e011c5814255926f309dd50e6d67@AcuMS.aculab.com>
References: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4goJ2jbXNVZbMUKtRUominhuMhuTKrMh=fnhrfvC4jyjw@mail.gmail.com>
	<alpine.LRH.2.02.2004081439080.13932@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4grNHvyYEc4W6PkymhEJvLb17tXbC3JZdqvtFxmMZ8DCQ@mail.gmail.com>
	<alpine.LRH.2.02.2004090612320.27517@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2004160411460.7833@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4gpe8u=zNrRhvd9ioVNGbOJfRUXzFZuV--be6Hbj0xXtQ@mail.gmail.com>
	<alpine.LRH.2.02.2004170831530.16047@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2004170831530.16047@file01.intranet.prod.int.rdu2.redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03IDS3hl028624
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Apr 2020 03:06:56 -0400
Cc: Peter
	Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>, Linux Kernel
	Mailing List <linux-kernel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [dm-devel] [PATCH] x86: introduce memcpy_flushcache_clflushopt
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Mikulas Patocka
> Sent: 17 April 2020 13:47
...
> Index: linux-2.6/drivers/md/dm-writecache.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-writecache.c	2020-04-17 14:06:35.139999000 +0200
> +++ linux-2.6/drivers/md/dm-writecache.c	2020-04-17 14:06:35.129999000 +0200
> @@ -1166,7 +1166,10 @@ static void bio_copy_block(struct dm_wri
>  			}
>  		} else {
>  			flush_dcache_page(bio_page(bio));
> -			memcpy_flushcache(data, buf, size);
> +			if (likely(size > 512))
> +				memcpy_flushcache_clflushopt(data, buf, size);
> +			else
> +				memcpy_flushcache(data, buf, size);

Hmmm... have you looked at how long clflush actually takes?
It isn't too bad if you just do a small number, but using it
to flush large buffers can be very slow.

I've an Ivy bridge system where the X-server process requests the
frame buffer be flushed out every 10 seconds (no idea why).
With my 2560x1440 monitor this takes over 3ms.

This really needs a cond_resched() every few clflush instructions.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D01BB1B023A
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 09:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587366443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SUajQYwo8iJJfJi4sWd3RDXES+wluGh8sRdWXdQbENk=;
	b=PBf6al/Gb9aK1FJphvMXtf8Y1o1si0XsC7zGtgOnL7mwv2HckKKqWOncr6bZcpsdVbZ1+8
	ckkjNK6R44YgcUztqBz9BJrXDKPcUVuQdY5Py2KcNkGDRbY9J8Det3rqoxmP2uwKo6mvgt
	T6cb7BHxTDrLg75YHy/f+rzC6Mmh4DU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-klIRSVzJNvqll1drkbf2fQ-1; Mon, 20 Apr 2020 03:07:21 -0400
X-MC-Unique: klIRSVzJNvqll1drkbf2fQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAB80801E57;
	Mon, 20 Apr 2020 07:07:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FE07A105E;
	Mon, 20 Apr 2020 07:07:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C2D418089C8;
	Mon, 20 Apr 2020 07:07:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HKjrjq031939 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 16:45:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A226B101F0CE; Fri, 17 Apr 2020 20:45:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E8F1101F0CD
	for <dm-devel@redhat.com>; Fri, 17 Apr 2020 20:45:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF1C18007D4
	for <dm-devel@redhat.com>; Fri, 17 Apr 2020 20:45:50 +0000 (UTC)
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-329-vGG2o4EjP9WK_5dV23g1uQ-1; Fri, 17 Apr 2020 16:45:48 -0400
X-MC-Unique: vGG2o4EjP9WK_5dV23g1uQ-1
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
	helo=nanos.tec.linutronix.de) by Galois.linutronix.de with esmtpsa
	(TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
	(envelope-from <tglx@linutronix.de>)
	id 1jPXro-0006wp-2U; Fri, 17 Apr 2020 22:45:40 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
	id 83013100C47; Fri, 17 Apr 2020 22:45:39 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Dan Williams <dan.j.williams@intel.com>,
	Mikulas Patocka <mpatocka@redhat.com>
In-Reply-To: <CAPcyv4jjJ_SZuAjdhdQKGWh6qiP1O4kFyzP9BcBgbb2oanc=yQ@mail.gmail.com>
References: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4goJ2jbXNVZbMUKtRUominhuMhuTKrMh=fnhrfvC4jyjw@mail.gmail.com>
	<alpine.LRH.2.02.2004081439080.13932@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4grNHvyYEc4W6PkymhEJvLb17tXbC3JZdqvtFxmMZ8DCQ@mail.gmail.com>
	<alpine.LRH.2.02.2004090612320.27517@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2004160411460.7833@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4gpe8u=zNrRhvd9ioVNGbOJfRUXzFZuV--be6Hbj0xXtQ@mail.gmail.com>
	<alpine.LRH.2.02.2004170831530.16047@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4jjJ_SZuAjdhdQKGWh6qiP1O4kFyzP9BcBgbb2oanc=yQ@mail.gmail.com>
Date: Fri, 17 Apr 2020 22:45:39 +0200
Message-ID: <87a739zvrg.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
	SHORTCIRCUIT=-0.0001
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03HKjrjq031939
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Apr 2020 03:06:56 -0400
Cc: Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dan Williams <dan.j.williams@intel.com> writes:
> On Fri, Apr 17, 2020 at 5:47 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
>> +#define __HAVE_ARCH_MEMCPY_FLUSHCACHE_CLFLUSHOPT 1
>> +void memcpy_flushcache_clflushopt(void *dst, const void *src, size_t cnt);
>
> This naming promotes an x86ism and it does not help the caller
> understand why 'flushcache_clflushopt' is preferred over 'flushcache'.

Right.

> The goal of naming it _inatomic() was specifically for the observation
> that your driver coordinates atomic access and does not benefit from
> the cache friendliness that non-temporal stores afford. That said
> _inatomic() is arguably not a good choice either because that refers
> to whether the copy is prepared to take a fault or not. What about
> _exclusive() or _single()? Anything but _clflushopt() that conveys no
> contextual information.
>
> Other than quibbling with the name, and one more comment below, this
> looks ok to me.
>
>> Index: linux-2.6/drivers/md/dm-writecache.c
>> ===================================================================
>> --- linux-2.6.orig/drivers/md/dm-writecache.c   2020-04-17 14:06:35.139999000 +0200
>> +++ linux-2.6/drivers/md/dm-writecache.c        2020-04-17 14:06:35.129999000 +0200
>> @@ -1166,7 +1166,10 @@ static void bio_copy_block(struct dm_wri
>>                         }
>>                 } else {
>>                         flush_dcache_page(bio_page(bio));
>> -                       memcpy_flushcache(data, buf, size);
>> +                       if (likely(size > 512))
>
> This needs some reference to how this magic number is chosen and how a
> future developer might determine whether the value needs to be
> adjusted.

I don't think it's a good idea to make this decision in generic code as
architectures or even CPU models might have different constraints on the
size.

So I'd rather let the architecture implementation decide and make this

                         flush_dcache_page(bio_page(bio));
 -                       memcpy_flushcache(data, buf, size);
 +                       memcpy_flushcache_bikesheddedname(data, buf, size);

and have the default fallback memcpy_flushcache() and let the
architecture sort the size limit and the underlying technology out.

So x86 can use clflushopt or implement it with movdir64b and any other
architecture can provide their own magic soup without changing the
callsite.

Thanks,

        tglx




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE1414C9B2
	for <lists+dm-devel@lfdr.de>; Wed, 29 Jan 2020 12:34:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580297653;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jRNs18Jj02p84mEzrSjQhY6XV+h6kbE9JNc86vLTqys=;
	b=fKfB7gdKeq5N6z6vMF4+EwC2eurW8rK0ECGLThBusOfSv7nZE3PEp3d1fbCs2AvxGcX4mL
	IcG5RnGVQ32jJK7RFn6jE4WYYpzj3vGW4nN8Mobd+EhD4NRVKPo748MmHrNwM50IFaka9Y
	sAmEFXAI0JOOQJKXD9BkWMBn39OKRFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-JwUB32ACNO64dcsw9AxUFQ-1; Wed, 29 Jan 2020 06:34:07 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4640B8014D3;
	Wed, 29 Jan 2020 11:34:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A5E589D26;
	Wed, 29 Jan 2020 11:33:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52F4118089CD;
	Wed, 29 Jan 2020 11:33:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00SBcjFY015639 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jan 2020 06:38:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D8F4D10BE38F; Tue, 28 Jan 2020 11:38:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D47B910BE38D
	for <dm-devel@redhat.com>; Tue, 28 Jan 2020 11:38:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67D47101928D
	for <dm-devel@redhat.com>; Tue, 28 Jan 2020 11:38:43 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-175-qUo1MuE1OlSpgfcZp6dLZQ-1; Tue, 28 Jan 2020 06:38:40 -0500
Received: by mail-lf1-f65.google.com with SMTP id 9so8813474lfq.10
	for <dm-devel@redhat.com>; Tue, 28 Jan 2020 03:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=shek/n2yaJ4xNGyr8p8VRMr5B9/J6o+UNlVfe5LW8Wk=;
	b=BWLF2XVyvMJ8+tOYqD2qmq7krcZ8ek0qwxg00LhXFDA9XiUU4bIovj3w5mINLf0+zh
	O+2Wad+8XS+buxmCc9ADmoqf1IcgF5RuYoOTCVib3T5RfoEBVMv/dyOQuGUVah3f+l2L
	ntucD2MrxZeVLwjhk7TpqU4WlcCDMnZdfFe+xhQlZ0ZIYFPNdo+dKb6blFInCaJ1WN2t
	CWoy7F2Eq0YyrwNZGY7xZpMUIDSHKDBk92Mzw/fU3DBo4tZsB6mI1sCwJkfWRUGiXv1m
	ruBXqZH0IIGXEJOW95Oc30x5lkwC/4qjDlD8BVqu16CdNQfjBvAjz6UsS9Hiw2cxAO8x
	Q+yQ==
X-Gm-Message-State: APjAAAWnCq4+MsyCZW/g8+TYXmTqc9CFpWB/1d+0ttUYNFujwtO1FtX1
	6MIOHdynXUUOPJoXuMpqVg85rXsdkcZsKO8MeZyPTg==
X-Google-Smtp-Source: APXvYqxIGZaVMql0dzFVuAp0Npksnl5WAwwR8IJITZh402Xtqso4VRK/EtNCV+s++HoutkYkagjhKbkeoADGPMcI5j8=
X-Received: by 2002:ac2:5467:: with SMTP id e7mr2052345lfn.74.1580211518997;
	Tue, 28 Jan 2020 03:38:38 -0800 (PST)
MIME-Version: 1.0
References: <20180630201750.2588-1-andriy.shevchenko@linux.intel.com>
	<20180630201750.2588-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20180630201750.2588-4-andriy.shevchenko@linux.intel.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 28 Jan 2020 17:08:27 +0530
Message-ID: <CA+G9fYs3GPid5fcHEWp2i9NKR1hQGc5h0zKaUK5xr1RGJ83xLg@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-MC-Unique: qUo1MuE1OlSpgfcZp6dLZQ-1
X-MC-Unique: JwUB32ACNO64dcsw9AxUFQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00SBcjFY015639
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 29 Jan 2020 06:33:33 -0500
Cc: Mike Snitzer <snitzer@redhat.com>, mika.westerberg@linux.intel.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	linux- stable <stable@vger.kernel.org>,
	linux-raid@vger.kernel.org, dm-devel@redhat.com,
	Yury Norov <ynorov@caviumnetworks.com>,
	lkft-triage@lists.linaro.org, linux-input@vger.kernel.org,
	Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
	Shaohua Li <shli@kernel.org>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v4 3/5] bitmap: Add bitmap_alloc(),
	bitmap_zalloc() and bitmap_free()
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

On Sun, 1 Jul 2018 at 01:49, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> A lot of code become ugly because of open coding allocations for bitmaps.
>
> Introduce three helpers to allow users be more clear of intention
> and keep their code neat.
>
> Note, due to multiple circular dependencies we may not provide
> the helpers as inliners. For now we keep them exported and, perhaps,
> at some point in the future we will sort out header inclusion and
> inheritance.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/bitmap.h |  8 ++++++++
>  lib/bitmap.c           | 19 +++++++++++++++++++
>  2 files changed, 27 insertions(+)
>
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 1ee46f492267..acf5e8df3504 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -104,6 +104,14 @@
>   * contain all bit positions from 0 to 'bits' - 1.
>   */
>
> +/*
> + * Allocation and deallocation of bitmap.
> + * Provided in lib/bitmap.c to avoid circular dependency.
> + */
> +extern unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
> +extern unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
> +extern void bitmap_free(const unsigned long *bitmap);
> +
>  /*
>   * lib/bitmap.c provides these functions:
>   */
> diff --git a/lib/bitmap.c b/lib/bitmap.c
> index 33e95cd359a2..09acf2fd6a35 100644
> --- a/lib/bitmap.c
> +++ b/lib/bitmap.c
> @@ -13,6 +13,7 @@
>  #include <linux/bitops.h>
>  #include <linux/bug.h>
>  #include <linux/kernel.h>
> +#include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/uaccess.h>
>
> @@ -1125,6 +1126,24 @@ void bitmap_copy_le(unsigned long *dst, const unsigned long *src, unsigned int n
>  EXPORT_SYMBOL(bitmap_copy_le);
>  #endif
>
> +unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags)
> +{
> +       return kmalloc_array(BITS_TO_LONGS(nbits), sizeof(unsigned long), flags);
> +}
> +EXPORT_SYMBOL(bitmap_alloc);
> +
> +unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags)
> +{
> +       return bitmap_alloc(nbits, flags | __GFP_ZERO);
> +}
> +EXPORT_SYMBOL(bitmap_zalloc);
> +
> +void bitmap_free(const unsigned long *bitmap)
> +{
> +       kfree(bitmap);
> +}
> +EXPORT_SYMBOL(bitmap_free);
> +
>  #if BITS_PER_LONG == 64
>  /**
>   * bitmap_from_arr32 - copy the contents of u32 array of bits to bitmap

stable-rc 4.14 build failed due to these build error,

lib/bitmap.c: In function 'bitmap_from_u32array':
lib/bitmap.c:1133:1: warning: ISO C90 forbids mixed declarations and
code [-Wdeclaration-after-statement]
 unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags)
 ^~~~~~~~
In file included from
/srv/oe/build/tmp-lkft-glibc/work-shared/intel-corei7-64/kernel-source/lib/bitmap.c:8:0:
lib/bitmap.c:1138:15: error: non-static declaration of 'bitmap_alloc'
follows static declaration
 EXPORT_SYMBOL(bitmap_alloc);
               ^
include/linux/export.h:65:21: note: in definition of macro '___EXPORT_SYMBOL'
  extern typeof(sym) sym;      \
                     ^~~
lib/bitmap.c:1138:1: note: in expansion of macro 'EXPORT_SYMBOL'
 EXPORT_SYMBOL(bitmap_alloc);
 ^~~~~~~~~~~~~
lib/bitmap.c:1133:16: note: previous definition of 'bitmap_alloc' was here
 unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags)
                ^~~~~~~~~~~~
In file included from
/srv/oe/build/tmp-lkft-glibc/work-shared/intel-corei7-64/kernel-source/lib/bitmap.c:8:0:
lib/bitmap.c:1144:15: error: non-static declaration of 'bitmap_zalloc'
follows static declaration
 EXPORT_SYMBOL(bitmap_zalloc);
               ^
include/linux/export.h:65:21: note: in definition of macro '___EXPORT_SYMBOL'
  extern typeof(sym) sym;      \
                     ^~~
lib/bitmap.c:1144:1: note: in expansion of macro 'EXPORT_SYMBOL'
 EXPORT_SYMBOL(bitmap_zalloc);
 ^~~~~~~~~~~~~
lib/bitmap.c:1140:16: note: previous definition of 'bitmap_zalloc' was here
 unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags)
                ^~~~~~~~~~~~~
In file included from
/srv/oe/build/tmp-lkft-glibc/work-shared/intel-corei7-64/kernel-source/lib/bitmap.c:8:0:
lib/bitmap.c:1150:15: error: non-static declaration of 'bitmap_free'
follows static declaration
 EXPORT_SYMBOL(bitmap_free);
               ^
include/linux/export.h:65:21: note: in definition of macro '___EXPORT_SYMBOL'
  extern typeof(sym) sym;      \
                     ^~~
lib/bitmap.c:1150:1: note: in expansion of macro 'EXPORT_SYMBOL'
 EXPORT_SYMBOL(bitmap_free);
 ^~~~~~~~~~~~~
lib/bitmap.c:1146:6: note: previous definition of 'bitmap_free' was here
 void bitmap_free(const unsigned long *bitmap)
      ^~~~~~~~~~~
  CC      drivers/char/random.o
scripts/Makefile.build:326: recipe for target 'lib/bitmap.o' failed
make[3]: *** [lib/bitmap.o] Error 1
Makefile:1052: recipe for target 'lib' failed
make[2]: *** [lib] Error 2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


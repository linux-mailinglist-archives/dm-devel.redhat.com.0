Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF19FE7F
	for <lists+dm-devel@lfdr.de>; Wed, 28 Aug 2019 11:32:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18F6E3082E40;
	Wed, 28 Aug 2019 09:32:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A4154A5;
	Wed, 28 Aug 2019 09:32:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9328C24F31;
	Wed, 28 Aug 2019 09:31:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7QIe7N3016604 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Aug 2019 14:40:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5A815D9E2; Mon, 26 Aug 2019 18:40:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0B4E5D9E1
	for <dm-devel@redhat.com>; Mon, 26 Aug 2019 18:40:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 526261196E62
	for <dm-devel@redhat.com>; Mon, 26 Aug 2019 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TlbGGRimIFoER4Eoe8SUJFAjtoU3fH+8C5wgGkgKTdw=;
	b=Eu2OwW0gMcAlJpcyiOiLAVAtB
	V0pHfL2R1/VkV0VqpkeNwzr7alqEzwLxaEgpcnK52dUj3Vebv/ZvrMVJ5ThNyPxqv7IF0oU8SakBh
	R9em8SXLkW7bvHFtfqDjU5klSJaMLS5vaS7Q7xgHWMgmCKWsn0n4BeCKY9o+tpzPrAlRAB8OysNdO
	P8BabzHViAuY3RJdHX38u27ilCT218FDi0niw/0/FsNoc2hPF2ZL/PKZnAMc6VKFVUq6SF0jkLHuI
	+40feB4E7LQvl2vF7HtQQZwkQiT8Ns7+8cAMYBUgpWosmxkv8oOcCv/7ZgxOJbG6+45C0nqRPdHui
	lCuuq2B/Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
	Hat Linux)) id 1i2JuH-0007kj-0w; Mon, 26 Aug 2019 18:39:57 +0000
Date: Mon, 26 Aug 2019 11:39:56 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Denis Efremov <efremov@ispras.ru>
Message-ID: <20190826183956.GF15933@bombadil.infradead.org>
References: <20190821074200.2203-1-efremov@ispras.ru>
	<20190824100102.1167-1-efremov@ispras.ru>
	<20190825061158.GC28002@bombadil.infradead.org>
	<ba051566-0343-ea75-0484-8852f65a15da@ispras.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba051566-0343-ea75-0484-8852f65a15da@ispras.ru>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.65]); Mon, 26 Aug 2019 18:40:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Mon, 26 Aug 2019 18:40:04 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'willy@infradead.org' RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 28 Aug 2019 05:31:41 -0400
Cc: Vladimir Shelekhov <vshel@iis.nsk.su>, Jan Kara <jack@suse.cz>,
	Matthew Wilcox <matthew@wil.cx>, Akinobu Mita <akinobu.mita@gmail.com>,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	Erdem Tumurov <erdemus@gmail.com>, linux-fsdevel@vger.kernel.org,
	akpm@linux-foundation.org, linux-media@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v2] lib/memweight.c: open codes
	bitmap_weight()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 28 Aug 2019 09:32:05 +0000 (UTC)

On Sun, Aug 25, 2019 at 02:39:47PM +0300, Denis Efremov wrote:
> On 25.08.2019 09:11, Matthew Wilcox wrote:
> > On Sat, Aug 24, 2019 at 01:01:02PM +0300, Denis Efremov wrote:
> >> This patch open codes the bitmap_weight() call. The direct
> >> invocation of hweight_long() allows to remove the BUG_ON and
> >> excessive "longs to bits, bits to longs" conversion.
> > 
> > Honestly, that's not the problem with this function.  Take a look
> > at https://danluu.com/assembly-intrinsics/ for a _benchmarked_
> > set of problems with popcnt.
> > 
> >> BUG_ON was required to check that bitmap_weight() will return
> >> a correct value, i.e. the computed weight will fit the int type
> >> of the return value.
> > 
> > What?  No.  Look at the _arguments_ of bitmap_weight():
> > 
> > static __always_inline int bitmap_weight(const unsigned long *src, unsigned int nbits)
> 
> I'm not sure why it is INT_MAX then? I would expect in case we care only about arguments
> something like:
>  
> BUG_ON(longs >= UINT_MAX / BITS_PER_LONG);

People aren't always terribly consistent with INT_MAX vs UINT_MAX.
Also, bitmap_weight() should arguably return an unisnged int (it can't
legitimately return a negative value).

> >> With this patch memweight() controls the
> >> computation directly with size_t type everywhere. Thus, the BUG_ON
> >> becomes unnecessary.
> > 
> > Why are you bothering?  How are you allocating half a gigabyte of memory?
> > Why are you calling memweight() on half a gigabyte of memory?
> > 
> 
> No, we don't use such big arrays. However, it's possible to remove BUG_ON and make
> the code more "straight". Why do we need to "artificially" limit this function
> to arrays of a particular size if we can relatively simple omit this restriction?

You're not making a great case for changing the implementation of
memweight() here ...

> I don't know how the implementation of this optimization will look like in it's
> final shape, because of different hardware/compiler issues. It looks there are
> a number of different ways to do it https://arxiv.org/pdf/1611.07612.pdf, 
> http://0x80.pl/articles/sse-popcount.html.

The problem with using XMM registers is that they have to be saved/restored.
Not to mention the thermal issues caused by heavy usage of AVX instructions.

> However, if it will be based on popcnt instruction I would expect that
> hweight_long will also contain this intrinsics. Since version 4.9.2
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=62011#c13 GCC knows of the
> false-dependency in popcnt and generates code to handle it

Ah!  Glad to see GCC knows about this problem and has worked around it.

> (e.g. xor https://godbolt.org/z/Q7AW_d) Thus, I would expect that it's
> possible to use popcnt intrinsics in hweight_long that would be natively
> optimized in all loops like "for (...) { res += hweight_long() }" without
> requiring manual unrolling like in builtin_popcnt_unrolled_errata_manual
> example of Dan Luu's optimization.

That might be expecting rather more from our compiler than is reasonable ...

> > 
> > Also, why does the trailer do this:
> > 
> >         for (; bytes > 0; bytes--, bitmap++)
> >                 ret += hweight8(*bitmap);
> > 
> > instead of calling hweight_long on *bitmap & mask?
> > 
> 
> Do you mean something like this?
> 
>         longs = bytes;
>         bytes = do_div(longs, sizeof(long));
>         bitmap_long = (const unsigned long *)bitmap;
>         if (longs) {
>                 for (; longs > 0; longs--, bitmap_long++)
>                         ret += hweight_long(*bitmap_long);
>         }
>         if (bytes) {
>                 ret += hweight_long(*bitmap_long &
>                                    ((0x1 << bytes * BITS_PER_BYTE) - 1));
>         }
> 
> The *bitmap_long will lead to buffer overflow here.

No it won't.  The CPU will access more bytes than the `bytes' argument
would seem to imply -- but it's going to have fetched that entire
cacheline anyway.  It might confuse a very strict bounds checking library,
but usually those just check you're not accessing outside your object,
which is going to be a multiple of 'sizeof(long)' anyway.

If we do something like this, we'll need to use an 'inverse' of that mask
on big-endian machines.  ie something more like:

	if (bytes) {
		unsigned long mask;
		if (_BIG_ENDIAN)
			mask = ~0UL >> (bytes * 8);
		else
			mask = ~0UL << (bytes * 8);
		ret += hweight_long(*bitmap_long & ~mask);
	}

Also we need a memweight() test to be sure we didn't get that wrong.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F260E9CA32
	for <lists+dm-devel@lfdr.de>; Mon, 26 Aug 2019 09:24:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 115FC8D5BAD;
	Mon, 26 Aug 2019 07:24:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D499F600C4;
	Mon, 26 Aug 2019 07:24:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 756D82551E;
	Mon, 26 Aug 2019 07:24:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7PBdrQq031584 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 25 Aug 2019 07:39:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8A7219C70; Sun, 25 Aug 2019 11:39:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3D8119C6A
	for <dm-devel@redhat.com>; Sun, 25 Aug 2019 11:39:51 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.45])
	by mx1.redhat.com (Postfix) with ESMTP id 1C48A10C6967
	for <dm-devel@redhat.com>; Sun, 25 Aug 2019 11:39:49 +0000 (UTC)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru
	[188.32.48.208])
	by mail.ispras.ru (Postfix) with ESMTPSA id 6026D54006B;
	Sun, 25 Aug 2019 14:39:47 +0300 (MSK)
To: Matthew Wilcox <willy@infradead.org>
References: <20190821074200.2203-1-efremov@ispras.ru>
	<20190824100102.1167-1-efremov@ispras.ru>
	<20190825061158.GC28002@bombadil.infradead.org>
From: Denis Efremov <efremov@ispras.ru>
Message-ID: <ba051566-0343-ea75-0484-8852f65a15da@ispras.ru>
Date: Sun, 25 Aug 2019 14:39:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190825061158.GC28002@bombadil.infradead.org>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.65]); Sun, 25 Aug 2019 11:39:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Sun, 25 Aug 2019 11:39:50 +0000 (UTC) for IP:'83.149.199.45'
	DOMAIN:'mail.ispras.ru' HELO:'mail.ispras.ru'
	FROM:'efremov@ispras.ru' RCPT:''
X-RedHat-Spam-Score: 0  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 83.149.199.45 mail.ispras.ru 83.149.199.45
	mail.ispras.ru <efremov@ispras.ru>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 26 Aug 2019 03:24:39 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Mon, 26 Aug 2019 07:24:56 +0000 (UTC)



On 25.08.2019 09:11, Matthew Wilcox wrote:
> On Sat, Aug 24, 2019 at 01:01:02PM +0300, Denis Efremov wrote:
>> This patch open codes the bitmap_weight() call. The direct
>> invocation of hweight_long() allows to remove the BUG_ON and
>> excessive "longs to bits, bits to longs" conversion.
> 
> Honestly, that's not the problem with this function.  Take a look
> at https://danluu.com/assembly-intrinsics/ for a _benchmarked_
> set of problems with popcnt.
> 
>> BUG_ON was required to check that bitmap_weight() will return
>> a correct value, i.e. the computed weight will fit the int type
>> of the return value.
> 
> What?  No.  Look at the _arguments_ of bitmap_weight():
> 
> static __always_inline int bitmap_weight(const unsigned long *src, unsigned int nbits)

I'm not sure why it is INT_MAX then? I would expect in case we care only about arguments
something like:
 
BUG_ON(longs >= UINT_MAX / BITS_PER_LONG);

> 
>> With this patch memweight() controls the
>> computation directly with size_t type everywhere. Thus, the BUG_ON
>> becomes unnecessary.
> 
> Why are you bothering?  How are you allocating half a gigabyte of memory?
> Why are you calling memweight() on half a gigabyte of memory?
> 

No, we don't use such big arrays. However, it's possible to remove BUG_ON and make
the code more "straight". Why do we need to "artificially" limit this function
to arrays of a particular size if we can relatively simple omit this restriction?

> 
> If you really must change anything, I'd rather see this turned into a
> loop:
> 
> 	while (longs) {
> 		unsigned int nbits;
> 
> 		if (longs >= INT_MAX / BITS_PER_LONG)
> 			nbits = INT_MAX + 1;
> 		else
> 			nbits = longs * BITS_PER_LONG;
> 
> 		ret += bitmap_weight((unsigned long *)bitmap, sz);
> 		bytes -= nbits / 8;
> 		bitmap += nbits / 8;
> 		longs -= nbits / BITS_PER_LONG;
> 	}
> 
> then we only have to use Dan Luu's optimisation in bitmap_weight()
> and not in memweight() as well.

I don't know how the implementation of this optimization will look like in it's
final shape, because of different hardware/compiler issues. It looks there are
a number of different ways to do it https://arxiv.org/pdf/1611.07612.pdf, 
http://0x80.pl/articles/sse-popcount.html.

However, if it will be based on popcnt instruction I would expect that
hweight_long will also contain this intrinsics. Since version 4.9.2
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=62011#c13 GCC knows of the
false-dependency in popcnt and generates code to handle it
(e.g. xor https://godbolt.org/z/Q7AW_d) Thus, I would expect that it's
possible to use popcnt intrinsics in hweight_long that would be natively
optimized in all loops like "for (...) { res += hweight_long() }" without
requiring manual unrolling like in builtin_popcnt_unrolled_errata_manual
example of Dan Luu's optimization.

> 
> Also, why does the trailer do this:
> 
>         for (; bytes > 0; bytes--, bitmap++)
>                 ret += hweight8(*bitmap);
> 
> instead of calling hweight_long on *bitmap & mask?
> 

Do you mean something like this?

        longs = bytes;
        bytes = do_div(longs, sizeof(long));
        bitmap_long = (const unsigned long *)bitmap;
        if (longs) {
                for (; longs > 0; longs--, bitmap_long++)
                        ret += hweight_long(*bitmap_long);
        }
        if (bytes) {
                ret += hweight_long(*bitmap_long &
                                   ((0x1 << bytes * BITS_PER_BYTE) - 1));
        }

The *bitmap_long will lead to buffer overflow here.

Thanks,
Denis

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

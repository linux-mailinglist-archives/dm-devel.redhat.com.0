Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E80959CA2B
	for <lists+dm-devel@lfdr.de>; Mon, 26 Aug 2019 09:24:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 253F0878E5D;
	Mon, 26 Aug 2019 07:24:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7168600CE;
	Mon, 26 Aug 2019 07:24:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 031D31802218;
	Mon, 26 Aug 2019 07:24:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7P6CAkT023957 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 25 Aug 2019 02:12:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE9D060A35; Sun, 25 Aug 2019 06:12:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B948D60606
	for <dm-devel@redhat.com>; Sun, 25 Aug 2019 06:12:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98D34308FC23
	for <dm-devel@redhat.com>; Sun, 25 Aug 2019 06:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JpNLDg+KbIEgZXCqJMuphSCAD3VmeNChk2WlGZXcmTM=;
	b=k6MEvGTLP99lhrLpceqHgFSml
	G9ZIXHbGuMPSYdG+JTUQHLsZXaY8kreOrv3MxHREKQ+lS9LovBQJCCHXv7+ejU8IFEviTLHfByPN4
	fe2WH/h2wHRO5ggFgeu0Zudl7UtaX2CilZGs9xtZK8Z8RnQNKjf0OVOJgzp2nUsptBhtKzPJ4CWXu
	VoT/z7IZMAQtAdmMyOHRmicelf2gSj75d5Ap+HdOwizF1VtYmwMkZmGcPn9Q0RWby0D/vfVNEIpDn
	QB6v8LYGXr+/sE9rLLYVifd4O/CWBYyyfrbYpn8/FxWir/CB7jYRNVCb7tYcjEnCIky0IP5qL4nzw
	4wB5c07aw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
	Hat Linux)) id 1i1lks-0001Yj-Kw; Sun, 25 Aug 2019 06:11:58 +0000
Date: Sat, 24 Aug 2019 23:11:58 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Denis Efremov <efremov@ispras.ru>
Message-ID: <20190825061158.GC28002@bombadil.infradead.org>
References: <20190821074200.2203-1-efremov@ispras.ru>
	<20190824100102.1167-1-efremov@ispras.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190824100102.1167-1-efremov@ispras.ru>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Sun, 25 Aug 2019 06:12:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Sun, 25 Aug 2019 06:12:07 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'willy@infradead.org' RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Mon, 26 Aug 2019 07:24:49 +0000 (UTC)

On Sat, Aug 24, 2019 at 01:01:02PM +0300, Denis Efremov wrote:
> This patch open codes the bitmap_weight() call. The direct
> invocation of hweight_long() allows to remove the BUG_ON and
> excessive "longs to bits, bits to longs" conversion.

Honestly, that's not the problem with this function.  Take a look
at https://danluu.com/assembly-intrinsics/ for a _benchmarked_
set of problems with popcnt.

> BUG_ON was required to check that bitmap_weight() will return
> a correct value, i.e. the computed weight will fit the int type
> of the return value.

What?  No.  Look at the _arguments_ of bitmap_weight():

static __always_inline int bitmap_weight(const unsigned long *src, unsigned int nbits)

> With this patch memweight() controls the
> computation directly with size_t type everywhere. Thus, the BUG_ON
> becomes unnecessary.

Why are you bothering?  How are you allocating half a gigabyte of memory?
Why are you calling memweight() on half a gigabyte of memory?

>  	if (longs) {
> -		BUG_ON(longs >= INT_MAX / BITS_PER_LONG);
> -		ret += bitmap_weight((unsigned long *)bitmap,
> -				longs * BITS_PER_LONG);
> +		const unsigned long *bitmap_long =
> +			(const unsigned long *)bitmap;
> +
>  		bytes -= longs * sizeof(long);
> -		bitmap += longs * sizeof(long);
> +		for (; longs > 0; longs--, bitmap_long++)
> +			ret += hweight_long(*bitmap_long);
> +		bitmap = (const unsigned char *)bitmap_long;
>  	}

If you really must change anything, I'd rather see this turned into a
loop:

	while (longs) {
		unsigned int nbits;

		if (longs >= INT_MAX / BITS_PER_LONG)
			nbits = INT_MAX + 1;
		else
			nbits = longs * BITS_PER_LONG;

		ret += bitmap_weight((unsigned long *)bitmap, sz);
		bytes -= nbits / 8;
		bitmap += nbits / 8;
		longs -= nbits / BITS_PER_LONG;
	}

then we only have to use Dan Luu's optimisation in bitmap_weight()
and not in memweight() as well.

Also, why does the trailer do this:

        for (; bytes > 0; bytes--, bitmap++)
                ret += hweight8(*bitmap);

instead of calling hweight_long on *bitmap & mask?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

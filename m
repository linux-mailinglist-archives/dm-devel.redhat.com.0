Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D59B3678
	for <lists+dm-devel@lfdr.de>; Mon, 16 Sep 2019 10:38:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C901307D970;
	Mon, 16 Sep 2019 08:38:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C903A5C258;
	Mon, 16 Sep 2019 08:38:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24C60180085A;
	Mon, 16 Sep 2019 08:38:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8DBmNJP021856 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 07:48:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 272EB600D1; Fri, 13 Sep 2019 11:48:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22C65600CE
	for <dm-devel@redhat.com>; Fri, 13 Sep 2019 11:48:20 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.45])
	by mx1.redhat.com (Postfix) with ESMTP id 499A482BA
	for <dm-devel@redhat.com>; Fri, 13 Sep 2019 11:48:18 +0000 (UTC)
Received: from [192.168.43.132] (unknown [176.59.5.179])
	by mail.ispras.ru (Postfix) with ESMTPSA id 39039540089;
	Fri, 13 Sep 2019 14:48:16 +0300 (MSK)
To: Matthew Wilcox <willy@infradead.org>
References: <20190821074200.2203-1-efremov@ispras.ru>
	<20190824100102.1167-1-efremov@ispras.ru>
	<20190825061158.GC28002@bombadil.infradead.org>
	<ba051566-0343-ea75-0484-8852f65a15da@ispras.ru>
	<20190826183956.GF15933@bombadil.infradead.org>
From: Denis Efremov <efremov@ispras.ru>
Message-ID: <85d9e45a-9631-a139-2d65-86a6753a35e6@ispras.ru>
Date: Fri, 13 Sep 2019 14:48:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190826183956.GF15933@bombadil.infradead.org>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Fri, 13 Sep 2019 11:48:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Fri, 13 Sep 2019 11:48:19 +0000 (UTC) for IP:'83.149.199.45'
	DOMAIN:'mail.ispras.ru' HELO:'mail.ispras.ru'
	FROM:'efremov@ispras.ru' RCPT:''
X-RedHat-Spam-Score: 0  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 83.149.199.45 mail.ispras.ru 83.149.199.45
	mail.ispras.ru <efremov@ispras.ru>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 16 Sep 2019 04:38:17 -0400
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 16 Sep 2019 08:38:42 +0000 (UTC)

Hi,

Sorry for reviving this conversation, but it looks to me like
this function could be reduced to a single bitmap_weight call:

static inline size_t memweight(const void *ptr, size_t bytes)
{
        BUG_ON(bytes >= UINT_MAX / BITS_PER_BYTE);
        return bitmap_weight(ptr, bytes * BITS_PER_BYTE);
}

Comparing to the current implementation
https://elixir.bootlin.com/linux/latest/source/lib/memweight.c#L11 
this results in a signification simplification. 

__bitmap_weight already count last bits with hweight_long as we
discussed earlier.

int __bitmap_weight(const unsigned long *bitmap, unsigned int bits)
{
	...
	if (bits % BITS_PER_LONG)
		w += hweight_long(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
	...
}

and __arch_hweight* functions use popcnt instruction.

I've briefly tested the equivalence of 2 implementations on x86_64 with
fuzzing here: https://gist.github.com/evdenis/95a8b9b8041e09368b31c3a9510491a5

What do you think making this function static inline and moving it
to include/linux/string.h? I could prepare a patch for it and add some tests for
memweight and bitmap_weight. Or maybe I miss something again?

Best regards,
Denis

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

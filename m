Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB29910F
	for <lists+dm-devel@lfdr.de>; Thu, 22 Aug 2019 12:39:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B9813002096;
	Thu, 22 Aug 2019 10:39:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EA325C290;
	Thu, 22 Aug 2019 10:39:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03EBF24F34;
	Thu, 22 Aug 2019 10:39:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7M7UDZX010212 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Aug 2019 03:30:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2AB8160126; Thu, 22 Aug 2019 07:30:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26061600CD
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 07:30:10 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.45])
	by mx1.redhat.com (Postfix) with ESMTP id ADC1410576E1
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 07:30:08 +0000 (UTC)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru
	[188.32.48.208])
	by mail.ispras.ru (Postfix) with ESMTPSA id 7FD1C540089;
	Thu, 22 Aug 2019 10:30:07 +0300 (MSK)
To: Andrew Morton <akpm@linux-foundation.org>
References: <20190821074200.2203-1-efremov@ispras.ru>
	<20190821182507.b0dea16f57360cf0ac40deb6@linux-foundation.org>
From: Denis Efremov <efremov@ispras.ru>
Message-ID: <ad15bc93-0283-2518-8185-7683614d9965@ispras.ru>
Date: Thu, 22 Aug 2019 10:30:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821182507.b0dea16f57360cf0ac40deb6@linux-foundation.org>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.64]); Thu, 22 Aug 2019 07:30:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Thu, 22 Aug 2019 07:30:09 +0000 (UTC) for IP:'83.149.199.45'
	DOMAIN:'mail.ispras.ru' HELO:'mail.ispras.ru'
	FROM:'efremov@ispras.ru' RCPT:''
X-RedHat-Spam-Score: 0  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 83.149.199.45 mail.ispras.ru 83.149.199.45
	mail.ispras.ru <efremov@ispras.ru>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 22 Aug 2019 06:38:34 -0400
Cc: Vladimir Shelekhov <vshel@iis.nsk.su>, Jan Kara <jack@suse.cz>,
	Matthew Wilcox <matthew@wil.cx>, linux-kernel@vger.kernel.org,
	Akinobu Mita <akinobu.mita@gmail.com>, dm-devel@redhat.com,
	Erdem Tumurov <erdemus@gmail.com>, linux-fsdevel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [dm-devel] [PATCH] lib/memweight.c: optimize by inlining
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 22 Aug 2019 10:39:05 +0000 (UTC)



On 22.08.2019 04:25, Andrew Morton wrote:
> On Wed, 21 Aug 2019 10:42:00 +0300 Denis Efremov <efremov@ispras.ru> wrote:
> 
>> This patch inlines bitmap_weight() call.
> 
> It is better to say the patch "open codes" the bitmap_weight() call.
> 
>> Thus, removing the BUG_ON,
> 
> Why is that OK to do?

BUG_ON was necessary here to check that bitmap_weight will return a correct value,
i.e. the computed weight will fit the int type: 
static __always_inline int bitmap_weight(const unsigned long *src, unsigned int nbits);

BUG_ON was added in the memweight v2
https://lore.kernel.org/lkml/20120523092113.GG10452@quack.suse.cz/
Jan Kara wrote:
>> +
>> +	for (longs = bytes / sizeof(long); longs > 0; ) {
>> +		size_t bits = min_t(size_t, INT_MAX & ~(BITS_PER_LONG - 1),
> +					longs * BITS_PER_LONG);
>  I find it highly unlikely that someone would have such a large bitmap
> (256 MB or more on 32-bit). Also the condition as you wrote it can just
> overflow so it won't have the desired effect. Just do
>	BUG_ON(longs >= ULONG_MAX / BITS_PER_LONG);
> and remove the loop completely. If someone comes with such a huge bitmap,
> the code can be modified easily (after really closely inspecting whether
> such a huge bitmap is really well justified).
>> +
>> +		w += bitmap_weight(bitmap.ptr, bits);
>> +		bytes -= bits / BITS_PER_BYTE;
>> +		bitmap.address += bits / BITS_PER_BYTE;
>> +		longs -= bits / BITS_PER_LONG;

Akinobu Mita wrote:
> The bits argument of bitmap_weight() is int type. So this should be
>
>        BUG_ON(longs >= INT_MAX / BITS_PER_LONG);

We don't need this check, since we removed the bitmap_weight call and
control the computation directly with size_t everywhere.

We could add BUG_ON(bytes >= SIZE_MAX / BITS_PER_BYTE);
at the very beginning of the function to check that the array is not
very big (>2000PiB), but it seems excessive.

> 
> I expect all the code size improvements are from doing this?

Yes, but I thought it's good to show that the total size is not
increasing because of the manual "inlining".

> 
>> and 'longs to bits -> bits to longs' conversion by directly calling
>> hweight_long().
>>
>> ./scripts/bloat-o-meter lib/memweight.o.old lib/memweight.o.new
>> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-10 (-10)
>> Function                                     old     new   delta
>> memweight                                    162     152     -10
>>
> 

Regards,
Denis

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

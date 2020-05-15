Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA5B1D46E3
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 09:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589526961;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cv8G9tjkqs1r6UJSpn/rxXSZxUBIX7K3Q01c1BtW8OM=;
	b=G8AYve8ZlxmN3yaR83MN0Jw3BDIqA1lYOYmA5sEUR/psnNRdOdnREOtlRhu8jWhEzO4zJL
	EmQuRi4mGTSIRS3Ut9E3C4OmTYDluqEAoeuqWF8Tvy0gTte89F3hOOJ+x+JzJ0roMR4pDy
	WnPwKeKcYPZcEogp5jvDtk2tDsEu3R8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-JlJH1kVtM42WAe8UPPnNBw-1; Fri, 15 May 2020 03:15:58 -0400
X-MC-Unique: JlJH1kVtM42WAe8UPPnNBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA8E964AD8;
	Fri, 15 May 2020 07:15:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94A2E2E16E;
	Fri, 15 May 2020 07:15:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5560A4E9BB;
	Fri, 15 May 2020 07:15:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04F6h2pQ028712 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 02:43:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 493CA2022ADE; Fri, 15 May 2020 06:43:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4322220110C9
	for <dm-devel@redhat.com>; Fri, 15 May 2020 06:42:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A72C80A0C4
	for <dm-devel@redhat.com>; Fri, 15 May 2020 06:42:59 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-456-jwEJnLcfNoKSD0Ccix6c2w-1; Fri, 15 May 2020 02:42:54 -0400
X-MC-Unique: jwEJnLcfNoKSD0Ccix6c2w-1
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 443D0F559CF58DF50670;
	Fri, 15 May 2020 14:42:48 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.55) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
	14:42:46 +0800
To: Matthew Wilcox <willy@infradead.org>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
	<20200507075100.1779-7-thunder.leizhen@huawei.com>
	<20200515041456.GD16070@bombadil.infradead.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <85ea7c5e-9879-8aa4-c0f4-c60f107d63e3@huawei.com>
Date: Fri, 15 May 2020 14:42:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20200515041456.GD16070@bombadil.infradead.org>
Content-Language: en-US
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 15 May 2020 03:15:32 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm <linux-mm@kvack.org>,
	Song Liu <song@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	Coly Li <colyli@suse.de>, linux-block <linux-block@vger.kernel.org>,
	Minchan Kim <minchan@kernel.org>, dm-devel <dm-devel@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, Andrew
	Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Nitin Gupta <ngupta@vflare.org>
Subject: Re: [dm-devel] [PATCH v2 06/10] mm/swap: use npage_to_sectors() and
 PAGE_SECTORS to clean up code
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/5/15 12:14, Matthew Wilcox wrote:
> On Thu, May 07, 2020 at 03:50:56PM +0800, Zhen Lei wrote:
>> +++ b/mm/page_io.c
>> @@ -38,7 +38,7 @@ static struct bio *get_swap_bio(gfp_t gfp_flags,
>>  
>>  		bio->bi_iter.bi_sector = map_swap_page(page, &bdev);
>>  		bio_set_dev(bio, bdev);
>> -		bio->bi_iter.bi_sector <<= PAGE_SHIFT - 9;
>> +		bio->bi_iter.bi_sector *= PAGE_SECTORS;
>>  		bio->bi_end_io = end_io;
> 
> This just doesn't look right.  Why is map_swap_page() returning a sector_t
> which isn't actually a sector_t?

I try to understand map_swap_page(). Here maybe a bug. Otherwise, it would be
better to add a temporary variable to cache the return value of map_swap_page(page, &bdev).

> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


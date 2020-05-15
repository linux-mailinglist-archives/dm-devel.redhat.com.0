Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BFB1E1D46E4
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 09:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589526961;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Dec0hSk775VXbkzAF3gFk8fqpIAoYjx5CyC97ld7S1M=;
	b=YSiA8fmgXy0Ykcn15W4SMfyGlSas85DYbP96MAikteag7WUkldFL2jxAts0Dchd10bI+5V
	uOviJwIRCiggK1Fe5gynfbiO+Rre6hbtI9eJLzC+ZqlJ8ZNDgfIehTvLJ9UK/CR13Jqnfm
	5TKN8q2vIDq4Q/yc9uJE2rQaXLKISRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-r6rqldiOM1uCaQ7G8Dj-fA-1; Fri, 15 May 2020 03:15:59 -0400
X-MC-Unique: r6rqldiOM1uCaQ7G8Dj-fA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A720805721;
	Fri, 15 May 2020 07:15:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6092110027AC;
	Fri, 15 May 2020 07:15:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D0321809557;
	Fri, 15 May 2020 07:15:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04F6ql3T029072 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 02:52:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E171913E76D; Fri, 15 May 2020 06:52:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1496E12F99A
	for <dm-devel@redhat.com>; Fri, 15 May 2020 06:52:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC7AD8007C8
	for <dm-devel@redhat.com>; Fri, 15 May 2020 06:52:42 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-291-jWYNP9UtNSWcYGm51nk3Ag-1; Fri, 15 May 2020 02:52:39 -0400
X-MC-Unique: jWYNP9UtNSWcYGm51nk3Ag-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 3E1FC151D066A462048B;
	Fri, 15 May 2020 14:52:30 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.55) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
	14:52:28 +0800
To: Matthew Wilcox <willy@infradead.org>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
	<20200507075100.1779-8-thunder.leizhen@huawei.com>
	<20200515041916.GE16070@bombadil.infradead.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <d3e9bebf-1fea-1497-6dd2-9354f9ca0d4b@huawei.com>
Date: Fri, 15 May 2020 14:52:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20200515041916.GE16070@bombadil.infradead.org>
Content-Language: en-US
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Subject: Re: [dm-devel] [PATCH v2 07/10] block: use sectors_to_npage() and
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/5/15 12:19, Matthew Wilcox wrote:
> On Thu, May 07, 2020 at 03:50:57PM +0800, Zhen Lei wrote:
>> +++ b/block/blk-settings.c
>> @@ -150,7 +150,7 @@ void blk_queue_max_hw_sectors(struct request_queue *q, unsigned int max_hw_secto
>>  	unsigned int max_sectors;
>>  
>>  	if ((max_hw_sectors << 9) < PAGE_SIZE) {
>> -		max_hw_sectors = 1 << (PAGE_SHIFT - 9);
>> +		max_hw_sectors = PAGE_SECTORS;
> 
> Surely this should be:
> 
> 	if (max_hw_sectors < PAGE_SECTORS) {
> 		max_hw_sectors = PAGE_SECTORS;
> 
> ... no?

I've noticed this place before. "(max_hw_sectors << 9) < PAGE_SIZE" can also make sure
that max_hw_sectors is not too large, that means (max_hw_sectors << 9) may overflow.

> 
>> -	page = read_mapping_page(mapping,
>> -			(pgoff_t)(n >> (PAGE_SHIFT - 9)), NULL);
>> +	page = read_mapping_page(mapping, (pgoff_t)sectors_to_npage(n), NULL);
> 
> ... again, get the type right, and you won't need the cast.
OK, I'll consider it.

> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


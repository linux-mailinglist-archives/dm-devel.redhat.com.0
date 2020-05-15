Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 14D731D46E0
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 09:15:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589526957;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DDedvGtjF3KSudMEtHQT4Nk22Zaoy3IkmJAQFQ2d7FY=;
	b=Il9PFO6d1bHQvZJbyA/UOlawddrcLaG9Ue3s1Jubf+hDtKC/ghk52wsEBjsh+qcKOKAr6M
	yhwvwiYu9goBsnXFY5bAjNRo2EMe1up0iMyUFg05ykPeXxaXQvEhDLc88XWPdD2LoCFSJO
	hXmCNlC8PCLtozfWsrNOVUKZUAW+WSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-rWMm7wQFPPmBQmB96jOmxA-1; Fri, 15 May 2020 03:15:54 -0400
X-MC-Unique: rWMm7wQFPPmBQmB96jOmxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9DCB107ACF8;
	Fri, 15 May 2020 07:15:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F254101D480;
	Fri, 15 May 2020 07:15:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5CFFA4E9B9;
	Fri, 15 May 2020 07:15:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04F6TBep027294 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 02:29:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F9FB2156A4A; Fri, 15 May 2020 06:29:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 127F42157F23
	for <dm-devel@redhat.com>; Fri, 15 May 2020 06:29:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 291318007A4
	for <dm-devel@redhat.com>; Fri, 15 May 2020 06:29:08 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-98-wdJHtCZbMYqo-rqgoJe2sw-1; Fri, 15 May 2020 02:29:03 -0400
X-MC-Unique: wdJHtCZbMYqo-rqgoJe2sw-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id D74529857C06E2477F6F;
	Fri, 15 May 2020 14:28:56 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.55) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
	14:28:54 +0800
To: Matthew Wilcox <willy@infradead.org>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
	<20200507075100.1779-7-thunder.leizhen@huawei.com>
	<20200515040647.GC16070@bombadil.infradead.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <766da107-bc67-ff99-a8c8-87f8f98c7cf6@huawei.com>
Date: Fri, 15 May 2020 14:28:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20200515040647.GC16070@bombadil.infradead.org>
Content-Language: en-US
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/5/15 12:06, Matthew Wilcox wrote:
> On Thu, May 07, 2020 at 03:50:56PM +0800, Zhen Lei wrote:
>> @@ -266,7 +266,7 @@ int swap_writepage(struct page *page, struct writeback_control *wbc)
>>  
>>  static sector_t swap_page_sector(struct page *page)
>>  {
>> -	return (sector_t)__page_file_index(page) << (PAGE_SHIFT - 9);
>> +	return npage_to_sectors((sector_t)__page_file_index(page));
> 
> If you make npage_to_sectors() a proper function instead of a macro,
> you can do the casting inside the function instead of in the callers
> (which is prone to bugs).

Oh, yes. __page_file_index(page) maybe called many times in marco, althouth currently
it is not. So that, not all are suitable for page_to_sector(). And for this example,
still need to use "<< PAGE_SECTORS_SHIFT".

> 
> Also, this is a great example of why page_to_sector() was a better name
> than npage_to_sectors().  This function doesn't return a count of sectors,
> it returns a sector number within the swap device.
OK, so I will change to page_to_sector()/sector_to_page().

> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


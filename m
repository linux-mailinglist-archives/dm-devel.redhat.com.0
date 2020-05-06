Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A64001C818B
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 07:34:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588829659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PT8mfekAFm0Q4TKCoZ4vh8GKFwai2EKVWm4nfI+97W0=;
	b=Hk5yIeLWJpn4JZ1TcFsDFPPHs+83bmZFFySgtAHBlTp91p78XCALElhtUZjBn1Ku6cWQZS
	fIDqWKvn87JhCW7H5NYKKoaQ71vakEIlFgGM9AN3WYTqgWp/tTb9aMYkn4mdxx2u2nz6EO
	ojR5Td99LFkdzpNzaXgPR4Xm+aB9ZT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-IHFoT2JyNyCHK32pOlY0Mg-1; Thu, 07 May 2020 01:34:17 -0400
X-MC-Unique: IHFoT2JyNyCHK32pOlY0Mg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E805918FE868;
	Thu,  7 May 2020 05:34:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC2002E056;
	Thu,  7 May 2020 05:34:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C3A84CAA8;
	Thu,  7 May 2020 05:34:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04646PRu025394 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 May 2020 00:06:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF7652156A3A; Wed,  6 May 2020 04:06:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB8ED2156A23
	for <dm-devel@redhat.com>; Wed,  6 May 2020 04:06:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C42A580028B
	for <dm-devel@redhat.com>; Wed,  6 May 2020 04:06:23 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-217-6lUCuFYQMM6JcWGRxr024A-1; Wed, 06 May 2020 00:06:21 -0400
X-MC-Unique: 6lUCuFYQMM6JcWGRxr024A-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id CE477F5CF4B481EBEA35;
	Wed,  6 May 2020 12:06:16 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.55) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
	12:06:13 +0800
To: Matthew Wilcox <willy@infradead.org>
References: <20200505115543.1660-1-thunder.leizhen@huawei.com>
	<20200505115543.1660-2-thunder.leizhen@huawei.com>
	<20200505121043.GG16070@bombadil.infradead.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <8ec2a734-d23a-83ef-fe06-6b2895a2d392@huawei.com>
Date: Wed, 6 May 2020 12:06:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20200505121043.GG16070@bombadil.infradead.org>
Content-Language: en-US
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04646PRu025394
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 07 May 2020 01:33:44 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm <linux-mm@kvack.org>,
	Song Liu <song@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	Minchan Kim <minchan@kernel.org>, dm-devel <dm-devel@redhat.com>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, Nitin Gupta <ngupta@vflare.org>
Subject: Re: [dm-devel] [PATCH 1/4] block: Move SECTORS_PER_PAGE and
 SECTORS_PER_PAGE_SHIFT definitions into <linux/blkdev.h>
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



On 2020/5/5 20:10, Matthew Wilcox wrote:
> On Tue, May 05, 2020 at 07:55:40PM +0800, Zhen Lei wrote:
>> +#ifndef SECTORS_PER_PAGE_SHIFT
>> +#define SECTORS_PER_PAGE_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
>> +#endif
>> +#ifndef SECTORS_PER_PAGE
>> +#define SECTORS_PER_PAGE	(1 << SECTORS_PER_PAGE_SHIFT)
>>  #endif
> 
> I find SECTORS_PER_PAGE_SHIFT quite hard to read.  I had a quick skim
> of your other patches, and it seems to me that we could replace
> '<< SECTORS_PER_PAGE_SHIFT' with '* SECTORS_PER_PAGE' and it would be
> more readable in every case.

OK, I will delete SECTORS_PER_PAGE_SHIFT, and replace the shift with {*|/} SECTORS_PER_PAGE if it's
not suitable to be replaced by sectors_to_page()/page_to_sectors().

> 
> .
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


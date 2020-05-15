Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6751D46E1
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 09:15:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589526957;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FN3fzhV/vf/sJY/J8sPoE+5sfuXAF+A9HEh+UWYYZOw=;
	b=Bd54/CWDesOdbhZNL3Im0mvY9i+XPk9X1aP3cVbEoRkT1Vcbx6Ms1f2mryuGbQhJdjh0tF
	NY4g7Uzv4LBNCV+xLAEC3qTHaAtzeogDpr6KArn9ZmBSHjuyw2/GBEYM+5OEk+DaAOKs6W
	61X7faaP0yL9mdSBi8ZZP/3rY4nAniA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-pZeoyoaIOtGTcgP1YgPLsg-1; Fri, 15 May 2020 03:15:52 -0400
X-MC-Unique: pZeoyoaIOtGTcgP1YgPLsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12E18460;
	Fri, 15 May 2020 07:15:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC75D60C05;
	Fri, 15 May 2020 07:15:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D16114E9B6;
	Fri, 15 May 2020 07:15:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04F479K0015156 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 00:07:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1443200BCF6; Fri, 15 May 2020 04:07:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDB5A202B16D
	for <dm-devel@redhat.com>; Fri, 15 May 2020 04:07:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0889B8A19AD
	for <dm-devel@redhat.com>; Fri, 15 May 2020 04:07:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-7--4ZeuwU0OcWKsgy1b4S93g-1; Fri, 15 May 2020 00:07:00 -0400
X-MC-Unique: -4ZeuwU0OcWKsgy1b4S93g-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jZRcV-0008AQ-A6; Fri, 15 May 2020 04:06:47 +0000
Date: Thu, 14 May 2020 21:06:47 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Message-ID: <20200515040647.GC16070@bombadil.infradead.org>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
	<20200507075100.1779-7-thunder.leizhen@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200507075100.1779-7-thunder.leizhen@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 15 May 2020 03:15:32 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm <linux-mm@kvack.org>,
	Song Liu <song@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	Coly Li <colyli@suse.de>, linux-block <linux-block@vger.kernel.org>,
	Minchan Kim <minchan@kernel.org>, dm-devel <dm-devel@redhat.com>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, May 07, 2020 at 03:50:56PM +0800, Zhen Lei wrote:
> @@ -266,7 +266,7 @@ int swap_writepage(struct page *page, struct writeback_control *wbc)
>  
>  static sector_t swap_page_sector(struct page *page)
>  {
> -	return (sector_t)__page_file_index(page) << (PAGE_SHIFT - 9);
> +	return npage_to_sectors((sector_t)__page_file_index(page));

If you make npage_to_sectors() a proper function instead of a macro,
you can do the casting inside the function instead of in the callers
(which is prone to bugs).

Also, this is a great example of why page_to_sector() was a better name
than npage_to_sectors().  This function doesn't return a count of sectors,
it returns a sector number within the swap device.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


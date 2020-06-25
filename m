Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 00990209E99
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 14:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593088851;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IqjDMn/ClrEnjvNOw7HgtMp/Y4YDLxm/pju0jNJCLJg=;
	b=B8YglGLgnFIBVoaYxQD3BHNX1I50xx7RwI3gGc6aKWj1Ss0WgW18VElvmTh2ljpfOlf1bs
	BvIsSD2RDwDd4NNo6uuXzRbUpECKVOn1IXnvH5zPlegXygjKdIzRxa761W4mt60jjgyLBA
	XM+7iu7sA7Z78eeMFuJByUCDQaSmZQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-kfEszr1IPiaNbIXdnGOPAw-1; Thu, 25 Jun 2020 08:40:48 -0400
X-MC-Unique: kfEszr1IPiaNbIXdnGOPAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BBCC8064AD;
	Thu, 25 Jun 2020 12:40:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86D231C8;
	Thu, 25 Jun 2020 12:40:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5DEB87590;
	Thu, 25 Jun 2020 12:40:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PCeTLw028801 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 08:40:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F320111921AE; Thu, 25 Jun 2020 12:40:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE16E11921AB
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 12:40:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2781B101A525
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 12:40:26 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-427-7TBQOgGfMdyAHkicXKCrXw-1; Thu, 25 Jun 2020 08:40:21 -0400
X-MC-Unique: 7TBQOgGfMdyAHkicXKCrXw-1
Received: by mail-wr1-f67.google.com with SMTP id s10so5651822wrw.12;
	Thu, 25 Jun 2020 05:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=5nATsF4VCIDnrx784KWSs9fceGtDRoONcd5UkfYMdVE=;
	b=Nc6oaObGOfM5pyYGKAC+c5Z/7dMMJapfJFRpqWxRsLXgd1yrVJNe5+RXs/SGA5nyom
	xpA2PGH4c9t3HQ1rkJp+Mg0LDF4LlIn0gTv6mvkwDYZOGuoy9VqNp+VObgqXfltmQY8e
	Jxskh4Pr69sEnqyC7Kkqc23uuPfQh/VG6brrPJO6xHg9aqSD0I467uwz+bVaES6je7JK
	vRkXEYivpfPI06GEZZh1Ubs0g6sdjMuxuankAZIb0aVSf0qErCibbU9OZ7d7E+bJdESc
	UfIiWC+4KumoN+kkNQmDvIFoAFpQzsasyeFTKOPjfwDFitsbrz95ccGmYuKPJKlamKK2
	IsZw==
X-Gm-Message-State: AOAM531C9ttSjZSOl9EkIFd3lyjlCmvSmcTZUJTKCmI9aQBdtSI+GCaF
	VVF7Y6XEz8EkJx6AJFkk+Qk=
X-Google-Smtp-Source: ABdhPJyv6+l15JpdrNqRIveKQ35DT9zRPh5saDxNlspP+hFweuHnhDzszpv8f1lx6qlSwC1j5o5A+w==
X-Received: by 2002:adf:e701:: with SMTP id c1mr33635637wrm.350.1593088820376; 
	Thu, 25 Jun 2020 05:40:20 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
	by smtp.gmail.com with ESMTPSA id
	o29sm23839337wra.5.2020.06.25.05.40.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 25 Jun 2020 05:40:19 -0700 (PDT)
Date: Thu, 25 Jun 2020 14:40:17 +0200
From: Michal Hocko <mhocko@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20200625124017.GL1320@dhcp22.suse.cz>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-7-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200625113122.7540-7-willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [dm-devel] [PATCH 6/6] mm: Add memalloc_nowait
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu 25-06-20 12:31:22, Matthew Wilcox wrote:
> Similar to memalloc_noio() and memalloc_nofs(), memalloc_nowait()
> guarantees we will not sleep to reclaim memory.  Use it to simplify
> dm-bufio's allocations.

memalloc_nowait is a good idea! I suspect the primary usecase would be
vmalloc.

> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

[...]
> @@ -877,7 +857,9 @@ static struct dm_buffer *__alloc_buffer_wait_no_callback(struct dm_bufio_client
>  	 */
>  	while (1) {
>  		if (dm_bufio_cache_size_latch != 1) {
> -			b = alloc_buffer(c, GFP_NOWAIT | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN);
> +			unsigned nowait_flag = memalloc_nowait_save();
> +			b = alloc_buffer(c, GFP_KERNEL | __GFP_NOMEMALLOC | __GFP_NOWARN);
> +			memalloc_nowait_restore(nowait_flag);

This looks confusing though. I am not familiar with alloc_buffer and
there is quite some tweaking around __GFP_NORETRY in alloc_buffer_data
which I do not follow but GFP_KERNEL just struck my eyes. So why cannot
we have 
		alloc_buffer(GFP_NOWAIT | __GFP_NOMEMALLOC | __GFP_NOWARN);
-- 
Michal Hocko
SUSE Labs

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


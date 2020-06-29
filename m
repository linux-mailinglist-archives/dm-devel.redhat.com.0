Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 16C9920CE91
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 14:53:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593435201;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SifIMuXbzHcnbTc9+LT8v3o6/mMMwmnlEbFdeclevNE=;
	b=TLs1LqCMeXYj4SqSqZCvzF7z0IIPFZOuNHCWbqgzl0O/TAPdoObsU961/D8VFvgAaMnL2B
	I2d8uOskK+58AHvVD//672NAUhyAlo02Y0/Ft+/u+3U/IZtc6E5uji+PegIW4gAqVPV18w
	HD0WMYkvXGwRNvHfhQhbnTeL5iY35Uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-A31FhRSINZOtwhQcc4lEXQ-1; Mon, 29 Jun 2020 08:53:17 -0400
X-MC-Unique: A31FhRSINZOtwhQcc4lEXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE8F219200C3;
	Mon, 29 Jun 2020 12:53:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CECFE5D9DA;
	Mon, 29 Jun 2020 12:53:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D3AB180954D;
	Mon, 29 Jun 2020 12:52:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TCqfrQ005924 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 08:52:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E43FAB3E1; Mon, 29 Jun 2020 12:52:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A158A4868
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 12:52:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57CD9857CF5
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 12:52:39 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-150-PO9CWT51NwGXwDTOhp_m1Q-1; Mon, 29 Jun 2020 08:52:34 -0400
X-MC-Unique: PO9CWT51NwGXwDTOhp_m1Q-1
Received: by mail-ed1-f67.google.com with SMTP id e22so12719025edq.8;
	Mon, 29 Jun 2020 05:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=mISjJ6W1t59EyOgM95PXut3o9oWxsupqoczgWBu6EVM=;
	b=ou1rZvb+UukwyBjrmDQrrnebuZp12xSal0BVBFmQzQVPzF7o4XsbK1XDjQw5VwVdwD
	86EElKM3fgpW0/pCkBVQTlN+5Tx6uC9Ca1QNhPN8EeAWlHiYe/duSkEZAo53yYXvcaeQ
	kAWPkxN97xS3VRtzXUaBK63EAPIDZvhwG8ramqdmCAVFL6CJkVE5UqK7G534jsHJYYv5
	lf0y3LbLwS3qVzRMhH5qlW09lOaqIZfLmyv07ezfp/sRQzeABMUqCu8QA9N8OwUyoC3c
	0lRhLU0ikKU1A7EI6w9lG5itXbjY/Mc49vTe27/LCDZLoZ/DyPfSIDv+x9uJRWsNbWfE
	0L/Q==
X-Gm-Message-State: AOAM531dff1qk/+464P3LWMBvtEFOwvQXKMBYXZ34zhmgjAfA+rJHj71
	HAvrg4svI+MnHVmT8J1eUi2h+XU/
X-Google-Smtp-Source: ABdhPJwKuDYNd8lQ0rDIYcM14Sny/O73oVLrmaxeBF52BJhJLTspOZ/6aPol9DAWu4TfLKyk6WFptw==
X-Received: by 2002:a05:6402:1c96:: with SMTP id
	cy22mr17042750edb.79.1593435153360; 
	Mon, 29 Jun 2020 05:52:33 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
	by smtp.gmail.com with ESMTPSA id
	r17sm4808969edw.68.2020.06.29.05.52.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 29 Jun 2020 05:52:32 -0700 (PDT)
Date: Mon, 29 Jun 2020 14:52:31 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200629125231.GJ32461@dhcp22.suse.cz>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-7-willy@infradead.org>
	<20200629050851.GC1492837@kernel.org>
	<20200629121816.GC25523@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200629121816.GC25523@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Mike Rapoport <rppt@kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon 29-06-20 13:18:16, Matthew Wilcox wrote:
> On Mon, Jun 29, 2020 at 08:08:51AM +0300, Mike Rapoport wrote:
> > > @@ -886,8 +868,12 @@ static struct dm_buffer *__alloc_buffer_wait_no_callback(struct dm_bufio_client
> > >  			return NULL;
> > >  
> > >  		if (dm_bufio_cache_size_latch != 1 && !tried_noio_alloc) {
> > > +			unsigned noio_flag;
> > > +
> > >  			dm_bufio_unlock(c);
> > > -			b = alloc_buffer(c, GFP_NOIO | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN);
> > > +			noio_flag = memalloc_noio_save();
> > 
> > I've read the series twice and I'm still missing the definition of
> > memalloc_noio_save().
> > 
> > And also it would be nice to have a paragraph about it in
> > Documentation/core-api/memory-allocation.rst
> 
> Documentation/core-api/gfp_mask-from-fs-io.rst:``memalloc_nofs_save``, ``memalloc_nofs_restore`` respectively ``memalloc_noio_save``,
> Documentation/core-api/gfp_mask-from-fs-io.rst:   :functions: memalloc_noio_save memalloc_noio_restore
> Documentation/core-api/gfp_mask-from-fs-io.rst:allows nesting so it is safe to call ``memalloc_noio_save`` or
 
The patch is adding memalloc_nowait* and I suspect Mike had that in
mind, which would be a fair request. Btw. we are missing memalloc_nocma*
documentation either - I was just reminded of its existence today...

-- 
Michal Hocko
SUSE Labs

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


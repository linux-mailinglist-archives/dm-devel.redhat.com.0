Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1BA20A00F
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 15:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593092108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Wpv8mG6pg8/k4gpJuOsJe/CiHlQoSoTtn7rtvhBX3gE=;
	b=TfJ+ptbVU71iOdZ8Q0L3cqLtEx13zw03Pu2Mrn53AmWR0Wgw+sKU6o0YFBNiOcu14uNDel
	kGhEo0zsE1SuPi3S1k4Ge96h9U2UBHJTBhwT7IvoE5KWc7ix3Um7x4hfqAmDfWzWnjqt9b
	xUfs1EdIGHJ0q6jZZ2nUscO7BQkahhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-fgDYScx6O_a-u2QQBjm0QQ-1; Thu, 25 Jun 2020 09:35:06 -0400
X-MC-Unique: fgDYScx6O_a-u2QQBjm0QQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51632835B49;
	Thu, 25 Jun 2020 13:34:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E186A5C1BB;
	Thu, 25 Jun 2020 13:34:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 953261809547;
	Thu, 25 Jun 2020 13:34:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PDYXOO001476 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 09:34:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 798DDF6CD0; Thu, 25 Jun 2020 13:34:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 061D9F7FB6
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 13:34:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 224D2805C20
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 13:34:29 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-514-muHGkjo-P-iLHpiiNpjEYQ-1; Thu, 25 Jun 2020 09:34:26 -0400
X-MC-Unique: muHGkjo-P-iLHpiiNpjEYQ-1
Received: by mail-wr1-f68.google.com with SMTP id h5so5865092wrc.7;
	Thu, 25 Jun 2020 06:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=gso1n2O6qGt4XCAgbt0r3fAr2sgINjgku+sh5gi1NWY=;
	b=MyCutwAAzsUURuAAcvatByH6bjCBgI3hVCmy8sTJlb5+YKbqvG1mq79653dl1KBEzd
	GwoWgw6JEEmyZqsmu/nzEAJasDigtytYgHcmyhKvLn5S0tW2ecb5RTEAaHsNuFznb58s
	D8zP5rBFPDTmLVxQtYSDfepcBi/TD9QzRvzwsvM1rdpdq7j4D30Oc0InrvYa+0knVxyN
	mwlPA9qesFCilsHNN6yqnrGuEs5i/U+iqbCHIcEKP0PbQibaI49ILFRy+SNrVzZIclVV
	LcMSH9qPVMfoMp0nEEd8tV5a3O1isoTTTNGnjLkbRuDU58z+dciUhmBg4vUznYGDR1bi
	rqQw==
X-Gm-Message-State: AOAM532zInAbQ1G2NatmNlVVQqAFGx9zbc7c9SuRqkIhxXbVe9GzA7uB
	U3Fsu8aDU9pZz+RitTMKKVA=
X-Google-Smtp-Source: ABdhPJzpVrNaN5j5rVGXAiejljpXNjMiCVf/+8PXhmVJ4820v+TwTrdbGmEOyJwMQNORqxQ5JfER4g==
X-Received: by 2002:adf:9c8c:: with SMTP id d12mr6351189wre.369.1593092063507; 
	Thu, 25 Jun 2020 06:34:23 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
	by smtp.gmail.com with ESMTPSA id
	v66sm12924082wme.13.2020.06.25.06.34.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 25 Jun 2020 06:34:22 -0700 (PDT)
Date: Thu, 25 Jun 2020 15:34:20 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200625133420.GN1320@dhcp22.suse.cz>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-7-willy@infradead.org>
	<20200625124017.GL1320@dhcp22.suse.cz>
	<20200625131055.GC7703@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200625131055.GC7703@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu 25-06-20 14:10:55, Matthew Wilcox wrote:
> On Thu, Jun 25, 2020 at 02:40:17PM +0200, Michal Hocko wrote:
> > On Thu 25-06-20 12:31:22, Matthew Wilcox wrote:
> > > Similar to memalloc_noio() and memalloc_nofs(), memalloc_nowait()
> > > guarantees we will not sleep to reclaim memory.  Use it to simplify
> > > dm-bufio's allocations.
> > 
> > memalloc_nowait is a good idea! I suspect the primary usecase would be
> > vmalloc.
> 
> That's funny.  My use case is allocating page tables in an RCU protected
> page fault handler.  Jens' use case is allocating page cache.  This one
> is a vmalloc consumer (which is also indirectly page table allocation).
> 
> > > @@ -877,7 +857,9 @@ static struct dm_buffer *__alloc_buffer_wait_no_callback(struct dm_bufio_client
> > >  	 */
> > >  	while (1) {
> > >  		if (dm_bufio_cache_size_latch != 1) {
> > > -			b = alloc_buffer(c, GFP_NOWAIT | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN);
> > > +			unsigned nowait_flag = memalloc_nowait_save();
> > > +			b = alloc_buffer(c, GFP_KERNEL | __GFP_NOMEMALLOC | __GFP_NOWARN);
> > > +			memalloc_nowait_restore(nowait_flag);
> > 
> > This looks confusing though. I am not familiar with alloc_buffer and
> > there is quite some tweaking around __GFP_NORETRY in alloc_buffer_data
> > which I do not follow but GFP_KERNEL just struck my eyes. So why cannot
> > we have 
> > 		alloc_buffer(GFP_NOWAIT | __GFP_NOMEMALLOC | __GFP_NOWARN);
> 
> Actually, I wanted to ask about the proliferation of __GFP_NOMEMALLOC
> in the block layer.  Am I right in thinking it really has no effect
> unless GFP_ATOMIC is set?

It does have an effect as an __GFP_MEMALLOC resp PF_MEMALLOC inhibitor.

> It seems like a magic flag that some driver
> developers are sprinkling around randomly, so we probably need to clarify
> the documentation on it.

Would the following make more sense?
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 67a0774e080b..014aa7a6d36a 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -116,8 +116,9 @@ struct vm_area_struct;
  * Usage of a pre-allocated pool (e.g. mempool) should be always considered
  * before using this flag.
  *
- * %__GFP_NOMEMALLOC is used to explicitly forbid access to emergency reserves.
- * This takes precedence over the %__GFP_MEMALLOC flag if both are set.
+ * %__GFP_NOMEMALLOC is used to inhibit __GFP_MEMALLOC resp. process scope
+ * variant of it PF_MEMALLOC. So use this flag if the caller of the allocation
+ * context might contain one or the other.
  */
 #define __GFP_ATOMIC	((__force gfp_t)___GFP_ATOMIC)
 #define __GFP_HIGH	((__force gfp_t)___GFP_HIGH)

> What I was trying to do was just use the memalloc_nofoo API to control
> what was going on and then the driver can just use GFP_KERNEL.  I should
> probably have completed that thought before sending the patches out.

Yes the effect will be the same but it just really hit my eyes as this
was in the same diff. IMHO GFP_NOWAIT would be easier to grasp but
nothing I would dare to insist on.
-- 
Michal Hocko
SUSE Labs

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


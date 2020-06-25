Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6B06820A6D0
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 22:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593117411;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1m66QCJLdbN+V4hPPmJK98JUxYzD90hUjwikxKd6ziA=;
	b=LoNAc28l9LKdqmCAzEVOcFkDK0xrBK1G0nsYBOyhOIuzFnqUiti9LFnJ5GW006F9dZfvcs
	k5/5IKw17Y7UOyOfmKl/v/3SWFupNhyodN0gF1inks8KCQtDskpbS0ce3ktW4I6NrV2qdm
	merFnw7S9dqQ+ao/I/yu0pl4CBiCJvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-Ro_aPERvNeWvJKZ8Xd3CHA-1; Thu, 25 Jun 2020 16:36:48 -0400
X-MC-Unique: Ro_aPERvNeWvJKZ8Xd3CHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DBA6EC1A0;
	Thu, 25 Jun 2020 20:36:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 681CE1A835;
	Thu, 25 Jun 2020 20:36:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 711F0875A3;
	Thu, 25 Jun 2020 20:36:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PKaOR6013105 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 16:36:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D602FC720; Thu, 25 Jun 2020 20:36:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59506F9ACA
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 20:36:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57338858F02
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 20:36:22 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-243-DS4wT07INYODVYUzS6ZnHw-1; Thu, 25 Jun 2020 16:36:15 -0400
X-MC-Unique: DS4wT07INYODVYUzS6ZnHw-1
Received: by mail-ej1-f68.google.com with SMTP id y10so7286548eje.1;
	Thu, 25 Jun 2020 13:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=rO9wobKDdJfB6GpyJylYAIJ+kYKUiyATVCtaBeDI+fw=;
	b=k2p2KlqvOUwACxCVOgpUd9dVnA4bdyyMxosc5xm2YUM68wgBil3fxTUqVjm5A1xEau
	okbGAxPrn0T8mXWt3caFsE8uJH4fZzNoWwjeoKlmbu+bXedbOCyZtpqzuTOOw1tAqaSI
	imCy4160XtkNe5WkXPNGcll6X7pftkxTbUvmQsJysT0kPc2BqfFOexhhzVJ+bM5v6Mqd
	ehhsSknwV+23wJ9TxNoEertsOaz0SQaO6WdqcK7PSwm2CUXwKc7SwJdaqXNOZgmPA1Aa
	Ip+BNB3/MfLL5Mj7hzDIQNmPcmmzIhF6MO3HgKZ5UW/HJ7QMR4TcRKKOU1ElVcEja+j1
	YKPg==
X-Gm-Message-State: AOAM530ZN5pb1+JZIIKYEotmZ1daSSIvyRpXV0cil+cwW096qdSNv9KE
	OkCcrmL1DiPjZ3E2a9+p4Bw=
X-Google-Smtp-Source: ABdhPJzfhS7g3k5+vRs6JczdAsbHFNdSSLshuu/AhvsQ7cPrZgwO71TfhCq9ltNkBnPaHiW49BYdog==
X-Received: by 2002:a17:906:4f87:: with SMTP id
	o7mr30542289eju.233.1593117374457; 
	Thu, 25 Jun 2020 13:36:14 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
	by smtp.gmail.com with ESMTPSA id
	bs18sm3790352edb.38.2020.06.25.13.36.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 25 Jun 2020 13:36:13 -0700 (PDT)
Date: Thu, 25 Jun 2020 22:36:11 +0200
From: Michal Hocko <mhocko@kernel.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200625203611.GS1320@dhcp22.suse.cz>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625184832.GP7606@magnolia>
MIME-Version: 1.0
In-Reply-To: <20200625184832.GP7606@magnolia>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Yafang Shao <laoar.shao@gmail.com>,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/6] Overhaul memalloc_no*
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu 25-06-20 11:48:32, Darrick J. Wong wrote:
> On Thu, Jun 25, 2020 at 12:31:16PM +0100, Matthew Wilcox (Oracle) wrote:
> > I want a memalloc_nowait like we have memalloc_noio and memalloc_nofs
> > for an upcoming patch series, and Jens also wants it for non-blocking
> > io_uring.  It turns out we already have dm-bufio which could benefit
> > from memalloc_nowait, so it may as well go into the tree now.
> > 
> > The biggest problem is that we're basically out of PF_ flags, so we need
> > to find somewhere else to store the PF_MEMALLOC_NOWAIT flag.  It turns
> > out the PF_ flags are really supposed to be used for flags which are
> > accessed from other tasks, and the MEMALLOC flags are only going to
> > be used by this task.  So shuffling everything around frees up some PF
> > flags and generally makes the world a better place.
> 
> So, uh, how does this intersect with the patch "xfs: reintroduce
> PF_FSTRANS for transaction reservation recursion protection" that
> re-adds PF_TRANS because uh I guess we lost some subtlety or another at
> some point?

This is independent, really. It just relocates the NOFS flag. PF_TRANS
is reintroduced for a different reason. When I have replaced the
original PF_TRANS by PF_MEMALLOC_NOFS I didn't realized that xfs doesn't
need only the NOFS semantic but also the transaction tracking so this
cannot be a single bit only. So it has to be added back. But
PF_MEMALLOC_NOFS needs to stay for the scoped NOFS semantic.

Hope this clarifies it a bit.
-- 
Michal Hocko
SUSE Labs

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


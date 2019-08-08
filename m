Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 04225866C5
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 18:14:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E73030C01A3;
	Thu,  8 Aug 2019 16:14:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51F565D70D;
	Thu,  8 Aug 2019 16:14:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4462318005C7;
	Thu,  8 Aug 2019 16:14:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78GCirn009438 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 12:12:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 253475D9DC; Thu,  8 Aug 2019 16:12:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 202395D9D3
	for <dm-devel@redhat.com>; Thu,  8 Aug 2019 16:12:41 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94A6630A7BA5
	for <dm-devel@redhat.com>; Thu,  8 Aug 2019 16:12:40 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w10so44305055pgj.7
	for <dm-devel@redhat.com>; Thu, 08 Aug 2019 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=GbKZkWdFW3/LathJiTmUB/es7Gx9lbtHm6GJXlHv5+E=;
	b=aHd3BMPydi+5PV5TxAyyoXAB2//OlcpWaOb9Ulv9m4G+dGQDsVHyoJELks6vv29zZs
	+l9YLHqxG6PA7RsVkwpwZLjgZzwTnKooalsTD+ERQtN8bpHaq1JEAX79Q/0Q4JFzQWqX
	Zv7Za4X5k+/VUeEYrNZJJSLO7c+scqObfiMwnA2GipbI5hhnzUw2LCdhtgUFP2BnLpE2
	et7yYRwFoml44eQaKQF8+SGCmFWcKVzwtMQTEXAtjYSre8zV7f3nMDxyKkS/3fiM3pd8
	5g+VisQ2Yg7qdOQWYCT5hJZbqMllgcveePnnq+gYbnNhRPiHgqBwxulg0iqhWdshus0G
	/Fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GbKZkWdFW3/LathJiTmUB/es7Gx9lbtHm6GJXlHv5+E=;
	b=bwomtIJa599DxIUueRPLLNIlKU2AtU3pB3v/CbkWlVo445JLBNbW3WjFaIVYFNhrfu
	jtkgdH/b4+kvjg12/8LprBLtOE3DvqijvrYCXwLg9XUI9P/PLbjajLxgpZvdMLR/LNgd
	jNddm495U801zT9BKt2tIfJpsgHPOoIEMvJLntZb7SnGKof+ctIkt/9en/W+8Ov1UKek
	hb+zCRau67atmQUjR9aM6sVWGKh7EdL/lTOOv4IbMz6830gPbODR7kq1FW0e0dGwkucD
	QTAnFOMn1/h+J7RBUKnFTCMdN6uRv3W4yTsUkvviMJ2HsbPTG2oD102EF0hiYjPpe9is
	rRWA==
X-Gm-Message-State: APjAAAValQQ3RGAZFBlJr+tsbiSZ6uUB40k9ARUnpPak10CYENTsBX2t
	CyFuKrSmOOkK9B5/6X93HlznoBubwAIQAQ==
X-Google-Smtp-Source: APXvYqyiYb+knMp0JBJQrh+fcsfPoG9yFxitkP7TY7Atel9io4mNwiZe7WDGrcZe1yoOZtvrtpSkzA==
X-Received: by 2002:a65:690e:: with SMTP id s14mr13663644pgq.47.1565280759945; 
	Thu, 08 Aug 2019 09:12:39 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:83a1:4042:6c37:d29d:2320?
	([2605:e000:100e:83a1:4042:6c37:d29d:2320])
	by smtp.gmail.com with ESMTPSA id
	196sm103224711pfy.167.2019.08.08.09.12.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Aug 2019 09:12:38 -0700 (PDT)
To: Mikulas Patocka <mpatocka@redhat.com>, Matthew Wilcox <willy@infradead.org>
References: <alpine.LRH.2.02.1908080540240.15519@file01.intranet.prod.int.rdu2.redhat.com>
	<20190808135329.GG5482@bombadil.infradead.org>
	<alpine.LRH.2.02.1908081113540.18950@file01.intranet.prod.int.rdu2.redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <4625547c-f172-a0bf-720e-849fb7ff85a2@kernel.dk>
Date: Thu, 8 Aug 2019 09:12:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1908081113540.18950@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 08 Aug 2019 16:12:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Thu, 08 Aug 2019 16:12:40 +0000 (UTC) for IP:'209.85.215.194'
	DOMAIN:'mail-pg1-f194.google.com'
	HELO:'mail-pg1-f194.google.com' FROM:'axboe@kernel.dk' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.215.194 mail-pg1-f194.google.com 209.85.215.194
	mail-pg1-f194.google.com <axboe@kernel.dk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: honglei.wang@oracle.com, Mike Snitzer <msnitzer@redhat.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org, junxiao.bi@oracle.com,
	linux-xfs@vger.kernel.org, dm-devel@redhat.com,
	linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] loop: set PF_MEMALLOC_NOIO for the worker
	thread
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 08 Aug 2019 16:14:34 +0000 (UTC)

On 8/8/19 8:17 AM, Mikulas Patocka wrote:
> A deadlock with this stacktrace was observed.
> 
> The loop thread does a GFP_KERNEL allocation, it calls into dm-bufio
> shrinker and the shrinker depends on I/O completion in the dm-bufio
> subsystem.
> 
> In order to fix the deadlock (and other similar ones), we set the flag
> PF_MEMALLOC_NOIO at loop thread entry.
> 
> PID: 474    TASK: ffff8813e11f4600  CPU: 10  COMMAND: "kswapd0"
>     #0 [ffff8813dedfb938] __schedule at ffffffff8173f405
>     #1 [ffff8813dedfb990] schedule at ffffffff8173fa27
>     #2 [ffff8813dedfb9b0] schedule_timeout at ffffffff81742fec
>     #3 [ffff8813dedfba60] io_schedule_timeout at ffffffff8173f186
>     #4 [ffff8813dedfbaa0] bit_wait_io at ffffffff8174034f
>     #5 [ffff8813dedfbac0] __wait_on_bit at ffffffff8173fec8
>     #6 [ffff8813dedfbb10] out_of_line_wait_on_bit at ffffffff8173ff81
>     #7 [ffff8813dedfbb90] __make_buffer_clean at ffffffffa038736f [dm_bufio]
>     #8 [ffff8813dedfbbb0] __try_evict_buffer at ffffffffa0387bb8 [dm_bufio]
>     #9 [ffff8813dedfbbd0] dm_bufio_shrink_scan at ffffffffa0387cc3 [dm_bufio]
>    #10 [ffff8813dedfbc40] shrink_slab at ffffffff811a87ce
>    #11 [ffff8813dedfbd30] shrink_zone at ffffffff811ad778
>    #12 [ffff8813dedfbdc0] kswapd at ffffffff811ae92f
>    #13 [ffff8813dedfbec0] kthread at ffffffff810a8428
>    #14 [ffff8813dedfbf50] ret_from_fork at ffffffff81745242
> 
>    PID: 14127  TASK: ffff881455749c00  CPU: 11  COMMAND: "loop1"
>     #0 [ffff88272f5af228] __schedule at ffffffff8173f405
>     #1 [ffff88272f5af280] schedule at ffffffff8173fa27
>     #2 [ffff88272f5af2a0] schedule_preempt_disabled at ffffffff8173fd5e
>     #3 [ffff88272f5af2b0] __mutex_lock_slowpath at ffffffff81741fb5
>     #4 [ffff88272f5af330] mutex_lock at ffffffff81742133
>     #5 [ffff88272f5af350] dm_bufio_shrink_count at ffffffffa03865f9 [dm_bufio]
>     #6 [ffff88272f5af380] shrink_slab at ffffffff811a86bd
>     #7 [ffff88272f5af470] shrink_zone at ffffffff811ad778
>     #8 [ffff88272f5af500] do_try_to_free_pages at ffffffff811adb34
>     #9 [ffff88272f5af590] try_to_free_pages at ffffffff811adef8
>    #10 [ffff88272f5af610] __alloc_pages_nodemask at ffffffff811a09c3
>    #11 [ffff88272f5af710] alloc_pages_current at ffffffff811e8b71
>    #12 [ffff88272f5af760] new_slab at ffffffff811f4523
>    #13 [ffff88272f5af7b0] __slab_alloc at ffffffff8173a1b5
>    #14 [ffff88272f5af880] kmem_cache_alloc at ffffffff811f484b
>    #15 [ffff88272f5af8d0] do_blockdev_direct_IO at ffffffff812535b3
>    #16 [ffff88272f5afb00] __blockdev_direct_IO at ffffffff81255dc3
>    #17 [ffff88272f5afb30] xfs_vm_direct_IO at ffffffffa01fe3fc [xfs]
>    #18 [ffff88272f5afb90] generic_file_read_iter at ffffffff81198994
>    #19 [ffff88272f5afc50] __dta_xfs_file_read_iter_2398 at ffffffffa020c970 [xfs]
>    #20 [ffff88272f5afcc0] lo_rw_aio at ffffffffa0377042 [loop]
>    #21 [ffff88272f5afd70] loop_queue_work at ffffffffa0377c3b [loop]
>    #22 [ffff88272f5afe60] kthread_worker_fn at ffffffff810a8a0c
>    #23 [ffff88272f5afec0] kthread at ffffffff810a8428
>    #24 [ffff88272f5aff50] ret_from_fork at ffffffff81745242

Applied, thanks.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

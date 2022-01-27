Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C8249E895
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jan 2022 18:11:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643303517;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pgIH+eQ1aWtao6gpD79OZzfs3+eFBN8EajStjfTqS4s=;
	b=GOTdDgrUQiN+ZDesBM9dDgNDzXbFlTAGa+8Cy5BX07WHDgL7Q//7MjRcw5VQsZ1C9QGk8c
	0wOg9AklszCJplZYp8//oi0a5KpbBNRg9kLBvBd1dy3w6V2vPLU18Kb1o2yIGiLSlNjmDY
	5ZaPRP7zAIPxoHlXJjEGGuHQ92PiGMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290--mqIAklJM9WeIM9KR5A4LA-1; Thu, 27 Jan 2022 12:11:55 -0500
X-MC-Unique: -mqIAklJM9WeIM9KR5A4LA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3434101872D;
	Thu, 27 Jan 2022 17:11:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDD9C7A3FA;
	Thu, 27 Jan 2022 17:11:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 281514BB7C;
	Thu, 27 Jan 2022 17:11:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20RHBj6G020172 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jan 2022 12:11:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D2AA040CFD7B; Thu, 27 Jan 2022 17:11:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEF6740CFD45
	for <dm-devel@redhat.com>; Thu, 27 Jan 2022 17:11:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4DD9185A7BA
	for <dm-devel@redhat.com>; Thu, 27 Jan 2022 17:11:45 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-557-1soJHvFwPKa8M_qizdSB0A-1; Thu, 27 Jan 2022 12:11:42 -0500
X-MC-Unique: 1soJHvFwPKa8M_qizdSB0A-1
Received: by mail-qt1-f198.google.com with SMTP id
	g18-20020ac84b72000000b002cf274754c5so2685207qts.14
	for <dm-devel@redhat.com>; Thu, 27 Jan 2022 09:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=xtKZnu3m4MJ1lsPgVyhgN06mFCH9uLK+At7c0q3e4j8=;
	b=qug0LyOy2lyAb3Z7IIWCv43JVVxurXj6hbwjs4KCbB+0kRc6bhUoZl3eeSw1b3HvBQ
	oNsaKr78cfZ7g6UsV7E5bkZ5asvOkut2Q+nPJxAjz5A6xtbv5ALnUPJeEyarfd8DDLMp
	eD0uYLo/jxuNQT5t/xpG6jZoQ1Koc4UYAug+XzSk7NhUEgwQDvcWEShJc2mKF8a9T4le
	rgpi762tFpzLFyKD118xO9a6FGsHswRDDYWUw5yM1a/kr/iJzWWRJKORBtJVvjQUB/eZ
	rlcx408HYSN8TY7P0OPH/or/9wU049sJ/Cn+D4vs62rulJU/DKAo+eoHUfWdFBEBclKq
	n85w==
X-Gm-Message-State: AOAM531sUDPaET/vaobL2jGapsohOOQhYHhlZ/ktK06ft+Ad29BHnYEO
	cAjRU7hrdgr9KpfpMMMbn5K2u19/T9IRWzIGw1TdHQvnKqOVn5Ja4SMPsbmk9g9L6dTfK4FO9NF
	xoWZm07loXcItog==
X-Received: by 2002:ad4:5968:: with SMTP id eq8mr3808177qvb.80.1643303501892; 
	Thu, 27 Jan 2022 09:11:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztPCW/ls/HGsD9xe/WMaahh4UjrJsfEVpwqwRI5tHMnXcgyiZLuuvrhgvmY/MRUsNQeYYfvQ==
X-Received: by 2002:ad4:5968:: with SMTP id eq8mr3808154qvb.80.1643303501730; 
	Thu, 27 Jan 2022 09:11:41 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id w8sm119796qti.21.2022.01.27.09.11.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Jan 2022 09:11:41 -0800 (PST)
Date: Thu, 27 Jan 2022 12:11:40 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YfLSTPB7UUZKqQKL@redhat.com>
References: <20220124091107.642561-1-hch@lst.de>
	<20220124091107.642561-9-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220124091107.642561-9-hch@lst.de>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.co>,
	dm-devel@redhat.com, "Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Jack Wang <jinpu.wang@ionos.com>, Pavel Begunkov <asml.silence@gmail.com>,
	drbd-dev@lists.linbit.com
Subject: Re: [dm-devel] [PATCH 08/19] dm-thin: use blkdev_issue_flush
 instead of open coding it
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 24 2022 at  4:10P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Use blkdev_issue_flush, which uses an on-stack bio instead of an
> opencoded version with a bio embedded into struct pool.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


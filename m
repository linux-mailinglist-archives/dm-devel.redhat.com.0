Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EC77C2CCA3F
	for <lists+dm-devel@lfdr.de>; Thu,  3 Dec 2020 00:06:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-bfkZXAHNPhyabzgmwHq6sw-1; Wed, 02 Dec 2020 18:06:13 -0500
X-MC-Unique: bfkZXAHNPhyabzgmwHq6sw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2221185E489;
	Wed,  2 Dec 2020 23:06:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3F105D9D7;
	Wed,  2 Dec 2020 23:06:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FA724BB7B;
	Wed,  2 Dec 2020 23:06:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B2N5uS1018311 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Dec 2020 18:05:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ACF05D7B0B; Wed,  2 Dec 2020 23:05:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A77DED7B0F
	for <dm-devel@redhat.com>; Wed,  2 Dec 2020 23:05:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2346A8007DF
	for <dm-devel@redhat.com>; Wed,  2 Dec 2020 23:05:53 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-203-BdExaq2sOGiTmKi38XGp-g-1; Wed, 02 Dec 2020 18:05:51 -0500
X-MC-Unique: BdExaq2sOGiTmKi38XGp-g-1
Received: by mail-qk1-f195.google.com with SMTP id v143so461506qkb.2
	for <dm-devel@redhat.com>; Wed, 02 Dec 2020 15:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=NHfol06cSqlCCrl5YsPDHdTrQXLbo8wKJWGeGJlSsmE=;
	b=jN6ljHpnKshdkajvdRY6dW2sOlbhvY9srRhped6XKv/Mw90iAYTHNZXrhapZleYprF
	kIqvhdSr+JatJL4ac03J+3okIqpTkPtbTbjHojV/d7f9td0XcCwgMiKZ7yVpjikPZtvx
	qV1AQguV/iDigg3a07dgXuUxhgR2x3ldwUIZ6WOLJP+oUE3g2btL3kJt/g3u9/n/CJ5h
	v37VkZR4DvsoPr4+oYs+L2vhORtYIeoKNI+3dzfH9RCV5OdUtOHcuDV4pLvZEw3/rr2X
	0D73v509XuA2MPmXmaJMuNDobvM3ramDsG4k+HYERae6ytaBvsqooOoGFH/lW2qRY0BC
	bn+A==
X-Gm-Message-State: AOAM532PZUMkczy/Yif21CUxrorWJjhAVvyADHQLMxWcXqgBVw+SFEA0
	Z+jzMLTD5FxcbAA+pZKsJMY=
X-Google-Smtp-Source: ABdhPJylOQn1ChoyZHml9j4uxp+LB+QzMjhGewJQojxlvSyi/AQikfiEJcPaQK9vpNDOdB/iqObIXg==
X-Received: by 2002:a37:64f:: with SMTP id 76mr114596qkg.260.1606950350503;
	Wed, 02 Dec 2020 15:05:50 -0800 (PST)
Received: from localhost ([2620:10d:c091:480::1:ec0f])
	by smtp.gmail.com with ESMTPSA id w31sm433235qth.60.2020.12.02.15.05.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Dec 2020 15:05:49 -0800 (PST)
Date: Wed, 2 Dec 2020 18:05:21 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <X8gdscx01GT9vJyp@mtj.duckdns.org>
References: <20201201165424.2030647-1-hch@lst.de>
	<20201201165424.2030647-6-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201201165424.2030647-6-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
	linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-block@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 5/9] block: use ->bi_bdev for bio based I/O
	accounting
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 01, 2020 at 05:54:20PM +0100, Christoph Hellwig wrote:
> Rework the I/O accounting for bio based drivers to use ->bi_bdev.  This
> means all drivers can now simply use bio_start_io_acct to start
> accounting, and it will take partitions into account automatically.  To
> end I/O account either bio_end_io_acct can be used if the driver never
> remaps I/O to a different device, or bio_end_io_acct_remapped if the
> driver did remap the I/O.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


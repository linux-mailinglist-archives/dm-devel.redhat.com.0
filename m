Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 289C32CCA72
	for <lists+dm-devel@lfdr.de>; Thu,  3 Dec 2020 00:23:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-cWA-nEzINDORdHlmm5zZiw-1; Wed, 02 Dec 2020 18:22:58 -0500
X-MC-Unique: cWA-nEzINDORdHlmm5zZiw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EBCA1842171;
	Wed,  2 Dec 2020 23:22:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B020E19C47;
	Wed,  2 Dec 2020 23:22:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6C4D4BB7B;
	Wed,  2 Dec 2020 23:22:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B2NMiKU020591 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Dec 2020 18:22:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DF58A10F2700; Wed,  2 Dec 2020 23:22:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B46D510F2704
	for <dm-devel@redhat.com>; Wed,  2 Dec 2020 23:22:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15D258007D9
	for <dm-devel@redhat.com>; Wed,  2 Dec 2020 23:22:38 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-361-JJXxWCf8OxuSVczFDxdBlw-1; Wed, 02 Dec 2020 18:22:36 -0500
X-MC-Unique: JJXxWCf8OxuSVczFDxdBlw-1
Received: by mail-qk1-f193.google.com with SMTP id z188so457212qke.9
	for <dm-devel@redhat.com>; Wed, 02 Dec 2020 15:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=b+r2FYviV6fq0hR9F0gW+ANicng0tQNzePfUHujQp90=;
	b=uI0+jH8cvkWavIkpDEUYBZywKo/menE0GV4glXVnfmWOpfuguPm3AWCLndx6JZ/s5J
	hkS0PALlwyBUq6/Cs7UqPkc+qKdK8HBsCBkKxxNcIloLDzfazXAU3jI0hLjwu5M7F4KC
	f2TvLxLqogr0S6rm9/u32eJKAYunU7a4KQ6hMlEZ+oarWpenjYzGF1W2N2gkVEuSOyv8
	Gmcgnkn0XxhqTMfNnw/oE/CftRjHucZrE3n5KQhnFBsTfBuRM/itwzgvbumn7jEb3MNd
	y9prhrUcKOb+um2rARZHwK18SjjFD1HISDp6L0v8EiSEPpAtriUnB9VKYBHt7a2oz2UA
	SSvA==
X-Gm-Message-State: AOAM530yuGA4Ik7jgtE5YRcFZtU3SYnStg6oRLm9rfB7pSCjJa8QB4SS
	xhTTXZZwF5s/JVf5KevZsIc=
X-Google-Smtp-Source: ABdhPJyg0LHfRF85QBVE1aNbA5meOz/wKZPBz7cbhnhS5PHEqBCsQVBc6aBImcA/HPpiZ4RRhxFhxQ==
X-Received: by 2002:a37:2c82:: with SMTP id s124mr200575qkh.130.1606951355454; 
	Wed, 02 Dec 2020 15:22:35 -0800 (PST)
Received: from localhost ([2620:10d:c091:480::1:ec0f])
	by smtp.gmail.com with ESMTPSA id
	h125sm169910qkc.36.2020.12.02.15.22.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Dec 2020 15:22:34 -0800 (PST)
Date: Wed, 2 Dec 2020 18:22:06 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <X8ghnnEfBZWG+nLr@mtj.duckdns.org>
References: <20201201165424.2030647-1-hch@lst.de>
	<20201201165424.2030647-10-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201201165424.2030647-10-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
	linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-block@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 9/9] block: use an xarray for disk->part_tbl
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 01, 2020 at 05:54:24PM +0100, Christoph Hellwig wrote:
> Now that no fast path lookups in the partition table are left, there is
> no point in micro-optimizing the data structure for it.  Just use a bog
> standard xarray.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks!

-- 
tejun

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


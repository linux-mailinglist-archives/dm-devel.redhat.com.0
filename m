Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 45F3440E7A9
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 19:34:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-eCtM5UPXN8CFii2z42Bk1Q-1; Thu, 16 Sep 2021 13:34:46 -0400
X-MC-Unique: eCtM5UPXN8CFii2z42Bk1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 583E019057A0;
	Thu, 16 Sep 2021 17:34:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 378AE19736;
	Thu, 16 Sep 2021 17:34:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84F5A4EA2A;
	Thu, 16 Sep 2021 17:34:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18GHSL6q010416 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 13:28:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5BB820A88AF; Thu, 16 Sep 2021 17:28:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1D0220A0535
	for <dm-devel@redhat.com>; Thu, 16 Sep 2021 17:28:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBAA2899ED0
	for <dm-devel@redhat.com>; Thu, 16 Sep 2021 17:28:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-6-OrA9-QWqPY6iNmmxRIEI7A-1;
	Thu, 16 Sep 2021 13:28:16 -0400
X-MC-Unique: OrA9-QWqPY6iNmmxRIEI7A-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id C64B1610E9;
	Thu, 16 Sep 2021 17:28:15 +0000 (UTC)
Date: Thu, 16 Sep 2021 10:28:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YUN+rv31Wm3+dfo+@sol.localdomain>
References: <20210913013135.102404-1-ebiggers@kernel.org>
	<20210913013135.102404-3-ebiggers@kernel.org>
	<YUGjSR1g+EH0o2xo@infradead.org> <YUIyVajIjZdkPO7F@sol.localdomain>
	<YUL0ytosYfrs7nNi@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YUL0ytosYfrs7nNi@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Satya Tangirala <satyaprateek2357@gmail.com>,
	dm-devel@redhat.com, linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 2/5] blk-crypto-fallback: consolidate static
	variables
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 16, 2021 at 08:39:54AM +0100, Christoph Hellwig wrote:
> On Wed, Sep 15, 2021 at 10:50:13AM -0700, Eric Biggers wrote:
> > Using "blk_crypto_fallback_*" for all these variables results in some pretty
> > long names, e.g. "blk_crypto_fallback_crypt_ctx_cache" and
> > "blk_crypto_fallback_num_prealloc_crypt_ctxs".  This proposal gives the best of
> > both worlds; the names are properly "namespaced" but there is also a shortcut to
> > refer to them (struct blk_crypto_fallback *fallback = &blk_crypto_fallback).
> 
> I'd just drop the second crypt in those.
> 
> > If this is going to be controversial I can just drop this patch, but I was
> > hoping there would be a way to make things more consistent.
> 
> I personally detest that pattern.  Not sure if that counts as
> controversial or even matters :)

The names are still pretty long even with the second "crypt" dropped from those
two.  How about just "fallback_*"?  It might be clear enough from the context.

Anyway, I've dropped this patch from the series for now.  This can be done later
we can agree on which approach to take.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


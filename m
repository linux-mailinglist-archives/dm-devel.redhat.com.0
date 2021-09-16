Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id 271DA40D40C
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 09:48:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-1V1DS40ZOWWIHT1py2SAMQ-1; Thu, 16 Sep 2021 03:48:31 -0400
X-MC-Unique: 1V1DS40ZOWWIHT1py2SAMQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52AD480416B;
	Thu, 16 Sep 2021 07:46:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B84CD5D9FC;
	Thu, 16 Sep 2021 07:46:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66F754EA29;
	Thu, 16 Sep 2021 07:46:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18G7kfl7019623 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 03:46:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 889112164DC0; Thu, 16 Sep 2021 07:46:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31D432041B30
	for <dm-devel@redhat.com>; Thu, 16 Sep 2021 07:46:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9234899EC4
	for <dm-devel@redhat.com>; Thu, 16 Sep 2021 07:46:37 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-248-glZmy1W7MYy71jXTMLPvFQ-1; Thu, 16 Sep 2021 03:46:36 -0400
X-MC-Unique: glZmy1W7MYy71jXTMLPvFQ-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1mQlzu-00GQSI-82; Thu, 16 Sep 2021 07:40:06 +0000
Date: Thu, 16 Sep 2021 08:39:54 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YUL0ytosYfrs7nNi@infradead.org>
References: <20210913013135.102404-1-ebiggers@kernel.org>
	<20210913013135.102404-3-ebiggers@kernel.org>
	<YUGjSR1g+EH0o2xo@infradead.org> <YUIyVajIjZdkPO7F@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <YUIyVajIjZdkPO7F@sol.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Satya Tangirala <satyaprateek2357@gmail.com>, linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 15, 2021 at 10:50:13AM -0700, Eric Biggers wrote:
> Using "blk_crypto_fallback_*" for all these variables results in some pretty
> long names, e.g. "blk_crypto_fallback_crypt_ctx_cache" and
> "blk_crypto_fallback_num_prealloc_crypt_ctxs".  This proposal gives the best of
> both worlds; the names are properly "namespaced" but there is also a shortcut to
> refer to them (struct blk_crypto_fallback *fallback = &blk_crypto_fallback).

I'd just drop the second crypt in those.

> If this is going to be controversial I can just drop this patch, but I was
> hoping there would be a way to make things more consistent.

I personally detest that pattern.  Not sure if that counts as
controversial or even matters :)

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DD61D15382E
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 19:32:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580927564;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t9qFxZFiXYFNINs2L3UJRSKsAIGxso5Zw20h/noRO9s=;
	b=RbXulXkQHnztvx3jRPF7rD7C01bevjGTEkEKFBHe7MRdWA3icoph5NYhfd5ApzkErx0cns
	O0hyIN9UWAKNlF19Fu0aOKezyEaQWJLKoJmjKCMz+gmV7E6LXBSzSo10/yzN96xUUlG17r
	2rSLOtsIAHxlekoNREZ0njjqMFo1jr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-v6DqWMEzNWKoLRwXChZSGQ-1; Wed, 05 Feb 2020 13:32:42 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D293B1007270;
	Wed,  5 Feb 2020 18:32:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 528F160C05;
	Wed,  5 Feb 2020 18:32:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 384248174F;
	Wed,  5 Feb 2020 18:32:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015IWC45018465 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:32:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 25C31203395F; Wed,  5 Feb 2020 18:32:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20825203C98C
	for <dm-devel@redhat.com>; Wed,  5 Feb 2020 18:32:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D79B80419A
	for <dm-devel@redhat.com>; Wed,  5 Feb 2020 18:32:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-30-MVNaoxF1Psy_W77W_Z_ojA-1; Wed, 05 Feb 2020 13:32:07 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1izPT3-0001K6-LJ; Wed, 05 Feb 2020 18:32:05 +0000
Date: Wed, 5 Feb 2020 10:32:05 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200205183205.GB26711@infradead.org>
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-3-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200203200029.4592-3-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: MVNaoxF1Psy_W77W_Z_ojA-1
X-MC-Unique: v6DqWMEzNWKoLRwXChZSGQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 015IWC45018465
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, hch@infradead.org, dan.j.williams@intel.com,
	dm-devel@redhat.com, linux-nvdimm@lists.01.org
Subject: Re: [dm-devel] [PATCH 2/5] s390,
 dax: Add dax zero_page_range operation to dcssblk driver
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
> index 63502ca537eb..f6709200bcd0 100644
> --- a/drivers/s390/block/dcssblk.c
> +++ b/drivers/s390/block/dcssblk.c
> @@ -62,6 +62,7 @@ static const struct dax_operations dcssblk_dax_ops = {
>  	.dax_supported = generic_fsdax_supported,
>  	.copy_from_iter = dcssblk_dax_copy_from_iter,
>  	.copy_to_iter = dcssblk_dax_copy_to_iter,
> +	.zero_page_range = dcssblk_dax_zero_page_range,
>  };
>  
>  struct dcssblk_dev_info {
> @@ -941,6 +942,12 @@ dcssblk_dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
>  	return __dcssblk_direct_access(dev_info, pgoff, nr_pages, kaddr, pfn);
>  }
>  
> +static int dcssblk_dax_zero_page_range(struct dax_device *dax_dev,pgoff_t pgoff,
> +				       unsigned offset, size_t len)
> +{
> +	return generic_dax_zero_page_range(dax_dev, pgoff, offset, len);
> +}

Wouldn't this need a forward declaration?  Then again given that dcssblk
is the only caller of generic_dax_zero_page_range we might as well merge
the two.  If you want to keep the generic one it could be wired up to
dcssblk_dax_ops directly, though.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 469BE6CF1E2
	for <lists+dm-devel@lfdr.de>; Wed, 29 Mar 2023 20:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680113347;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/FWl2voQkmVKR45HS2uBhAoOzHH5QktYob9g/MUTi6o=;
	b=gOo4+pE2lnwXpX0sbv1OEgniSnycbYsY3iGDQ/Cwg33ClUUScG7zLrNn2QvO961C0BvyH+
	hAQAqrC63F6ffi+q5/8DeBAk8F/w9j2Ix74z4tjk3fanAqpRjuqQ2qdGp4TBaoweUPwSIp
	+6hdFOM/lzBtse1x9KcRhaonWnBQUmg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-qWfcXLYyPy-J2dCumCvGqA-1; Wed, 29 Mar 2023 14:09:01 -0400
X-MC-Unique: qWfcXLYyPy-J2dCumCvGqA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD5DA85530C;
	Wed, 29 Mar 2023 18:08:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 968AE492B0A;
	Wed, 29 Mar 2023 18:08:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 67A6519465B3;
	Wed, 29 Mar 2023 18:08:39 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B87551946587
 for <dm-devel@listman.corp.redhat.com>; Wed, 29 Mar 2023 18:07:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C23FEC15BB8; Wed, 29 Mar 2023 18:07:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB378C15BA0
 for <dm-devel@redhat.com>; Wed, 29 Mar 2023 18:07:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F743811E7C
 for <dm-devel@redhat.com>; Wed, 29 Mar 2023 18:07:22 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-aiKzM_mGP2-j1SBEa3wURA-1; Wed,
 29 Mar 2023 14:07:21 -0400
X-MC-Unique: aiKzM_mGP2-j1SBEa3wURA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1phZu2-009drW-11; Wed, 29 Mar 2023 17:48:06 +0000
Date: Wed, 29 Mar 2023 18:48:05 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Message-ID: <ZCR51cLkBH4yrYEy@casper.infradead.org>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <87d0bf7d65cb7c64a0010524e5b39466f2b79870.1680108414.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
In-Reply-To: <87d0bf7d65cb7c64a0010524e5b39466f2b79870.1680108414.git.johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH 02/19] drbd: use __bio_add_page to add page
 to bio
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Andreas Gruenbacher <agruenba@redhat.com>,
 Song Liu <song@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, dm-devel@redhat.com, David Sterba <dsterba@suse.com>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 29, 2023 at 10:05:48AM -0700, Johannes Thumshirn wrote:
> +++ b/drivers/block/drbd/drbd_bitmap.c
> @@ -1043,9 +1043,11 @@ static void bm_page_io_async(struct drbd_bm_aio_ctx *ctx, int page_nr) __must_ho
>  	bio = bio_alloc_bioset(device->ldev->md_bdev, 1, op, GFP_NOIO,
>  			&drbd_md_io_bio_set);
>  	bio->bi_iter.bi_sector = on_disk_sector;
> -	/* bio_add_page of a single page to an empty bio will always succeed,
> -	 * according to api.  Do we want to assert that? */
> -	bio_add_page(bio, page, len, 0);
> +	/*
> +	 * __bio_add_page of a single page to an empty bio will always succeed,
> +	 * according to api.  Do we want to assert that?
> +	 */
> +	__bio_add_page(bio, page, len, 0);

Surely the comment should just be deleted?  With no return value to
check, what would you assert?

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


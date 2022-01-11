Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B95E248B579
	for <lists+dm-devel@lfdr.de>; Tue, 11 Jan 2022 19:11:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641924714;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c3WO7I4QMhppqQBDY9T5c3FRDVSxdVbwrbiedfjlD5o=;
	b=ICNzWnegqOKcYPMwkggjdr0OCTwjVkDL/GM1crYUwWWVYLP1tDofxbMPRfczYjALg1bozJ
	2oA21mQXJ6idF0SfvFjjjksCbSEAIr0Zrle1/saH1n87Q3P+6meWbDOT5h/CkjkfiRWXnC
	Ipr9KSWCXKyOS53ImrDKAWhubQ5unqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-2QSTgy3BMI-wsUhnaOAaOQ-1; Tue, 11 Jan 2022 13:11:51 -0500
X-MC-Unique: 2QSTgy3BMI-wsUhnaOAaOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 444DB83DD2D;
	Tue, 11 Jan 2022 18:11:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E554877457;
	Tue, 11 Jan 2022 18:11:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B8784BB7C;
	Tue, 11 Jan 2022 18:11:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20BIBfn1010878 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jan 2022 13:11:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 93F017FBBF; Tue, 11 Jan 2022 18:11:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from segfault.boston.devel.redhat.com
	(segfault.boston.devel.redhat.com [10.19.60.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B78107FBBE;
	Tue, 11 Jan 2022 18:11:27 +0000 (UTC)
From: Jeff Moyer <jmoyer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
References: <20211221141459.1368176-1-ming.lei@redhat.com>
	<20211221141459.1368176-3-ming.lei@redhat.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Tue, 11 Jan 2022 13:13:58 -0500
In-Reply-To: <20211221141459.1368176-3-ming.lei@redhat.com> (Ming Lei's
	message of "Tue, 21 Dec 2021 22:14:58 +0800")
Message-ID: <x49mtk2jg2h.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/3] block: add blk_alloc_disk_srcu
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ming Lei <ming.lei@redhat.com> writes:

> Add blk_alloc_disk_srcu() so that we can allocate srcu inside request queue
> for supporting blocking ->queue_rq().
>
> dm-rq needs this API.
>
> Signed-off-by: Ming Lei <ming.lei@redhat.com>

Reviewed-by: Jeff Moyer <jmoyer@redhat.com>

> ---
>  block/genhd.c         |  5 +++--
>  include/linux/genhd.h | 12 ++++++++----
>  2 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/block/genhd.c b/block/genhd.c
> index 3c139a1b6f04..d21786fbb7bb 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -1333,12 +1333,13 @@ struct gendisk *__alloc_disk_node(struct request_queue *q, int node_id,
>  }
>  EXPORT_SYMBOL(__alloc_disk_node);
>  
> -struct gendisk *__blk_alloc_disk(int node, struct lock_class_key *lkclass)
> +struct gendisk *__blk_alloc_disk(int node, bool alloc_srcu,
> +		struct lock_class_key *lkclass)
>  {
>  	struct request_queue *q;
>  	struct gendisk *disk;
>  
> -	q = blk_alloc_queue(node, false);
> +	q = blk_alloc_queue(node, alloc_srcu);
>  	if (!q)
>  		return NULL;
>  
> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
> index 6906a45bc761..20259340b962 100644
> --- a/include/linux/genhd.h
> +++ b/include/linux/genhd.h
> @@ -227,23 +227,27 @@ void blk_drop_partitions(struct gendisk *disk);
>  struct gendisk *__alloc_disk_node(struct request_queue *q, int node_id,
>  		struct lock_class_key *lkclass);
>  extern void put_disk(struct gendisk *disk);
> -struct gendisk *__blk_alloc_disk(int node, struct lock_class_key *lkclass);
> +struct gendisk *__blk_alloc_disk(int node, bool alloc_srcu,
> +		struct lock_class_key *lkclass);
>  
>  /**
> - * blk_alloc_disk - allocate a gendisk structure
> + * __alloc_disk - allocate a gendisk structure
>   * @node_id: numa node to allocate on
> + * @alloc_srcu: allocate srcu instance for supporting blocking ->queue_rq
>   *
>   * Allocate and pre-initialize a gendisk structure for use with BIO based
>   * drivers.
>   *
>   * Context: can sleep
>   */
> -#define blk_alloc_disk(node_id)						\
> +#define __alloc_disk(node_id, alloc_srcu)				\
>  ({									\
>  	static struct lock_class_key __key;				\
>  									\
> -	__blk_alloc_disk(node_id, &__key);				\
> +	__blk_alloc_disk(node_id, alloc_srcu, &__key);			\
>  })
> +#define blk_alloc_disk(node_id) __alloc_disk(node_id, false)
> +#define blk_alloc_disk_srcu(node_id) __alloc_disk(node_id, true)
>  void blk_cleanup_disk(struct gendisk *disk);
>  
>  int __register_blkdev(unsigned int major, const char *name,

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

